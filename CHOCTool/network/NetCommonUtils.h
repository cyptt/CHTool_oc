//
//  NetCommonUtils.h
//  CHOCTool
//
//  Created by cyptt on 2021/9/28.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetCommonUtils : NSObject


/**
 返回 key=value&key=value 格式字符串
 */
+(NSString*)formString:(NSDictionary*)formDict ;


/**
 返回image/png 等类型
 */
+(NSString *)getmMimeType:(NSString *)path;

@end


NS_ASSUME_NONNULL_END
