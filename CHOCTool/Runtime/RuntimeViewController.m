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
#import "NSObject+property.h"

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

/**
 改变私有属性
 */
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
/**
 方法交换
 */
- (IBAction)changMeth:(id)sender {
    
    
    UIImage * image = [UIImage imageNamed:nil];
    
    
    
}

/**
 动态添加方法
 */
//如果一个类方法非常多，加载类到内存的时候也比较耗费资源，需要给每个方法生成映射表，
//可以使用动态给某个类，添加方法解决
- (IBAction)addMedth:(id)sender {
    
    Class cls = objc_getClass("TestRuntime");
    
    [cls.new  performSelector:@selector(eat:) withObject:@"canshu"];
  
}
- (IBAction)addProp:(id)sender {
    
    NSObject * obj = [[NSObject alloc]init];
    obj.name = @"张三";
    NSLog(@"%@",obj.name);
}
- (IBAction)kvcchangePrivateProperty:(id)sender {
    TestRuntime * tR = [[TestRuntime alloc]init];
    [tR setValue:@"私有属性改变了" forKey:@"neiName"];
    [tR chagePrivateProperty];
}
- (IBAction)runtimeSun:(id)sender {
    
   
    

}
- (IBAction)interfaceEx:(id)sender {
    
    TestRuntime * tR = [[TestRuntime alloc]init];
    [tR interfacePerson];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}
@end
