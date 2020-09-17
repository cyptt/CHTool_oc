//
//  CHScrolleTestViewController.m
//  CHOCTool
//
//  Created by cyptt on 2020/9/13.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "CHScrolleTestViewController.h"

@interface CHScrolleTestViewController ()

@end

@implementation CHScrolleTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    self.scrollView.contentSize = CGSizeMake( self.view.frame.size.width, 200);
    self.scrollView.backgroundColor = [UIColor redColor];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
