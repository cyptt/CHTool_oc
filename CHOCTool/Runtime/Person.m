//
//  Person.m
//  CHOCTool
//
//  Created by cyptt on 2021/5/10.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "Person.h"
#import "Person+CHPerson.h"
#import "NSObject+CHExObjct.h"
@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        extersonName = @"1111";
        chobjName = @"12345";
        NSLog(@"%@",extersonName);
        NSLog(@"%@",chobjName);
    }
    return self;
}

-(void)extersionPerson{
    NSLog(@"extersionPerson");
}
@end
