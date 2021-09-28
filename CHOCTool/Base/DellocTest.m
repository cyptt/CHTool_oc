//
//  DellocTest.m
//  CHOCTool
//
//  Created by cyptt on 2021/9/15.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "DellocTest.h"

@implementation DellocTest

- (instancetype)initWithFrame:(CGRect)frame controller:(UIViewController *)controller
{
    self = [super initWithFrame:frame];
    if (self) {
        self.controller = controller;
    }
    return self;
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@",self.controller);
}

-(void)dealloc{
    NSLog(@"----%s",__func__);
}
@end
