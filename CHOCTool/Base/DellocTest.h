//
//  DellocTest.h
//  CHOCTool
//
//  Created by cyptt on 2021/9/15.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface DellocTest : UIView

@property(nonatomic,weak)UIViewController * controller;

- (instancetype)initWithFrame:(CGRect)frame controller:(UIViewController *)controller;

@end

NS_ASSUME_NONNULL_END
