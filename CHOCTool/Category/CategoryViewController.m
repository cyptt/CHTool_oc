//
//  CategoryViewController.m
//  CHOCTool
//
//  Created by cyptt on 2021/5/10.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "CategoryViewController.h"
//#import "CHObject.h"
#import "CHObject+Obj1.h"
#import <objc/runtime.h>

@interface CategoryViewController ()

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
   
}
- (IBAction)btnClick:(id)sender {
    CHObject * obj = [CHObject new];
   
    
    [self invokeOriginalMethod:obj selector:@selector(test)];
//    [obj test];
    
    
}

//遇到一个问题，写了一个分类，但原先类的属性不够用。添加一个属性，调用的时候崩溃了，说是找不到getter、setter方法。查了下文档发现，OC的分类允许给分类添加属性，但不会自动生成getter、setter方法。有没有解决方案呢？有，通过运行时建立关联引用。
- (IBAction)proprotyBtnClick:(UIButton *)sender {
    CHObject * obj = [[CHObject alloc]init];
    

    obj.name2 = @"dfdfd";
    NSLog(@"%@",obj.name2);
    
  
    
}

/**
 如果一个类的分类重写了这个类的方法后，那么这个类的这个方法将失效，起作用的将会是分类的那个重写方法，在分类重写的时候 Xcode 也会给出相应警告。
 
 实际上，Category 并没有覆盖主类的同名方法，只是 Category 的方法排在方法列表前面，而主类的方法被移到了方法列表的后面。
 于是，我们可以在 Category 方法里，利用 Runtime 提供的 API，从方法列表里拿回原方法，从而调用


 */
- (void)invokeOriginalMethod:(id)target selector:(SEL)selector {
    // Get the class method list
    uint count;
    Method *methodList = class_copyMethodList([target class], &count);
    
    // Print to console
    for (int i = 0; i < count; i++) {
        Method method = methodList[i];
        NSLog(@"Category catch selector : %d %@", i, NSStringFromSelector(method_getName(method)));
    }
    
    // Call original method . Note here take the last same name method as the original method
    for (int i = count - 1 ; i >= 0; i--) {
        Method method = methodList[i];
        SEL name = method_getName(method);
        IMP implementation = method_getImplementation(method);
        if (name == selector) {
            // id (*IMP)(id, SEL, ...)
            ((void (*)(id, SEL))implementation)(target, name);
            break;
        }
    }
    free(methodList);
}


@end
