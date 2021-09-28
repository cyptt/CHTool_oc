//
//  CHDown.h
//  CHOCTool
//
//  Created by cyptt on 2021/9/28.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CHDown : NSObject
+(instancetype)shareInstance;
-(void)downWithUrl:(NSString *)urlStr params:( NSDictionary * __nullable)params success:(void(^ __nullable)(id responseObj))success failure:(void(^ __nullable)(NSError * err))failure progress:(void(^ __nullable)(float precent))progress;
@end

NS_ASSUME_NONNULL_END
