//
//  D_Person.m
//  CHOCTool
//
//  Created by cyptt on 2021/8/31.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "D_Person.h"

@implementation D_Person

-(void)eat{
    NSLog(@"person--eat");
}

-(id)copyWithZone:(NSZone *)zone{
    
    D_Person *s = [[[self class] alloc] init];
    NSLog(@"dddd");
     s.name = self.name;
     return s;
}

@end
