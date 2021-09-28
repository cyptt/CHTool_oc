//
//  NETViewController.m
//  CHOCTool
//
//  Created by cyptt on 2021/9/25.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "NETViewController.h"
#import "CHNetWork.h"
#import "CHUpload.h"
@interface NETViewController ()

@end


@implementation NETViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)get:(id)sender {
    NSDictionary * parameters = @{@"userName":@"33",@"age":@"f51d665d9242ce03a07dde11280ae133"};
    NSString * urlSting = @"http://192.168.1.74:8080/user/test";
    NSMutableString *mutableUrl = [[NSMutableString alloc] initWithString:urlSting];
    if ([parameters allKeys]) {
        [mutableUrl appendString:@"?"];
        for (id key in parameters) {
            NSString *value = [[parameters objectForKey:key] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
            [mutableUrl appendString:[NSString stringWithFormat:@"%@=%@&", key, value]];
        }
    }
  

    NSURL * url = [NSURL URLWithString:urlSting];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
  
    NSURLSessionDataTask * task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"---currentthread%@",[NSThread currentThread]);
        NSLog(@"response-----%@",response);
        NSLog(@"error----%@",error);
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"dict-----%@",dict);
    }];
    [task resume];
}
- (IBAction)post2:(id)sender {
    NSDictionary * parameters = @{@"userName":@"33",@"age":@"f51d665d9242ce03a07dde11280ae133"};
    NSString * urlSting = @"http://192.168.1.74:8080/user/testPost";
   
    
    

    
    NSURL * url = [NSURL URLWithString:urlSting];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";

    NSString * bodyString = [self formString:parameters];
    
    request.HTTPBody = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionDataTask * task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"response-----%@",response);
        NSLog(@"error----%@",error);
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"dict-----%@",dict);
    }];
    [task resume];
}

/**
 json
 */
- (IBAction)post:(id)sender {
    NSDictionary * parameters = @{@"userName":@"33",@"age":@"f51d665d9242ce03a07dde11280ae133"};
    NSString * urlSting = @"http://192.168.1.74:8080/user/testJson";
  
    NSURL * url = [NSURL URLWithString:urlSting];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    request.HTTPMethod = @"POST";

    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil];
    
    request.HTTPBody = jsonData ;
    NSURLSessionDataTask * task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"response-----%@",response);
        NSLog(@"error----%@",error);
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"dict-----%@",dict);
    }];
    [task resume];
}
- (IBAction)upload:(id)sender {
//    NSString * path = [[NSBundle mainBundle] pathForResource:@"face_scca" ofType:@"png"];
    NSString * path = [[NSBundle mainBundle] pathForResource:@"chuqi" ofType:@"mp4"];
    NSArray * files = @[path];
    NSArray * fileNames = @[@"image1.png"];
    NSDictionary * params = @{@"name":@"dddd"};

    [CHUpload.new uploadFileWithUrl:@"http://192.168.1.74:8080/user/upload" mutipartFilePaths:files mutipartFileNames:nil parameters:params success:^(id  _Nonnull reponseObj) {
        NSLog(@"%@",reponseObj);
    } failure:^(NSError * _Nonnull err) {
        
    }progress:^(float precent) {
        NSLog(@"---%f",precent);
    }];
   
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"face_scca" ofType:@"png"];
    NSLog(@"-----%@",path);
    NSString * boundary = @"----WebKitFormBoundaryftnnT7s3iF7wV5q6";
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.74:8080/user/upload"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    
    [request setValue:[NSString stringWithFormat:@"multipart/form-data;boundary=%@",boundary] forHTTPHeaderField:@"Content-Type"];
    
    // 给请求头加入固定格式数据
    NSMutableData *data = [NSMutableData data];
    
    /****************文件参数相关设置*********************/
    // 设置边界 注：必须和请求头数据设置的边界 一样， 前面多两个“-”；（字符串 转 data 数据）
    
    [data appendData:[[NSString stringWithFormat:@"--%@",boundary] dataUsingEncoding:NSUTF8StringEncoding]];

    [data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    // 设置传入数据的基本属性， 包括有 传入方式 data ，传入的类型（名称） ，传入的文件名， 。
    [data appendData:[@"Content-Disposition: form-data; name=\"file\"; filename=\"image.png\"" dataUsingEncoding:NSUTF8StringEncoding]];
    [data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
 
    // 设置 内容的类型  “文件类型/扩展名” MIME中的
    [data appendData:[@"Content-Type: image/png" dataUsingEncoding:NSUTF8StringEncoding]];
    [data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    // 加入数据内容
  
    NSData *contentData = [NSData dataWithContentsOfFile:path];
    [data appendData:contentData];
    [data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];

    

    
    /******************非文件参数相关设置**********************/
    // 设置边界
//     [data appendData:[[NSString stringWithFormat:@"--%@",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//     [data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    //退出
    [data appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    

    
    request.HTTPBody = data;
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionUploadTask * task = [session uploadTaskWithRequest:request fromData:data completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
        NSLog(@"%@",response);
        NSLog(@"%@",error);
    }];
    [task resume];
}
- (NSString*)formString:(NSDictionary*)formDict {
    NSLog(@"-formDict------%@",formDict);
    if (!formDict || [formDict allKeys].count==0) {
        return @"";
    }
    NSMutableString *formStr = [NSMutableString string];
    if (formDict) {
        [[formDict allKeys] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *objStr = (NSString*)obj;
            id value = formDict[objStr];
            if ([value isKindOfClass:[NSString class]]) {
                [formStr appendFormat:@"%@=%@&", objStr, (__bridge NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)value,NULL,CFSTR(":/?#[]@!$&’()*+,;="),kCFStringEncodingUTF8)];
            }
            if ([value isKindOfClass:[NSArray class]]) {
                for (NSString *val in value) {
                    [formStr appendFormat:@"%@=%@&", objStr, (__bridge NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)val,NULL,CFSTR(":/?#[]@!$&’()*+,;="),kCFStringEncodingUTF8)];
                }
            }
        }];
        
        
    }
    
    //    return [[[formStr substringWithRange:NSMakeRange(0, formStr.length-1)] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]] dataUsingEncoding:NSUTF8StringEncoding];
    return [formStr substringWithRange:NSMakeRange(0, formStr.length-1)];
}


/**
 上传文件
 */
-(void)uploadFileWithUrl:(NSString *)url parameters:(NSDictionary *)parameters filesArr:(NSArray *)filesArr fieldNameArr:(NSArray *)fieldNameArr{
    NSString *boundary = @"----WebKitFormBoundaryftnnT7s3iF7wV5q6";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    
    //-----------
    
    
    
    
    
    //-----------
    // 设置ContentType
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [request setValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    NSArray *fieldNames = fieldNameArr;
    NSData *httpBody = [self createBodyWithBoundary:boundary parameters:parameters paths:filesArr fieldName:fieldNames];
    
    NSURLSessionUploadTask *task = [[NSURLSession sharedSession] uploadTaskWithRequest:request fromData:httpBody completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"error = %@", error);
            
            return;
        }
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"FlyElephant-返回结果---result = %@", result);
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
  
        NSString * lastmimetype =[self getmMimeType:path].length?[self getmMimeType:path]:mimetype;
       
         
        [httpBody appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [httpBody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\n", @"file", filename] dataUsingEncoding:NSUTF8StringEncoding]];
        [httpBody appendData:[[NSString stringWithFormat:@"Content-Type: %@\r\n\r\n", lastmimetype] dataUsingEncoding:NSUTF8StringEncoding]];
        NSLog(@"mimetype---------%@",[NSString stringWithFormat:@"Content-Type: %@\r\n\r\n", lastmimetype]);
        [httpBody appendData:data];
        [httpBody appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
          i++;
    }
    
    [httpBody appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    return httpBody;
}
-(NSString *)getmMimeType:(NSString *)path{
    NSURL * url = [NSURL fileURLWithPath:path];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    NSHTTPURLResponse * response = nil;
     [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
     return response.MIMEType;
}

@end
