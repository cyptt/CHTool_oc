//
//  UIKitViewController.m
//  CHOCTool
//
//  Created by cyptt on 2021/11/4.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

/**
 点击事件
 1.会遍历子控件hitTest
 2.会遍历同层hitTest
 3.会遍历父控件hitTest
 
 
 
 UIApplication接收到事件，将事件传递给keyWindow。
 keyWindow遍历subViews的hitTest:withEvent:方法，找到点击区域内合适的视图来处理事件。
 UIView的子视图也会遍历其subViews的hitTest:withEvent:方法，以此类推。
 直到找到点击区域内，且处于最上方的视图，将视图逐步返回给UIApplication。
 在查找第一响应者的过程中，已经形成了一个响应者链。
 应用程序会先调用第一响应者处理事件。
 如果第一响应者不能处理事件，则调用其nextResponder方法，一直找响应者链中能处理该事件的对象。
 最后到UIApplication后仍然没有能处理该事件的对象，则该事件被废弃。

 */

#import "UIKitViewController.h"
#import "CHWTest.h"
#import "CHWView2.h"
@interface UIKitViewController ()

@property(nonatomic,strong)UIWindow * selfWindow;
@end

@implementation UIKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
  
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    });
    
    CHWTest * tesView = [[CHWTest alloc]initWithFrame:CGRectMake(0, 100, 100, 100)];
    tesView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:tesView];
    
  
    CHWView2 * view2 = [[CHWView2 alloc]initWithFrame:CGRectMake(0, 200, 300, 300)];
    view2.backgroundColor = UIColor.yellowColor;
    [self.view addSubview:view2];
    
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"点击了--%s",__func__);
}
@end
