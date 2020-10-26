//
//  MVVMViewController.m
//  CHOCTool
//
//  Created by cyptt on 2020/10/1.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "MVVMViewController.h"
#import "MVVMTestView.h"
#import "ViewModule.h"

@interface MVVMViewController ()
@property(nonatomic,strong)ViewModule * viewModel;
@property(nonatomic,strong)MVVMTestView * mvvmTestView;
@end

@implementation MVVMViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.viewModel = [[ViewModule alloc]init];
    

}
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
  
    [self.view addSubview:self.mvvmTestView];
  
    
}


#pragma mark--lazy
-(MVVMTestView *)mvvmTestView{
    if (!_mvvmTestView) {
        _mvvmTestView = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([MVVMTestView class]) owner:self options:nil].lastObject;
        _mvvmTestView.frame =CGRectMake(0, 100, 200, 100);
        _mvvmTestView.backgroundColor = [UIColor redColor];
        [_mvvmTestView setViewModule:self.viewModel];
    }
    return _mvvmTestView;
}
@end
