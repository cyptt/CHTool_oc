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
#import "CHProgressHUD.h"

@interface NULL_NILViewController ()
@property (weak, nonatomic) IBOutlet UILabel *showMsgL;

@end

@implementation NULL_NILViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *  test = nil;
    if ([test isEqualToString:@"dfddfd"]) {
        
    }
    
    //nil 打印 （null）
    // NSNull  打印<null>   在ui上会导致carsh
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

   

    
        NSDictionary * dic =  [self fileJsonforPathString:@"person_register_guide_introduce"];
        
        
        
        NSLog(@"-----dic%@",dic);

        NSLog(@"dic_message%@",dic[@"message"]);
        NSLog(@"dic_null%@",dic[@"null"]);
        
        NSString * message = dic[@"message"];
    
    NSLog(@"-----message---%@",message);
        
        NSString * dic_null = dic[@"null"];
    


    self.showMsgL.text =message;
    NSLog(@"----message2------%@",message);
    
    
    
    
    
    
    if ([CHNull isNullAll:message]) {
        
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
-(NSDictionary *)fileJsonforPathString:(NSString *)pathString{
    NSString * jpath  = [[NSBundle mainBundle] pathForResource:pathString ofType:@"json"];
    NSLog(@"--filepath%@",jpath);
       NSDictionary * dic = [self dictionaryWithContentsOfFileString:jpath];
    
          NSLog(@"-----%@",dic);
    

    
     
    
//    NSArray * arr = dic[@"data"];
   
    
    
  
   
    return dic;
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
