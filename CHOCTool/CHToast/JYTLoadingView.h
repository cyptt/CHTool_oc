//
//  JYTLoadingView.h
//  jianyitong2017
//
//  Created by 尹冬兵 on 2019/7/9.
//  Copyright © 2019 com.zhongjianyitong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYTLoadingView : UIView

+ (instancetype)sharedInstance;
- (void)startLoadingWithView:(UIView *)view;
- (void)startLoading;
- (void)stopLoading;
- (void)hudDismissWithSeconds:(CGFloat)seconds;

@end
