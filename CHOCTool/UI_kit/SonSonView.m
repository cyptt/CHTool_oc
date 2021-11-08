//
//  SonSonView.m
//  CHOCTool
//
//  Created by cyptt on 2021/11/8.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "SonSonView.h"

@implementation SonSonView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{

    NSLog(@"%s",__func__);
    UIView * hitView = [super hitTest:point withEvent:event];

    NSLog(@"hitView---%@",hitView);
    NSLog(@"hitView.class---%@",hitView.class);
    NSLog(@"NSStringFromClass--%@",NSStringFromClass([hitView class]));
    
    
    // 1.判断下窗口能否接收事件
    if (self.userInteractionEnabled == NO || self.hidden == YES ||  self.alpha <= 0.01) {
        return  nil;
    }
       // 2.判断下点在不在窗口上
       // 不在窗口上
    if ([self pointInside:point withEvent:event] == NO) {
        return  nil;
    }
    
    // 3.从后往前遍历子控件数组
    int count = (int)self.subviews.count;
    for (int i = count - 1; i >= 0; i--)     {
        // 获取子控件
        UIView *childView = self.subviews[i];
        // 坐标系的转换,把窗口上的点转换为子控件上的点
        // 把自己控件上的点转换成子控件上的点
        CGPoint childP = [self convertPoint:point toView:childView];
        UIView *fitView = [childView hitTest:childP withEvent:event];
        if (fitView) {
            // 如果能找到最合适的view
            return fitView;
        }
    }
    // 4.没有找到更合适的view，也就是没有比自己更合适的view
    return self;
 
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"点击了--%s",__func__);
}
//
- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event{
    NSLog(@"%s-----x----%f",__func__,point.x);
    NSLog(@"%s----y--pointInside---%f",__func__,point.y);
    BOOL flag = NO;
    for (UIView *view in self.subviews) {
        if (CGRectContainsPoint(view.frame, point)){
            flag = YES;
            break;
        }
    }
    if (CGRectContainsPoint(self.bounds, point)){
        flag = YES;
    }
    return flag;

}

@end
