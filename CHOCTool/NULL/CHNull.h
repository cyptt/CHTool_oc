//
//  CHNull.h
//  CHOCTool
//
//  Created by cyptt on 2020/10/26.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CHNull : NSObject



/**
 是否是null，nil
 */
+(BOOL)isNullAll:(NSObject *)obj;

/**
 是否为null
 */
+(BOOL)isNull:(NSObject *)obj;

/**
 是否为nil
 */
+(BOOL)isNil:(NSObject *)obj;
@end

NS_ASSUME_NONNULL_END
