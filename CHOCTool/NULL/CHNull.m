//
//  CHNull.m
//  CHOCTool
//
//  Created by cyptt on 2020/10/26.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "CHNull.h"

@implementation CHNull

/**
 是否是null，nil yes 是空 no 不是
 */
+(BOOL)isNullAll:(NSObject *)obj{
    if ([obj isEqual:[NSNull null]] || obj ==nil) {
        return YES;
    }else{
        return NO;
    }
}

/**
 是否为null yes 是空对象 no不是
 */
+(BOOL)isNull:(NSObject *)obj{
    
    if ([obj isEqual:[NSNull null]]) {
        return YES;
    }else{
        return NO;
    }
}

/**
 是否为nil yes 是空值  no不是
 */
+(BOOL)isNil:(NSObject *)obj{
    if (obj==nil) {
        return YES;
    }else{
        return NO;
    }
}

@end
