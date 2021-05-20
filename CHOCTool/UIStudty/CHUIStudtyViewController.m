//
//  CHUIStudtyViewController.m
//  CHOCTool
//
//  Created by cyptt on 2021/5/14.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "CHUIStudtyViewController.h"

@interface CHUIStudtyViewController ()
@property (weak, nonatomic) IBOutlet UIView *view1;


@property (weak, nonatomic) IBOutlet UIView *view2;

@property(nonatomic,strong)UIView * view3;
@property(nonatomic,strong)UIView * orangeView;
@property(nonatomic,strong)UIView * yellowView;
@end

@implementation CHUIStudtyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   

    self.view1.hidden = YES;
    self.view2.hidden = YES;
 
    UIView * orangeView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];

    orangeView.backgroundColor = [UIColor orangeColor];

    [self.view addSubview:orangeView];
    self.orangeView = orangeView;
    

    //添加子控件yellowView

    UIView * yellowView = [[UIView alloc]initWithFrame:CGRectMake(20, 20, 100, 100)];

    yellowView.backgroundColor = [UIColor yellowColor];

    [orangeView addSubview:yellowView];
    self.yellowView = yellowView;

  
    
    
//    NSLog(@"%@",NSStringFromCGRect(self.view1.frame));
//    NSLog(@"%@",NSStringFromCGRect(self.view1.bounds));
}

- (IBAction)frameBtn:(id)sender {
    

    
}

- (IBAction)sonFrameBtn:(id)sender {
    
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
//    NSLog(@"did---orangeView-%@",NSStringFromCGRect(self.view3.frame));
//    NSLog(@"did--orangeView--%@",NSStringFromCGRect(self.view3.bounds));
}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
  
    
    
}

/**
 保持bounds.size不变，只改变bounds.origin
 父
 */
- (IBAction)boundsBtn:(id)sender {
    [self.orangeView setBounds:CGRectMake(-30, -30, 200, 200)];
    
    NSLog(@"will--orangeView-%@",NSStringFromCGRect(self.orangeView.frame));
    NSLog(@"will--orangeView--%@",NSStringFromCGRect(self.orangeView.bounds));
    
    NSLog(@"will--yellowView-%@",NSStringFromCGRect(self.yellowView.frame));
    NSLog(@"will--yellowView--%@",NSStringFromCGRect(self.yellowView.bounds));
   
}

/**
 保持bounds.size不变，只改变bounds.origin
 字
 */

- (IBAction)sonBounds:(id)sender {
    [self.yellowView setBounds:CGRectMake(-30, -30, 100, 100)];
    
    NSLog(@"will--orangeView-%@",NSStringFromCGRect(self.orangeView.frame));
    NSLog(@"will--orangeView--%@",NSStringFromCGRect(self.orangeView.bounds));
    
    NSLog(@"will--yellowView-%@",NSStringFromCGRect(self.yellowView.frame));
    NSLog(@"will--yellowView--%@",NSStringFromCGRect(self.yellowView.bounds));
}
- (IBAction)fatherboundssize:(id)sender {
    [self.orangeView setBounds:CGRectMake(0, 0, 250, 250)];
    
    NSLog(@"will--orangeView-%@",NSStringFromCGRect(self.orangeView.frame));
    NSLog(@"will--orangeView--%@",NSStringFromCGRect(self.orangeView.bounds));
    
    NSLog(@"will--yellowView-%@",NSStringFromCGRect(self.yellowView.frame));
    NSLog(@"will--yellowView--%@",NSStringFromCGRect(self.yellowView.bounds));
}
- (IBAction)sonboundssize:(id)sender {
    [self.yellowView setBounds:CGRectMake(0, 0, 250, 250)];
    
    NSLog(@"will--orangeView-%@",NSStringFromCGRect(self.orangeView.frame));
    NSLog(@"will--orangeView--%@",NSStringFromCGRect(self.orangeView.bounds));
    
    NSLog(@"will--yellowView-%@",NSStringFromCGRect(self.yellowView.frame));
    NSLog(@"will--yellowView--%@",NSStringFromCGRect(self.yellowView.bounds));
}


@end
