//
//  CHSingleChioseView.h
//  CHOCTool
//
//  Created by cyptt on 2020/9/13.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CHSingleChioseView : UIView
@property(nonatomic,strong)NSArray * titleArr;
-(void)setTitleArr:(NSArray *)titleArr defaultColor:(UIColor *)defaultColor selectedColor:(UIColor *)selectedColor titleSize:(CGFloat)fontSize;

/**
 设置字体大小
 */
-(void)setButtonTitleSize:(CGFloat)fontSize;


-(void)hideLineView;
@property(nonatomic,strong)void(^btnClickBlock)(void * title);

@end

NS_ASSUME_NONNULL_END
