//
//  CHSingleChioseViewController.m
//  CHOCTool
//
//  Created by cyptt on 2020/9/13.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "CHSingleChioseViewController.h"
#import "CHSingleChioseView.h"
@interface CHSingleChioseViewController ()

@property(nonatomic,strong)CHSingleChioseView * singleChioseView;
@end

@implementation CHSingleChioseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    
 
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.view addSubview:self.singleChioseView];
    
    [self.singleChioseView setTitleArr:@[@"001",@"002"] defaultColor:[UIColor grayColor] selectedColor:[UIColor yellowColor]];
    
    [self.singleChioseView setBtnClickBlock:^(void * _Nonnull title) {
        
        NSLog(@"%@",title);
    }];
  
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
      [self.singleChioseView setButtonTitleSize:20];
}
#pragma mark --lazy
-(CHSingleChioseView *)singleChioseView{
    if (!_singleChioseView) {
        _singleChioseView = [[CHSingleChioseView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 40)];
        _singleChioseView.backgroundColor = [UIColor redColor];
    }
    return _singleChioseView;
}



@end
