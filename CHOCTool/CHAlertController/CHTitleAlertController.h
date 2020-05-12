//
//  CHCommonAlertController.h
//  SCCAAuthSDKDemo
//
//  Created by cyptt on 2020/5/11.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CHTitleAlertController : UIViewController
-(instancetype)initAlertControllerWithTitle:(NSString *)title isSigle:(BOOL)isSigle completion:(void (^ __nullable)(void))completion;

/**
 设置内容字体颜色
 */

-(void)setContentTitleColor:(UIColor *)color;
/**
 设置按钮字体
 */
-(void)setLeftTitle:(NSString *)leftTitle;
-(void)setRightTitle:(NSString *)rightTitle;
-(void)setSingleBtnTitle:(NSString *)singleBtnTitle;

/**
 设置背景颜色
 */
-(void)setLeftBgColor:(UIColor *)color;
-(void)setRightBgColor:(UIColor *)color;
-(void)setSigleBgColor:(UIColor *)color;

/**
 设置按钮字体颜色
 */
-(void)setLeftTitleColor:(UIColor *)color;
-(void)setRightTitleColor:(UIColor *)color;
-(void)setSigleTitleColor:(UIColor *)color;

/**
 单个按钮回调
 */
@property(nonatomic,strong)void(^singleBtnCallBackBlock) (void);

/**
 两个按钮左边回调
 */
@property(nonatomic,strong)void(^leftBtnCallBackBlock)(void);

/**
 两个按钮右边回调
 */
@property(nonatomic,strong)void(^rightBtnCallBackBlock) (void);
@end

NS_ASSUME_NONNULL_END
