//
//  TestAlertViewController.m
//  CHOCTool
//
//  Created by cyptt on 2020/4/3.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "TestAlertViewController.h"
#import "CHAlertController.h"
#import "CHCenterAlertController.h"
#import "CHModel.h"
#import "ViewController.h"

#define Fuc4(a) [self test4:(a)]
typedef void(^block3) (void);

typedef NSString * Str;
@interface TestAlertViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property(nonatomic,strong)NSMutableArray * dataSourceArr;

@property(nonatomic,strong)void(^block2)(void);


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
 
 
    NSLog(@"%@",Fuc4(@"dddd"));
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
 
      void (^block)(void)=^{
         NSLog(@"ddd");
     };
    
 
    

}

-(NSString *)test4:(NSString *)sr{
    return sr;
}
-(void)test:(void(^)(NSString * name))block name:(NSString *)name1{
    if (block) {
        block(name1);
    }
}
- (IBAction)clickBtn:(id)sender {
    
          CHAlertController * alert = [[CHAlertController alloc]initAlertControllerWithDataSource:self.dataSourceArr completion:^(CAAlertModel * _Nonnull alertModel) {
              [sender setTitle:alertModel.name forState:UIControlStateNormal];
    }];

    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)alertCenterClick:(UIButton *)sender {
    CHCenterAlertController * VC = [[CHCenterAlertController alloc]initAlertControllerWithDataSource:self.dataSourceArr completion:^(CAAlertModel * _Nonnull alertModel) {
        [sender setTitle:alertModel.name forState:UIControlStateNormal];
    }];
    [self presentViewController:VC animated:YES completion:nil];
}


@end
