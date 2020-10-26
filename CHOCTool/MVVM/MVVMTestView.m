//
//  MVVMTestView.m
//  CHOCTool
//
//  Created by cyptt on 2020/10/2.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "MVVMTestView.h"

@implementation MVVMTestView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initViews];
        
    }
    return self;
}

-(void)initViews{
    
}
-(void)setViewModule:(ViewModule *)viewModule{
    _viewModule = viewModule;
    WEAKSELF_CA
    [self.viewModule initWithBlockSuccess:^(id data) {
        NSLog(@"%@",data);
        weakSelf.nameL.text =data;
    } Failure:^(id data) {
        
    }];
}
- (IBAction)btnClick:(UIButton *)sender {
    
      [_viewModule doSomeThing];
}


@end
