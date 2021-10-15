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
@interface CHAnimationController ()

@end

@implementation CHAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
 
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    CHDrawView * view1  = [[CHDrawView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height)];
    view1.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:view1];
}

- (IBAction)drawapi:(id)sender {
    
    CHDrawApi * view1  = [[CHDrawApi alloc]initWithFrame:CGRectMake(0, 100, 300, 400)];
    view1.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:view1];
}


@end
