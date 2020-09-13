//
//  CHDelegateManage.h
//  CHOCTool
//
//  Created by cyptt on 2020/5/29.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHDelegateNextViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface CHDelegateManage : NSObject<CHDelegate>
+ (instancetype)sharedCacheHelper;


-(void)startinitWithController:(UIViewController *)Controller;
@end

NS_ASSUME_NONNULL_END
