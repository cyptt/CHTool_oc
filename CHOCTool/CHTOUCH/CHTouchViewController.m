//
//  CHTouchViewController.m
//  CHOCTool
//
//  Created by cyptt on 2021/10/25.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "CHTouchViewController.h"
#import "CHView.h"
@interface CHTouchViewController ()

@end

@implementation CHTouchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.backgroundColor = UIColor.redColor;
    
    [btn1 addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
    btn1.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:btn1];
    
    
    UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.backgroundColor = UIColor.blueColor;
    
    [btn2 addTarget:self action:@selector(btn2Click:) forControlEvents:UIControlEventTouchUpInside];
    btn2.frame = CGRectMake(100, 300, 100, 100);
    [self.view addSubview:btn2];
}


-(void)btn1Click:(UIButton *)btn{
    NSLog(@"001");
    CHView * view = [[CHView alloc]initWithFrame:CGRectMake(200, 300,100 , 100)];
    view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view];
}

-(void)btn2Click:(UIButton *)btn{
    NSLog(@"002");
    
    
}






@end
