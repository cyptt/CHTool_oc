//
//  main.m
//  CHOCTool
//
//  Created by cyptt on 2020/1/8.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <objc/objc.h>

int main(int argc, char * argv[]) {
    
//    
//    int var_runoob = 10;
//    int *p;              // 定义指针变量
//    p = &var_runoob;
//    printf("var_runoob 变量的地址： %p\n", p);
//
//    printf("%p\n", &var_runoob);
//    printf("----\n");
//    printf("--%d\n", var_runoob);
//    printf("结果-%d\n", *p);

    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);




    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
