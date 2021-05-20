//
//  TestRuntime.m
//  CHOCTool
//
//  Created by cyptt on 2020/9/18.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "TestRuntime.h"
#import <objc/runtime.h>

@interface TestRuntime(){
   @public NSString * pubName;

}

@end

@implementation TestRuntime{
    
    @private NSString * neiName;
 
    

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        neiName = @"张三";
    }
    return self;
}
-(void)test:(NSString *)msg{
    NSLog(@"%@",msg);
}

-(void)test2{
    

}

-(void)chagePrivateProperty{
    NSLog(@"%@",neiName);
}

-(void)interfacePerson{
  
}


void eat(id self, SEL _cmd,NSString * str) {

    NSLog(@"进来来%@",str);
}

/**
 动态添加方法 
 */
//+(BOOL)resolveInstanceMethod:(SEL)sel{
//    if (sel ==@selector(eat:)) {
//        class_addMethod(self, sel,(IMP)eat, "v@:@");
//    }
//    return [super resolveInstanceMethod:sel];
//}

//-(void)eat:(NSString *)dd{
//    
//}
-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSString *sel = NSStringFromSelector(aSelector);
    NSLog(@"%@",sel);
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];;
}
@end
