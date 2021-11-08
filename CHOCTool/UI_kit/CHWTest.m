//
//  CHWTest.m
//  CHOCTool
//
//  Created by cyptt on 2021/11/4.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "CHWTest.h"

@implementation CHWTest

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"点击了--%s",__func__);
}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{

    NSLog(@"%s",__func__);
    UIView * hitView = [super hitTest:point withEvent:event];
    
    NSLog(@"hitView---%@",hitView);
    NSLog(@"hitView.class---%@",hitView.class);
    NSLog(@"NSStringFromClass--%@",NSStringFromClass([hitView class]));
    
//    //1.判断自己能否接收事件
    if (self.userInteractionEnabled == NO || self.hidden == YES || self.alpha <= 0.01) {
        //不能接收事件
        return nil;
    }
    //2.点在不在自己身上
    if (![self pointInside:point withEvent:event]) {
        return nil;
    }

    //3.从后往前遍历自己的子控件,把事件传递给子控件,调用子控件的hitTest,
    int count = (int)self.subviews.count;

    for (int i = count - 1; i >= 0; i--) {

        //获取子控件
        UIView *childView = self.subviews[i];

        //把当前点的坐标系转换成子控件的坐标系
        CGPoint childP = [self convertPoint:point toView:childView];

        UIView *fitView = [childView hitTest:childP withEvent:event];

        if (fitView) {
            return fitView;
        }

    }
    
    NSLog(@"x----%f",point.x);
    NSLog(@"y-----%f",point.y);
    return self;
}

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
