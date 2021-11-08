//
//  CHButtonController.m
//  CHOCTool
//
//  Created by cyptt on 2020/5/7.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "CHButtonController.h"
#import "CHButton.h"

@interface CHButtonController ()

@end

@implementation CHButtonController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
//    CHButton * btn = [CHButton buttonWithType:UIButtonTypeCustom];;
    CHButton * btn = [[CHButton alloc]init];;
    [btn setBackgroundColor:[UIColor redColor]];
    
    
    btn.frame = CGRectMake(100, 140, 100, 80);
    btn.tintColor = [UIColor whiteColor];
    [btn setTitle:@"ddfd" forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"icon_licence_scca.png"] forState:UIControlStateNormal];

    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    
      UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeContactAdd];;
      [btn2 setBackgroundColor:[UIColor redColor]];
      btn2.tintColor = [UIColor whiteColor];
      
      
      btn2.frame = CGRectMake(100, 240, 100, 80);
      [btn2 setTitle:@"1234" forState:UIControlStateNormal];
//      [btn2 setImage:[UIImage imageNamed:@"icon_licence_scca.png"] forState:UIControlStateNormal];

      [btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
      [self.view addSubview:btn2];
    
    
}

-(void)btnClick:(UIButton *)btn{
    
}


@end
