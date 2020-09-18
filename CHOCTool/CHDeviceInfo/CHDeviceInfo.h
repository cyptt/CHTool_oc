//
//  CHDeviceInfo.h
//  CHOCTool
//
//  Created by cyptt on 2020/9/18.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CHDeviceInfo : NSObject

/**
 设备uuid
 */
@property(nonatomic,strong)NSString * deviceId;

/**
  系统版本
 */
@property(nonatomic,strong)NSString * osVersion;

/**
  * 系统名称
  */
@property(nonatomic,strong)NSString * osName;
/**
 * 设备名称
 */
@property(nonatomic,strong)NSString *deviceName;

/**
   * 设备型号(品牌)
   */
@property(nonatomic,strong)NSString *deviceModel;
+(NSString *)deviceId;
+(NSString *)osVersion;
+(NSString *)osName;
+(NSString *)deviceName;
+(NSString *)deviceModel;

@end

NS_ASSUME_NONNULL_END
