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
#import "CHTitleAlertController.h"
#import "CHDefaultAlert.h"

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
   
    
  
    [CHDefaultAlert showAlertWithController:self title:@"d" message:nil arr:@[@"001",@"002",@"003"] handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"----%@",action.title);
    }];
    
 
    

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
- (IBAction)titleBtnClick:(UIButton *)sender {
    
    CHTitleAlertController * VC = [[CHTitleAlertController alloc]initAlertControllerWithTitle:@"你哈哈哈哈，哈哈哈哈哈哈哈哈对方的回复可视电话，疯狂的事快点恢复可视电话反馈收到回复说肯定会发生的匡扶，汉室的开放后上看到回复都是客户。" isSigle:NO completion:nil];
      [self presentViewController:VC animated:NO completion:nil];
      [VC setSingleBtnTitle:@"重新注册登录"];
}


@end
