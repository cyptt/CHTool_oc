//
//  RuntimeViewController.m
//  CHOCTool
//
//  Created by cyptt on 2020/9/18.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "RuntimeViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import <objc/objc.h>
#import "TestRuntime.h"
#import "RuntimeSon.h"
@interface RuntimeViewController ()

@end

@implementation RuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
/**
 发送消息
 */
- (IBAction)sendMessageBtnClick:(UIButton *)sender {
    Class sccapiCls = objc_getClass("TestRuntime");
    ((void(*)(id,SEL,NSString *))(void*)objc_msgSend)(sccapiCls.new,@selector(test:),@"test");
}

/**
 获取属性列表
 */
- (IBAction)properttListClick:(UIButton *)sender {
    unsigned int count;
    objc_property_t * pList = class_copyPropertyList([TestRuntime class],&count );
    for (unsigned int i = 0; i<count; i++) {
        const char *propertyName = property_getName(pList[i]);
             NSLog(@"propertyName(%d) : %@", i, [NSString stringWithUTF8String:propertyName]);
    }
    free(pList);
}

/**
 获取方法列表
 */
- (IBAction)methodListClick:(UIButton *)sender {
    
    unsigned int count;
    Method * mList = class_copyMethodList([TestRuntime class],&count );
    for (unsigned int i = 0; i<count; i++) {
        Method method = mList[i];
        NSLog(@"method(%d) : %@", i, NSStringFromSelector(method_getName(method)));
    }
    free(mList);
}

/**
 获取成员变量
 */
- (IBAction)chengyuanProperyListClick:(UIButton *)sender {
    
    unsigned int count;
       
       Ivar *ivarList = class_copyIvarList([TestRuntime class], &count);
       for (unsigned int i = 0; i < count; i++) {
           Ivar myIvar = ivarList[i];
           const char *ivarName = ivar_getName(myIvar);
           NSLog(@"ivar(%d) : %@", i, [NSString stringWithUTF8String:ivarName]);
       }
       
       free(ivarList);
}
- (IBAction)protocolListClick:(UIButton *)sender {
}
- (IBAction)changSiyouProp:(id)sender {
    TestRuntime * tR = [[TestRuntime alloc]init];
    
    unsigned int count;
    Ivar *ivarList = class_copyIvarList([TestRuntime class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Ivar myIvar = ivarList[i];
        const char *ivarName = ivar_getName(myIvar);
        
        if (strcmp(ivarName, "neiName")==0) {
            object_setIvar(tR, myIvar, @"私有属性改变了");
        }
        NSLog(@"ivar(%d) : %@", i, [NSString stringWithUTF8String:ivarName]);
    }
    [tR chagePrivateProperty];
}
- (IBAction)kvcchangePrivateProperty:(id)sender {
    TestRuntime * tR = [[TestRuntime alloc]init];
    [tR setValue:@"私有属性改变了" forKey:@"neiName"];
    [tR chagePrivateProperty];
}
- (IBAction)runtimeSun:(id)sender {
    
    RuntimeSon * rSon = [[RuntimeSon alloc]init];
    
 


//    [rSon setValue:@"私有属性改变了" forKey:@"neiName"];
    [rSon chagePrivateProperty];
    

}
- (IBAction)interfaceEx:(id)sender {
    
    TestRuntime * tR = [[TestRuntime alloc]init];
    [tR interfacePerson];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}
@end
