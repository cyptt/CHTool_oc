//
//  TestAlertViewController.m
//  CHOCTool
//
//  Created by cyptt on 2020/4/3.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "TestAlertViewController.h"
#import "CHAlertController.h"
#import "CHModel.h"
@interface TestAlertViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property(nonatomic,strong)NSMutableArray * dataSourceArr;
@end


@implementation TestAlertViewController

-(NSMutableArray *)dataSourceArr{
    if (!_dataSourceArr) {
        _dataSourceArr = [NSMutableArray array];
        NSArray *dataArr = @[
        @{@"name":@"企业法人",@"ID":@"C01"},
        @{@"name":@"社会组织法人",@"ID":@"C02"},
        @{@"name":@"事业单位法人",@"ID":@"C03"},
        @{@"name":@"其他机构",@"ID":@"C04"}];
        for (int i = 0; i<dataArr.count; i++) {
            CAAlertModel * model = [CAAlertModel ch_modelWithDictionary:dataArr[i]];
            [_dataSourceArr addObject:model];
        }
    }
    return _dataSourceArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
 
    
}
- (IBAction)clickBtn:(id)sender {
    
          CHAlertController * alert = [[CHAlertController alloc]initAlertControllerWithDataSource:self.dataSourceArr completion:^(CAAlertModel * _Nonnull alertModel) {
              [sender setTitle:alertModel.name forState:UIControlStateNormal];
    }];

    [self presentViewController:alert animated:YES completion:nil];
}



@end
