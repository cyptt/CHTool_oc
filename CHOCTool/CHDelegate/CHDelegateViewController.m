//
//  CHDelegateViewController.m
//  CHOCTool
//
//  Created by cyptt on 2020/5/29.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "CHDelegateViewController.h"
#import "CHDelegateNextViewController.h"

#import "CHDelegateManage.h"
@interface CHDelegateViewController ()<CHDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UILabel *labelL;


@end

@implementation CHDelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
 
      
}

- (IBAction)btnClick:(UIButton *)sender {
    
 [[CHDelegateManage sharedCacheHelper]startinitWithController:self];

//    CHDelegateNextViewController * VC = [[CHDelegateNextViewController alloc]initWithDelegate:self];
//
//    [self.navigationController pushViewController:VC animated:YES];
    
}
//-(void)testDelegate:(NSString *)name{
//    NSLog(@"-----dd%@",name);
//}


@end
