//
//  CHNetWork.m
//  CHOCTool
//
//  Created by cyptt on 2021/9/25.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "CHNativeNet.h"
#import "CHNativeCommonUtils.h"
#import "CHNattiveError.h"

@interface CHNativeNet ()<NSURLSessionDelegate,NSURLSessionTaskDelegate>

@end
@implementation CHNativeNet

static CHNativeNet *_chNetwork= nil;
+(instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_chNetwork == nil) {
            _chNetwork = [[self alloc]init];
        
        }
    });
    return _chNetwork;
}


-(void)netCallBack:(NSData *)data response:(NSURLResponse *)response error:(NSError *)error success:(void(^ __nullable)(id responseObj))success failure:(void(^ __nullable)(NSError * err))failure{
    NSInteger statusCode = [(NSHTTPURLResponse *)response  statusCode];
    
    if (statusCode == 200) {
        id  responseObject = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];

        if (responseObject) {
            success(responseObject);
        }
     
    }else{
  
        if (error != nil) {
            failure(error);
        }else{
            NSLog(@"%@",response);
            NSError * error2 = [CHNattiveError error:nil code:statusCode];
            failure(error2);
            
        }

    }
}
-(void)get_Url:(NSString *)urlStr parameters:(NSDictionary *)parameters success:(void(^ __nullable)(id responseObj))success failure:(void(^ __nullable)(NSError * err))failure{
  
    NSString * urlSting =urlStr;
    NSMutableString *mutableUrl = [[NSMutableString alloc] initWithString:urlSting];
 
    [mutableUrl appendString:@"?"];
    [mutableUrl appendString:[CHNativeCommonUtils formString:parameters]];
    
    
    NSURL * url = [NSURL URLWithString:mutableUrl];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
    
    NSURLSession * session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask * task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self netCallBack:data response:response error:error success:success failure:failure];
         
        });

    }];
    [task resume];
}


-(void)post_Url:(NSString *)urlStr parameters:(NSDictionary * )parameters headersDic:(NSDictionary * __nullable)headersDic success:(void(^ __nullable)(id responseObj))success failure:(void(^ __nullable)(NSError * err))failure{
    
    NSURL * url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    
    if (headersDic && [headersDic allKeys]) {
        for (id key in [headersDic allKeys]) {
            NSString * value = [headersDic objectForKey:key] ;
            [request setValue:value forHTTPHeaderField:key];
        }
    }
    NSData *bodyData ;
    if (headersDic && [headersDic[@"Content-Type"] containsString:@"application/json"]) {
        bodyData = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil];
    }else{
        NSString * bodyString = [CHNativeCommonUtils formString:parameters];
        bodyData = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
    }
    request.HTTPMethod = @"POST";
    request.HTTPBody = bodyData ;
    NSURLSessionDataTask * task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self netCallBack:data response:response error:error success:success failure:failure];
            
        });    }];
    
    [task resume];
}




@end
