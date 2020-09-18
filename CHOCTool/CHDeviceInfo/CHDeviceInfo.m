//
//  CHDeviceInfo.m
//  CHOCTool
//
//  Created by cyptt on 2020/9/18.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "CHDeviceInfo.h"
#import <UIKit/UIKit.h>
static CHDeviceInfo * _chDeviceInfo;
@implementation CHDeviceInfo

+(NSString *)deviceId{
    return [[UIDevice currentDevice].identifierForVendor UUIDString] ;
}

+(NSString *)osVersion{
    return [UIDevice currentDevice].systemVersion;
}

+(NSString *)osName{
   return [UIDevice currentDevice].systemName;
}
+(NSString *)deviceName{
    return  [UIDevice currentDevice].name;
}
+(NSString *)deviceModel{
    return [UIDevice currentDevice].model;
}
@end
