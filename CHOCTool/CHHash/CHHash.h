//
//  CHHash.h
//  CHOCTool
//
//  Created by cyptt on 2020/1/9.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CHHash : NSObject



/**
  计算文件sha1,该方法把文件都写入内存，会导致内存爆增
 @param filePath 文件路径
 */
+(NSString *)sha1OffilePath:(NSString *)filePath;

/**
 计算文件md5,该方法把文件都写入内存，会导致内存爆增
 @param filePath 文件路径
 */
+(NSString *)md5OffilePath:(NSString *)filePath;

/**
  分断计算文件sha1
 @param filepath 文件路径
 */
+(NSString*)shardFileSha1WithPath:(NSString*)filepath;
/**
 分断计算文件md5
@param filepath  文件路径
*/
+(NSString*)shardMD5WithPath:(NSString*)filepath;

/**
 分断计算文件md5
@param filepath  文件路径
  @param  secret  加密密钥
*/
+ (NSString *)hmacSHA256WithSecret:(NSString *)secret filePath:(NSString *)filepath;

/**
 分断计算文件hamc256
@param filepath  文件路径
 @param  key 加密密钥
*/
+(NSString*)shardFileHMACWithPath:(NSString*)filepath withKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
