//
//  CHUpload.m
//  CHOCTool
//
//  Created by cyptt on 2021/9/28.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "CHUpload.h"
#import "NetCommonUtils.h"
@interface CHUpload ()<NSURLSessionTaskDelegate,NSURLSessionDelegate>

@property(nonatomic,copy)void(^progressBock)(float precert);
@end
static CHUpload *_chUpload = nil;
@implementation CHUpload
+(instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_chUpload == nil) {
            _chUpload = [[self alloc]init];
            
         
        }
    });
    return _chUpload;
}

-(void)uploadFileWithUrl:(NSString *)url mutipartFilePaths:(NSArray *)mutipartFilePaths mutipartFileNames:(NSArray * __nullable)mutipartFileNames parameters:(NSDictionary * __nullable)parameters success:(void(^ __nullable)(id responseObj))success failure:(void(^ __nullable)(NSError * err))failure progress:(void(^)(float precent))progress{
    
    self.progressBock = progress;
    NSString *boundary = @"----WebKitFormBoundaryftnnT7s3iF7wV5q6";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
   
    // 设置ContentType
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [request setValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    NSData *httpBody = [self createBodyWithBoundary:boundary parameters:parameters paths:mutipartFilePaths fieldName:mutipartFileNames];
    
    NSURLSession * session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue] ];
    NSURLSessionUploadTask *task = [session uploadTaskWithRequest:request fromData:httpBody completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                NSLog(@"error = %@", error);
                if (failure) {
                    failure(error);
                }
                return;
            }
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            if (success) {
                success(dict);
            }
            NSLog(@"%@",[NSThread currentThread]);
        });
        
    }];
    
    [task resume];
}

- (NSData *)createBodyWithBoundary:(NSString *)boundary
                        parameters:(NSDictionary *)parameters
                             paths:(NSArray *)paths
                         fieldName:(NSArray *)fieldNames {
    NSMutableData *httpBody = [NSMutableData data];
    
    // 文本参数
    
    [parameters enumerateKeysAndObjectsUsingBlock:^(NSString *parameterKey, NSString *parameterValue, BOOL *stop) {
        [httpBody appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [httpBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", parameterKey] dataUsingEncoding:NSUTF8StringEncoding]];
        [httpBody appendData:[[NSString stringWithFormat:@"%@\r\n", parameterValue] dataUsingEncoding:NSUTF8StringEncoding]];
    }];
    
    // 本地文件的NSData
    int i =0;
    
    for (NSString *path in paths) {
        
        NSData   *data  = nil;
        NSString *filename  = [path lastPathComponent];
        if ([path containsString:@"file:///private"]) {
          NSString * lastPath =  [path stringByReplacingOccurrencesOfString:@"file:///private" withString:@""];
             data = [NSData dataWithContentsOfFile:lastPath];
        }else{
            data = [NSData dataWithContentsOfFile:path];
        }
          
        NSString *mimetype  =@"image/jpeg";
  
        NSString * lastmimetype =[NetCommonUtils getmMimeType:path].length?[NetCommonUtils getmMimeType:path]:mimetype;
       
         
        [httpBody appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        
        [httpBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n",fieldNames[i]?fieldNames[i]:@"file" , filename] dataUsingEncoding:NSUTF8StringEncoding]];
        [httpBody appendData:[[NSString stringWithFormat:@"Content-Type: %@\r\n\r\n", lastmimetype] dataUsingEncoding:NSUTF8StringEncoding]];
    
        [httpBody appendData:data];
        [httpBody appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
          i++;
    }
    
    [httpBody appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    return httpBody;
}

#pragma mark --- NSURLSessionTaskDelegate
/**
 *  监听上传进度
 *
 *  @param session session
 *  @param task                     上传任务
 *  @param bytesSent                当前这次发送的数据
 *  @param totalBytesSent           已经发送的总数据
 *  @param totalBytesExpectedToSend 期望发送的总数据
 */
-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend{
    float progress = (float)1.0*totalBytesSent / totalBytesExpectedToSend;

    if (self.progressBock) {
        self.progressBock(progress);
    }
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    NSLog(@"%s",__func__);
}

- (void)URLSession:(__unused NSURLSession *)session
          dataTask:(__unused NSURLSessionDataTask *)dataTask
    didReceiveData:(NSData *)data
{
    
}




@end
