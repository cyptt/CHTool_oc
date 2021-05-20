//
//  NSObject+property.m
//  CHOCTool
//
//  Created by cyptt on 2021/5/13.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "NSObject+property.h"
#import <objc/message.h>
@implementation NSObject (property)

-(void)setName:(NSString *)name{
    objc_setAssociatedObject(self, "Alex", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSString *)name{
    return objc_getAssociatedObject(self, "Alex");
}
@end
