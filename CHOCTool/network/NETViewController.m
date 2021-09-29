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
static NSString *  const Base_url = @"http://192.168.1.55:8080/";
static NSString * const  GET_URL = @"user/test";
static NSString * const POST_JSON_URL = @"user/testPost";
static NSString * const POST_FROM_URL = @"user/testForm";
@implementation NETViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)get:(id)sender {

    NSDictionary *parameters = @{@"userName":@"zs!..%.&.%333",@"age":@"23"};
    NSString * urlSting = [NSString stringWithFormat:@"%@%@",Base_url,GET_URL];
    [[CHNetWork shareInstance]get_Url:urlSting parameters:parameters success:^(id  _Nonnull responseObj) {
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
    [[CHNetWork shareInstance]post_Url:urlSting parameters:parameters headersDic:headerDic success:^(id  _Nonnull responseObj) {
        NSLog(@"%@",responseObj);
    } failure:^(NSError * _Nonnull err) {
        NSLog(@"%@",err);
    }];

}
- (IBAction)postForm:(id)sender {
    NSDictionary * parameters = @{@"userName":@"33",@"age":@"f51d665d9242ce03a07dde11280ae133"};
   
    NSString * urlSting = [NSString stringWithFormat:@"%@%@",Base_url,POST_FROM_URL];
    

    [[CHNetWork shareInstance]post_Url:urlSting parameters:parameters headersDic:nil success:^(id  _Nonnull responseObj) {
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
    NSLog(@"----002%@",[NetCommonUtils formString:parameters]);
}








                      


@end
