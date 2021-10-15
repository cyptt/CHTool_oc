//
//  CHDrawApi.m
//  CHOCTool
//
//  Created by cyptt on 2021/10/15.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "CHDrawApi.h"
#import "CHFileManage.h"
@implementation CHDrawApi

-(void)drawRect:(CGRect)rect{
  
//    [self line];
    
//    [self colorGradient:rect];
    
    [self drawImage];

}



/**
直线
 */
-(void)line{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(ctx, 20, 20);
    
    CGContextAddLineToPoint(ctx, 20, 200);
    
    CGContextAddLineToPoint(ctx, 200, 200);
    CGContextAddLineToPoint(ctx, 200, 20);
    CGContextAddLineToPoint(ctx, 20, 20);
    
    CGContextSetLineWidth(ctx, 20);  //线宽
//    [[UIColor redColor] set];  // 颜色1
    CGContextSetStrokeColorWithColor(ctx,[UIColor redColor].CGColor); //颜色2
    CGFloat dashArray[] = {3, 1};
    CGContextSetLineDash(ctx, 1, dashArray, 1);   //设置虚线
    
    CGLineCap cap =  kCGLineCapRound ;  //设置末端形状
    CGContextSetLineCap(ctx, cap);
    
 
    CGLineJoin join = kCGLineJoinMiter;
    CGContextSetLineJoin(ctx, join);  //设置连接方式
    
    /**
     设置阴影
     */
//    CGContextSetShadowWithColor(ctx, CGSizeMake(10, 10), 0.1, UIColor.blackColor.CGColor);
    CGContextSetRGBFillColor(ctx, 0, 0, 0, 0.5); //设置填充颜色
//    CGContextFillPath(ctx);
    
    CGContextSetStrokeColorWithColor(ctx, UIColor.redColor.CGColor);
  
    
    CGContextStrokePath(ctx);
   
}

/**
 曲线
 */
-(void)quadCurve{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(ctx, 10, 10);
    
    CGContextAddQuadCurveToPoint(ctx, 10, 19, 29, 45);
    CGContextStrokePath(ctx);
}

/**
 矩形，左上交的坐标
 */
-(void)juxin{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextAddRect(ctx, CGRectMake(0,0, 30, 30));
    CGContextStrokePath(ctx);
}

/**
 圆形
 */
-(void)yuanxin{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(10,0, 30, 30);
    CGContextAddEllipseInRect(ctx, rect);
 
    
    CGContextSetFillColorWithColor(ctx, UIColor.purpleColor.CGColor);
    

    CGContextFillPath(ctx);  //填充
//    CGContextStrokePath(ctx);
}

/**
 圆弧
 */
-(void)yuanhu{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGRect rect = CGRectMake(10,0, 30, 30);
    CGContextAddArc(ctx, 10, 20, 30, 50, 40, 1);
    
 
    CGContextStrokePath(ctx);
}

/**
 贝塞尔曲线
 */
-(void)bezier{
    UIBezierPath * bezierpath = [UIBezierPath bezierPath];
    [bezierpath moveToPoint:CGPointMake(10, 10)];
    [bezierpath addLineToPoint:CGPointMake(30, 40)];
    [[UIColor redColor] set];
    
    [bezierpath stroke];
}

-(void)colorGradient:(CGRect)react

/**
 颜色渐变
 */
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClip(context);
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGFloat colors[] = {
        200.0 / 255.0, 224.0 / 255.0, 244.0 / 0.0, 1.00,
            100.0 / 255.0, 156.0 / 255.0, 215.0 / 100.0, 1.00,
            0.0 / 255.0,  50.0 / 255.0, 126.0 / 200.0, 1.00,
        0.0 / 255.0,  255.0 / 255.0, 126.0 / 200.0, 1.00,
    };
    CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors) / (sizeof(colors[0]) * 4));
        CGColorSpaceRelease(rgb);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0.0,0.0), CGPointMake(0.0, react.size.height), kCGGradientDrawsBeforeStartLocation);
}

/**
 编辑图片.添加水印
 */
-(void)drawImage{
    UIImage * image = [UIImage imageNamed:@"WechatIMG12.jpg"];
    

    
    UIGraphicsBeginImageContextWithOptions(image.size,NO,1);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    UIFont * font = [UIFont boldSystemFontOfSize:10];
    NSDictionary * attriDict = @{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor redColor]};
     
    NSString * drawStr = @"测试了中文发互粉哈哈8dddddd---";
    [drawStr drawInRect:CGRectMake(0, 20, 80, 180) withAttributes:attriDict];
    
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    
    [newImage drawInRect:CGRectMake(100, 100, image.size.width, image.size.height)];
    
    NSData * data =UIImageJPEGRepresentation(newImage,1);
    
    NSData * data2 = UIImageJPEGRepresentation(image,1);
    
    NSString * path  = [[CHFileManage getDocumentPath] stringByAppendingPathComponent:@"001.png"];
    
    NSLog(@"%@",path);
    
    
    [CHFileManage writeToFile:path contents:data];
    
    NSString * path2  = [[CHFileManage getDocumentPath] stringByAppendingPathComponent:@"002.png"];
    
    [CHFileManage writeToFile:path2 contents:data2];
    
}
@end
