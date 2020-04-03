//
//  JYTLoadingView.m
//  jianyitong2017
//
//  Created by 尹冬兵 on 2019/7/9.
//  Copyright © 2019 com.zhongjianyitong. All rights reserved.
//

#import "JYTLoadingView.h"
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

@interface JYTLoadingView()

@property (nonatomic,strong) UIImageView *logoImage;
@property (nonatomic,strong) UIImageView *circleImage;
@property (nonatomic,strong) UIView *basicView;
@property (nonatomic,strong) UIViewController *controller;

@end

@implementation JYTLoadingView

+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    static JYTLoadingView *loading;
    dispatch_once(&onceToken, ^{
        loading = [JYTLoadingView new];
        [loading configUI];
    });
    return loading;
}

- (void)configUI{
    self.userInteractionEnabled = YES;
    self.backgroundColor = [UIColor clearColor];
    
    self.logoImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loading_bg"]];
    self.logoImage.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.logoImage];
    
    self.circleImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loading"]];

    self.circleImage.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.circleImage];
    
    [self adjustFrames];
}

- (void)adjustFrames{
    CGRect rect = self.superview.bounds;
    CGFloat offsetY = rect.origin.y;
    if (self.controller) {
        offsetY = 64.;
        if (IS_IPHONE_X) {
            offsetY = 88.;
        }
    }
    self.frame = CGRectMake(rect.origin.x, offsetY, rect.size.width, rect.size.height - offsetY);
    self.logoImage.frame = CGRectMake(0, 0, 48, 48);
    self.logoImage.center = CGPointMake(self.superview.center.x, self.frame.size.height / 2.0);
    self.circleImage.frame = CGRectMake(0, 0, 48, 48);
    self.circleImage.center = self.logoImage.center;
}

- (void)startLoadingWithView:(UIView *)view{
    self.basicView = view;
    
    if (!self.superview) {
        [view addSubview:self];
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView *scrollview = (UIScrollView *)view;
            scrollview.scrollEnabled = NO;
        }
    }
    [self adjustFrames];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = @(0);
    animation.toValue = @(M_PI * 6.0);
    animation.repeatCount = FLT_MAX;
    animation.duration = 2;
    [self.circleImage.layer addAnimation:animation forKey:@"rotation"];
}

- (void)startLoading{
    UIViewController *topVC = [self topViewController];
    self.controller = topVC;
    self.basicView = topVC.view;
    [self startLoadingWithView:topVC.view];
}

- (void)stopLoading{
    [self.circleImage.layer removeAllAnimations];
    if (self.superview) {
        if ([self.basicView isKindOfClass:[UIScrollView class]]) {
            UIScrollView *scrollview = (UIScrollView *)self.basicView;
            scrollview.scrollEnabled = YES;
        }
        [self removeFromSuperview];
    }
}

- (void)hudDismissWithSeconds:(CGFloat)seconds{
    //延时消失
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self stopLoading];
    });
}

- (UIViewController *)topViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}


- (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}

@end
