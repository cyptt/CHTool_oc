//
//  CHDrawView.m
//  CHOCTool
//
//  Created by cyptt on 2021/10/11.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "CHDrawView.h"

@implementation CHDrawView


-(void)drawRect:(CGRect)rect{
 
//    [self line1];
//    [self line2];
    
//    [self bezierLine];
//    [self drawCurve1];
//    [self drawCurve2];

    [self ddd];
}

-(void)ddd{
//    UIBezierPath* bezierPath_rect = [UIBezierPath bezierPathWithRect:CGRectMake(30, 50, 100, 100)];
//    [bezierPath_rect moveToPoint:CGPointMake(60, 60)];
//    [bezierPath_rect addLineToPoint:CGPointMake(80, 80)];
//    [bezierPath_rect addLineToPoint:CGPointMake(60, 90)];
//
//    bezierPath_rect.lineCapStyle = kCGLineCapButt;  //端点类型
//    bezierPath_rect.lineJoinStyle = kCGLineJoinMiter;  //线条连接类型
//    bezierPath_rect.miterLimit = 1;
//    CGFloat dash[] = {20,1};
//    [bezierPath_rect setLineDash:dash count:2 phase:0];
//    bezierPath_rect.lineWidth = 10;
    
    
    //圆形 椭圆贝塞尔曲线
//    UIBezierPath *bezierPath_oval = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(200, 50, 150, 100)];
//    bezierPath_oval.lineWidth = 10;
//    //还有圆角的贝塞尔曲线
//    UIBezierPath *bezierPath_RoundedRect = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(30, 200, 100, 100) cornerRadius:20];
//    bezierPath_RoundedRect.lineWidth = 10;
//    //绘制可选择圆角方位的贝塞尔曲线
//    UIBezierPath *bezierPath_RoundedCornerRect = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(200, 200, 100, 100) byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(20, 20)];
//    bezierPath_RoundedCornerRect.lineWidth = 10;
//    //绘制圆弧曲线
//    UIBezierPath *bezierPath_ArcCenter = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0, 400) radius:50 startAngle:M_PI / 2 * 3 endAngle:M_PI / 3 clockwise:YES];
//    bezierPath_ArcCenter.lineWidth = 10;
    //添加二次 三次贝塞尔曲线
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = 2;
    [bezierPath moveToPoint:CGPointMake(10, 520)];
    [bezierPath addLineToPoint:CGPointMake(50, 530)];
    [bezierPath addQuadCurveToPoint:CGPointMake(100, 510) controlPoint:CGPointMake(80, 650)];
    [bezierPath addCurveToPoint:CGPointMake(200, 530) controlPoint1:CGPointMake(130, 600) controlPoint2:CGPointMake(170, 400)];
    [bezierPath addArcWithCenter:CGPointMake(300, 400) radius:50 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    
    [bezierPath moveToPoint:CGPointMake(20, 520)];
    [bezierPath addLineToPoint:CGPointMake(40, 520)];
    //根据CGPathRef绘制贝塞尔曲线
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 10, 640);
    CGPathAddCurveToPoint(path, NULL, 100, 700, 250, 550, 350, 650);
    UIBezierPath *bezierPath_CGPath = [UIBezierPath bezierPathWithCGPath:path];
    bezierPath_CGPath.lineWidth = 4;
    //选择填充颜色
//    [[UIColor redColor] set];
//    [bezierPath_rect fill];
//    [bezierPath_oval fill];
//    [bezierPath_RoundedRect fill];
//    [bezierPath_RoundedCornerRect fill];
//
    
    //选择线条颜色
//    [[UIColor blackColor] set];
//    [bezierPath_rect stroke];
//    [bezierPath_oval stroke];
//    [bezierPath_RoundedRect stroke];
//    [bezierPath_RoundedCornerRect stroke];
//    [bezierPath_ArcCenter stroke];
    [bezierPath stroke];
//    [bezierPath_CGPath stroke];
    //
    CALayer* aniLayer = [CALayer layer];
    aniLayer.backgroundColor = [UIColor redColor].CGColor;
    aniLayer.position = CGPointMake(10, 520);
    aniLayer.bounds = CGRectMake(0, 0, 8, 8);
    aniLayer.cornerRadius = 4;
    [self.layer addSublayer:aniLayer];
    //
    CAKeyframeAnimation* keyFrameAni = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyFrameAni.repeatCount = NSIntegerMax;
    keyFrameAni.path = bezierPath.CGPath;
    keyFrameAni.duration = 15;
    keyFrameAni.beginTime = CACurrentMediaTime() + 1;
    [aniLayer addAnimation:keyFrameAni forKey:@"keyFrameAnimation"];
}
-(void)line1{
    //获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //描述路径
    
    //创建路径
    CGMutablePathRef path = CGPathCreateMutable();
    //设置起点
    CGPathMoveToPoint(path, NULL, 10, 10);
    
    CGPathAddLineToPoint(path,NULL,50,80);
    //设置终点
    CGPathAddLineToPoint(path, NULL, 100, 100);
    CGPathAddLineToPoint(path, NULL, 200, 100);
    
    //颜色
    [[UIColor redColor] setStroke];
    
    //线宽
    CGContextSetLineWidth(ctx, 2);
    
    //设置连接样式
    CGContextSetLineJoin(ctx, kCGLineJoinBevel);
    
    //设置顶角样式
    CGContextSetLineCap(ctx, kCGLineCapButt);
    
    //把路径添加到上下文
    CGContextAddPath(ctx, path);
    
    //渲染上下文到view的layer
    CGContextStrokePath(ctx);
}

-(void)line2{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //设置起点
    CGContextMoveToPoint(ctx, 10, 10);
    
    CGContextAddLineToPoint(ctx,50,80);
    CGContextStrokePath(ctx);
}

-(void)bezierLine{
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(200, 100)];
    [path setLineWidth:2];
    [path setLineJoinStyle:kCGLineJoinBevel];
    [path setLineCapStyle:kCGLineCapButt];
    [path stroke];
}

-(void)drawCurve1{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, 10, 10);
    CGContextAddQuadCurveToPoint(ctx, 200,50 , 200, 200);
    CGContextStrokePath(ctx);
}

-(void)drawCurve2{
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addQuadCurveToPoint:CGPointMake(250, 50) controlPoint:CGPointMake(150, 200)];
    [path stroke];
}


//绘制线图片
- (void)drawLineForImageView:(UIImageView *)imageView
{
    CGSize size = imageView.bounds.size;
    UIGraphicsBeginImageContext(size);

    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //创建一个颜色空间
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //设置开始颜色
    const CGFloat *startColorComponents = CGColorGetComponents([[UIColor greenColor] CGColor]);
    //设置结束颜色
    const CGFloat *endColorComponents = CGColorGetComponents([[UIColor whiteColor] CGColor]);
    //颜色分量的强度值数组
    CGFloat components[8] = {startColorComponents[0], startColorComponents[1], startColorComponents[2], startColorComponents[3], endColorComponents[0], endColorComponents[1], endColorComponents[2], endColorComponents[3]
    };
    //渐变系数数组
    CGFloat locations[] = {0.0, 1.0};
    //创建渐变对象
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, 2);
    //绘制渐变
    CGContextDrawRadialGradient(context, gradient, CGPointMake(size.width * 0.5, size.height * 0.5), size.width * 0.25, CGPointMake(size.width * 0.5, size.height * 0.5), size.width * 0.5, kCGGradientDrawsBeforeStartLocation);
    //释放
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(gradient);
    
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}
@end
