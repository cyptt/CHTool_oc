//
//  CHDown.m
//  CHOCTool
//
//  Created by cyptt on 2021/9/28.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "CHDown.h"
#import "NetCommonUtils.h"
@interface CHDown()<NSURLSessionDownloadDelegate>
@property (nonatomic, strong) NSURLSessionDownloadTask *downloadTask;
@property (nonatomic, strong) NSData *resumData;
@property (nonatomic, strong) NSURLSession *session;

@property(nonatomic,copy)void(^progressBock)(float precert);
@property(nonatomic,copy)void(^successB) (id responseObj);
@property(nonatomic,copy)void(^failureB) (NSError * error);
@property(nonatomic,strong) NSString *fullPath ;
@end
static CHDown *_chDown = nil;
@implementation CHDown

+(instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_chDown == nil) {
            _chDown = [[self alloc]init];
            
         
        }
    });
    return _chDown;
}

-(void)downWithUrl:(NSString *)urlStr params:( NSDictionary * __nullable)params success:(void(^ __nullable)(id responseObj))success failure:(void(^ __nullable)(NSError * err))failure progress:(void(^ __nullable)(float precent))progress {

    self.successB = success;
    self.failureB = failure;
    self.progressBock = progress;
    NSString * paramsStr = [NetCommonUtils formString:params];
    
    NSString * lastUrlStr = [NSString stringWithFormat:@"%@?%@",urlStr,paramsStr];
    NSURL *url = [NSURL URLWithString:lastUrlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];

    self.session= [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue] ];
    
    self.downloadTask= [self.session downloadTaskWithRequest:request ];
    [self.downloadTask resume];
}

//暂停下载  可以恢复
- (void)suspendBtnClick
{
    NSLog(@"+++++++++++++++++++暂停");
    [self.downloadTask suspend];
}
 
//cancel:取消是不能恢复
//cancelByProducingResumeData:是可以恢复
- (void)cancelBtnClick
{
    NSLog(@"+++++++++++++++++++取消");
    //[self.downloadTask cancel];
    
    //恢复下载的数据!=文件数据
    [self.downloadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        self.resumData = resumeData;
    }];
}

//恢复下载
- (void)goOnBtnClick
{
    NSLog(@"+++++++++++++++++++恢复下载");
    if(self.resumData)
    {
        self.downloadTask = [self.session downloadTaskWithResumeData:self.resumData];
    }
    
    [self.downloadTask resume];
}


#pragma mark --- NSURLSessionDownloadDelegate
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
                                           didWriteData:(int64_t)bytesWritten
                                      totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    float progress = (float)1.0*totalBytesWritten / totalBytesExpectedToWrite;
    
    if (self.progressBock) {
        self.progressBock(progress);
    }
}

- (void)URLSession:(nonnull NSURLSession *)session downloadTask:(nonnull NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(nonnull NSURL *)location {
    //6.1 拼接文件全路径
    self.fullPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:downloadTask.response.suggestedFilename];
    
    //6.2 剪切文件
    [[NSFileManager defaultManager]moveItemAtURL:location toURL:[NSURL fileURLWithPath:self.fullPath] error:nil];

    
//    if ([httpResponse statusCode] == 200 ||[httpResponse statusCode] ==201 ) {
//        success(fullPath);
//    }
}


- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (!error) {
        NSLog(@"请求成功");
        if(self.successB){
            self.successB(   self.fullPath );
        }
    }else{
        NSLog(@"请求失败");
        if(self.failureB){
            self.failureB(error);
        }
    }
    
}
@end
