//
//  CHDelegateNextViewController.m
//  CHOCTool
//
//  Created by cyptt on 2020/5/29.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "CHDelegateNextViewController.h"

@interface CHDelegateNextViewController ()

@end

@implementation CHDelegateNextViewController
-(instancetype)initWithDelegate:(id<CHDelegate>)delegate{
    if ( self = [super init]) {
        self.delegate = delegate;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
 
    
}
- (IBAction)btnClick:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"jinlllll");
    NSLog(@"---_delegate---%@",_delegate);
     if ([_delegate respondsToSelector:@selector(testDelegate:)]) {
         [_delegate testDelegate:@"------"];
     }
}



@end
