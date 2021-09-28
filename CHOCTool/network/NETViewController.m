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
#import "CHFileManage.h"
#import "NetCommonUtils.h"
#import "CHDown.h"
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

    NSString * bodyString = [NetCommonUtils formString:parameters];
    
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

    [[CHUpload shareInstance] uploadFileWithUrl:@"http://192.168.1.74:8080/user/upload" mutipartFilePaths:files mutipartFileNames:nil parameters:params success:^(id  _Nonnull reponseObj) {
        NSLog(@"%@",reponseObj);
    } failure:^(NSError * _Nonnull err) {
        
    }progress:^(float precent) {
        NSLog(@"---%f",precent);
    }];
   
}
- (IBAction)down:(id)sender {
    
    NSDictionary * params = @{@"fileName":@"1632818148357001.png"};
    [[CHDown shareInstance] downWithUrl:@"http://192.168.1.74:8080/user/down" params:params success:^(id  _Nonnull responseObj) {
            
        } failure:^(NSError * _Nonnull err) {
            
        } progress:^(float precent) {
            NSLog(@"%f",precent);
        }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
   
}






                      


@end
