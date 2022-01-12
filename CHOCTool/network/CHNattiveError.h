//
//  CHNetError.h
//  CHOCTool
//
//  Created by cyptt on 2022/1/12.
//  Copyright © 2022 com.qingtiantree. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CHNattiveError : NSObject
+(NSError *)error:(nullable NSString *)errMsg code:(NSInteger)code;
@end

NS_ASSUME_NONNULL_END
