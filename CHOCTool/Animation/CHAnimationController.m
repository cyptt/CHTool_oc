//
//  CHAnimationController.m
//  CHOCTool
//
//  Created by cyptt on 2021/10/11.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "CHAnimationController.h"
#import "CHDrawView.h"
#import "CHDrawApi.h"
#import "CHTransAnimViewController.h"
@interface CHAnimationController ()

@property(nonatomic,strong)CALayer * layer;
@end

@implementation CHAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    CALayer * layer = [[CALayer alloc]init];
    layer.frame = CGRectMake(100, 100, 100, 100);
    
    layer.backgroundColor = UIColor.redColor.CGColor;
//    layer.borderColor = UIColor.yellowColor.CGColor;
//    layer.borderWidth = 5;
    
    [self.view.layer addSublayer:layer];
    self.layer = layer;
}
- (IBAction)chdrawtest:(id)sender {
    
    CHDrawView * view1  = [[CHDrawView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height)];
    view1.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:view1];
}



- (IBAction)drawapi:(id)sender {
    
    CHDrawApi * view1  = [[CHDrawApi alloc]initWithFrame:CGRectMake(0, 100, 300, 400)];
    view1.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:view1];
}

/**
 https://zsisme.gitbooks.io/ios-/content/chapter6/cashapelayer.html
 渲染快速。CAShapeLayer使用了硬件加速，绘制同一图形会比用Core Graphics快很多。
 高效使用内存。一个CAShapeLayer不需要像普通CALayer一样创建一个寄宿图形，所以无论有多大，都不会占用太多的内存。
 不会被图层边界剪裁掉。一个CAShapeLayer可以在边界之外绘制。你的图层路径不会像在使用Core Graphics的普通CALayer一样被剪裁掉（如我们在第二章所见）。
 不会出现像素化。当你给CAShapeLayer做3D变换时，它不像一个有寄宿图的普通图层一样变得像素化。
 */
- (IBAction)shapelayer:(UIButton *)sender {
    
    
    UIBezierPath * path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(175, 100)];
    
    [ path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [path moveToPoint:CGPointMake(150, 125)];
    [path addLineToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(125, 225)];
    [path moveToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(175, 225)];
    [path moveToPoint:CGPointMake(100, 150)];
    [path addLineToPoint:CGPointMake(200, 150)];
    
    //create shape layer
    
    CAShapeLayer * shapelayer = [CAShapeLayer layer];
    shapelayer.strokeColor = [UIColor redColor].CGColor;
    shapelayer.fillColor = [UIColor clearColor].CGColor;
    shapelayer.lineWidth = 5;
    shapelayer.lineJoin = kCALineJoinRound;
    shapelayer.lineCap = kCALineCapRound;
    shapelayer.path = path.CGPath;
    
    [self.view.layer addSublayer:shapelayer];
    
}
- (IBAction)catextlayer:(id)sender {
    
    CATextLayer * textLayer = [CATextLayer layer];
    textLayer.frame = CGRectMake(100, 100, 100, 100);
    
    [self.view.layer addSublayer:textLayer];
    
    textLayer.foregroundColor = [UIColor redColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    
    UIFont * font = [UIFont systemFontOfSize:15];
    
    CFStringRef fontName = (__bridge  CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    
    NSString * text = @"f fjasjafj饭大家都发几点放假啊的短发就看大家发" ;
    textLayer.string = text;
}
- (IBAction)layer:(id)sender {
   
    self.layer.cornerRadius = 50;
    self.layer.masksToBounds = YES;
  

    
 
}

/**
 一、隐式动画的理解
 Core Animation基于一个假设，说屏幕上的任何东西都可以（或者可能）做动画。动画并不需要打开，相反需要明确地关闭，否则他会一直存在。当你改变CALayer的一个可做动画的属性，它并不能立刻在屏幕上体现出来。相反，它是从先前的值平滑过渡到新的值；这一切都是默认的行为，你不需要做额外的操作，这就是隐式动画。
 称为隐式动画的原因是我们没有指定动画的类型，只是改变了一个属性，然后Core Animation自己决定怎样去做动画，何时去做动画。
 https://zsisme.gitbooks.io/ios-/content/chapter7/transactions.html
 */
- (IBAction)yinshiAnimation:(id)sender {
    
    
    //注意 view.layer 是禁止隐式动画 UIView关联的图层禁用了隐式动画，对这种图层做动画的唯一办法就是使用UIView的动画函数
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:10.0];

    [CATransaction setCompletionBlock:^{
        CGAffineTransform transform = self.layer.affineTransform;
        transform = CGAffineTransformRotate(transform, M_PI_4);
        self.layer.affineTransform = transform;
    }];
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.layer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    [CATransaction commit];
    
   
}

/**
 属性动画
 */
- (IBAction)shuxingAnim:(id)sender {
    
    
}

/**
 动画组
 */
- (IBAction)anmiGroup:(id)sender {
    UIBezierPath * bezierPath = [[UIBezierPath alloc]init];
    [bezierPath moveToPoint:CGPointMake(0, 150)];
    [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
  

    CAShapeLayer * pathLayer = [CAShapeLayer layer];
    pathLayer.path = bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.0;
    [self.view.layer addSublayer:pathLayer];
    
    CALayer * colorLayer = [CALayer layer];
    colorLayer.frame = CGRectMake(0, 0, 64, 64);
    colorLayer.position = CGPointMake(0, 150);
    colorLayer.backgroundColor = [UIColor greenColor].CGColor;
    [self.view.layer addSublayer:colorLayer];
    
    
    CAKeyframeAnimation * animation1 = [CAKeyframeAnimation animation];
    animation1.keyPath = @"position";
    animation1.path = bezierPath.CGPath;
    animation1.rotationMode = kCAAnimationRotateAuto;
    
    CABasicAnimation * animation2 = [CABasicAnimation animation];
    animation2.keyPath = @"backgroundColor";
    animation2.toValue = (__bridge id)[UIColor redColor].CGColor;
    
    
    CAAnimationGroup * groupAnimation =[CAAnimationGroup animation];
    groupAnimation.animations = @[animation1,animation2];
    groupAnimation.duration = 4.5;
    
    
//    [colorLayer addAnimation:animation2 forKey:nil];
    [colorLayer addAnimation:groupAnimation forKey:nil];
}

/**
 转场
 */
- (IBAction)transAnim:(id)sender {
    
    CATransition * transtion = [CATransition animation];
    transtion.type = kCATransitionMoveIn;
    CHTransAnimViewController * VC = [[CHTransAnimViewController alloc]init];
    
    [self.navigationController pushViewController:VC animated:YES];
    [self.navigationController.view.layer addAnimation:transtion forKey:nil];
    
    
}
@end
