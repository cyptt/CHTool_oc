//
//  NETViewController.m
//  CHOCTool
//
//  Created by cyptt on 2021/9/25.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "NETViewController.h"
#import "CHNativeNet.h"
#import "CHNativeUpload.h"
#import "CHFileManage.h"
#import "CHNativeCommonUtils.h"
#import "CHNativeDown.h"
#import "AFNetworking.h"

@interface NETViewController ()

@end
static NSString *  const Base_url = @"http://172.18.89.50:7772/tenface/";
static NSString * const  GET_URL = @"user/test";
static NSString * const POST_JSON_URL = @"user/testPost";
static NSString * const POST_FROM_URL = @"user/testForm";
@implementation NETViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)afget:(id)sender {
    AFHTTPSessionManager * manage = [AFHTTPSessionManager manager];
    NSDictionary *parameters = @{@"userName":@"zs!..%.&.%333",@"age":@"23"};
    NSString * urlSting = [NSString stringWithFormat:@"%@%@",Base_url,GET_URL];
    [manage GET:urlSting parameters:parameters headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}

- (IBAction)afpostJson:(id)sender {
    NSDictionary * parameters = @{@"userName":@"33",@"age":@"f51d665d9242ce03a07dde11280ae133"};
    NSString * urlSting = [NSString stringWithFormat:@"%@%@",Base_url,POST_JSON_URL];
    
    AFHTTPSessionManager * manage =[AFHTTPSessionManager manager];
   
//    NSString * bodyString = [NetCommonUtils formString:parameters];
//   NSData *  bodyData = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
    
    manage.requestSerializer = [AFJSONRequestSerializer serializer];
    NSDictionary * headerDic = @{@"Content-Type":@"application/json;charset=UTF-8"};
    [manage POST:urlSting parameters:parameters headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}
- (IBAction)afpost:(id)sender {
    NSDictionary * parameters = @{@"userName":@"33",@"age":@"f51d665d9242ce03a07dde11280ae133"};
    NSString * urlSting = [NSString stringWithFormat:@"%@%@",Base_url,POST_JSON_URL];
    
    AFHTTPSessionManager * manage =[AFHTTPSessionManager manager];
//    NSDictionary * headerDic = @{@"Content-Type":@"application/json;charset=UTF-8"};
    [manage POST:urlSting parameters:parameters headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
- (IBAction)afupload:(id)sender {
    
    AFHTTPSessionManager * manage = [AFHTTPSessionManager manager];
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"chuqi" ofType:@"mp4"];
    NSArray * files = @[path];
    NSArray * fileNames = @[@"image1.png"];
    NSDictionary * params = @{@"name":@"dddd"};
    
    NSString * url = [NSString stringWithFormat:@"%@user/upload",Base_url];
    [manage POST:url parameters:params headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSLog(@"%@",formData);
        [formData appendPartWithFileURL:[NSURL fileURLWithPath:path] name:@"file" error:nil];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

- (IBAction)afdown:(id)sender {
    AFHTTPSessionManager * manage = [AFHTTPSessionManager manager];
    
    NSDictionary * params = @{@"fileName":@"1633923502145001.png"};
    
    
    NSString * lastUrlStr = [NSString stringWithFormat:@"%@?%@",[NSString stringWithFormat:@"%@user/down",Base_url],[CHNativeCommonUtils formString:params]];
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:lastUrlStr]];
 
    [[manage downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
            //拼接缓存目录
            NSString *downloadDir = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"Download"];
            //打开文件管理器
            NSFileManager *fileManager = [NSFileManager defaultManager];
            //创建Download目录
            [fileManager createDirectoryAtPath:downloadDir withIntermediateDirectories:YES attributes:nil error:nil];
            //拼接文件路径
            NSString *filePath = [downloadDir stringByAppendingPathComponent:response.suggestedFilename];
            return  [NSURL fileURLWithPath:filePath];
        } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
            
            NSLog(@"%@",filePath);
        }] resume];
    
}



- (IBAction)get:(id)sender {

    NSDictionary *parameters = @{@"userName":@"zs!..%.&.%333",@"age":@"23"};
    NSString * urlSting = [NSString stringWithFormat:@"%@%@",Base_url,GET_URL];
    [[CHNativeNet shareInstance]get_Url:urlSting parameters:parameters success:^(id  _Nonnull responseObj) {
        NSLog(@"%@",responseObj);
        
    } failure:^(NSError * _Nonnull err) {
        NSLog(@"%@",err);
    }];
}

/**
 json
 */
- (IBAction)postJson:(id)sender {
    NSDictionary * parameters = @{@"userName":@"33",@"age":@"f51d665d9242ce03a07dde11280ae133"};
    NSString * urlSting = [NSString stringWithFormat:@"%@%@",Base_url,POST_JSON_URL];
  
    
    NSDictionary * headerDic = @{@"Content-Type":@"application/json;charset=UTF-8"};
    
    [[CHNativeNet shareInstance]post_Url:urlSting parameters:parameters headersDic:headerDic success:^(id  _Nonnull responseObj) {
        NSLog(@"%@",responseObj);
    } failure:^(NSError * _Nonnull err) {
        NSLog(@"%@",err);
    }];

}
- (IBAction)postForm:(id)sender {
    NSDictionary * parameters = @{@"userName":@"33",@"age":@"f51d665d9242ce03a07dde11280ae133"};
   
    NSString * urlSting = [NSString stringWithFormat:@"%@%@",Base_url,POST_FROM_URL];
    

    [[CHNativeNet shareInstance]post_Url:urlSting parameters:parameters headersDic:nil success:^(id  _Nonnull responseObj) {
        NSLog(@"%@",responseObj);
    } failure:^(NSError * _Nonnull err) {
        NSLog(@"%@",err);
    }];
}


- (IBAction)upload:(id)sender {
//    NSString * path = [[NSBundle mainBundle] pathForResource:@"face_scca" ofType:@"png"];
    NSString * path = [[NSBundle mainBundle] pathForResource:@"chuqi" ofType:@"mp4"];
    NSArray * files = @[path];
    NSArray * fileNames = @[@"image1.png"];
    NSDictionary * params = @{@"name":@"dddd"};

    [[CHNativeUpload shareInstance] uploadFileWithUrl:[NSString stringWithFormat:@"%@user/upload",Base_url] mutipartFilePaths:files mutipartFileNames:nil parameters:params success:^(id  _Nonnull reponseObj) {
        NSLog(@"%@",reponseObj);
    } failure:^(NSError * _Nonnull err) {
        
    }progress:^(float precent) {
        NSLog(@"---%f",precent);
    }];
   
}
- (IBAction)down:(id)sender {
    
    NSDictionary * params = @{@"fileName":@"1633923502145001.png"};
    [[CHNativeDown shareInstance] downWithUrl:[NSString stringWithFormat:@"%@user/down",Base_url] params:params success:^(id  _Nonnull responseObj) {
        NSLog(@"%@",responseObj);
    } failure:^(NSError * _Nonnull err) {
        
    } progress:^(float precent) {
        NSLog(@"%f",precent);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
 
     
    NSMutableString * mutableUrl = [[NSMutableString alloc]init];
    NSDictionary *parameters = @{@"name":@"zs!&",@"age":@"23"};
    if ([parameters allKeys]) {
        [mutableUrl appendString:@"?"];
        for (id key in parameters) {
            NSString *value = [[parameters objectForKey:key] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
            [mutableUrl appendString:[NSString stringWithFormat:@"%@=%@&", key, value]];
        }
    }
    
    
    NSLog(@"----001%@",mutableUrl);
    NSLog(@"----002%@",[CHNativeCommonUtils formString:parameters]);
}








                      


@end
