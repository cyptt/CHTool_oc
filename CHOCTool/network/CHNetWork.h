//
//  CHNetWork.h
//  CHOCTool
//
//  Created by cyptt on 2021/9/25.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CHNetWork : NSObject
+(instancetype)shareInstance;

/**
 get 请求
 @param urlStr 路径
 @param parameters 参数
 */
-(void)get_Url:(NSString *)urlStr parameters:(NSDictionary *)parameters success:(void(^ __nullable)(id responseObj))success failure:(void(^ __nullable)(NSError * err))failure;

/**
 get 请求
 @param urlStr 路径
 @param parameters 参数
 @headersDic 请求头 如果为nil 则参数为 ?name=zs&age=12 格式
 */
-(void)post_Url:(NSString *)urlStr parameters:(NSDictionary * __nullable)parameters headersDic:(NSDictionary * __nullable)headersDic success:(void(^ __nullable)(id responseObj))success failure:(void(^ __nullable)(NSError * err))failure;

@end

NS_ASSUME_NONNULL_END
