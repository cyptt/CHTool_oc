//
//  NULL_NILViewController.m
//  CHOCTool
//
//  Created by cyptt on 2020/10/26.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "NULL_NILViewController.h"
#import "NSObject+CHNotNull.h"
#import "CHModel.h"
#import "CHNullObject.h"
#import "CHNull.h"
@interface NULL_NILViewController ()

@end

@implementation NULL_NILViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *  test = nil;
    if ([test isEqualToString:@"dfddfd"]) {
        
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

   

    
   NSArray * arr =  [self fileJsonforPathString:@"person_register_guide_introduce"];
    NSDictionary * dic3 = arr[2];

    NSLog(@"titleName-----%@",dic3[@"titleName"]);
    
    NSString * titleName = dic3[@"titleName"];
    NSLog(@"titleName2222-------%@",titleName);
  


    @try{
        if([titleName isEqualToString:@"33333"]){
              
          }
          
    }@catch(NSException * expetion){
        NSLog(@"expetion-----%@",expetion);
    }
  
    if ([CHNull isNullAll:titleName]) {
        
    }
    
  
    
    

}

- (IBAction)errr:(id)sender {
    NSString * str;
    NSLog(@"%p",str);
    [self name:&str];
    
    NSLog(@"%p",str);

    NSLog(@"------------%@",str);
    
    
}

-(void)name:(NSString **)str{
 
    *str = @"ddfdfd";
    NSLog(@"-----%p",*str);
    NSLog(@"%@",*str);
    
    
}
- (IBAction)errorbtn:(UIButton *)sender {
    
    NSError * err;
    

//
//    err = [[NSError alloc]initWithDomain:@"dddd" code:1 userInfo:@{@"dd":@"34343"}];
    err =[NSError errorWithDomain:NSCocoaErrorDomain code:3322 userInfo:@{@"dd":@"34343"}];
    
    
    NSLog(@"%@",err);
    
    
    
}
-(NSArray *)fileJsonforPathString:(NSString *)pathString{
    NSString * jpath  = [[NSBundle mainBundle] pathForResource:pathString ofType:@"json"];
       NSDictionary * dic = [self dictionaryWithContentsOfFileString:jpath];
    
      NSLog(@"-----%@",dic);
    
     
    NSArray * arr = dic[@"data"];
   
    
  
   
    return arr;
}

-(NSDictionary *)dictionaryWithContentsOfFileString:(NSString *)filePathString{
    if (filePathString == nil) {
        
        return nil;
    }
    NSData *jsonData = [NSData dataWithContentsOfFile:filePathString];
    
    NSError *err;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingAllowFragments
                         
                                                          error:&err];
    
    if(err) {

        NSLog(@"json解析失败：%@",err);

        return nil;

    }
    
    return dic;
    
}

@end
