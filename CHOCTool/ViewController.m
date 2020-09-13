//
//  ViewController.m
//  CHOCTool
//
//  Created by cyptt on 2020/1/8.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "ViewController.h"
#import "FileManageViewController.h"
#import "CHHashTableViewController.h"
#import "JYTLoadingView.h"
#import "CHProgressHUD.h"
#import "TestAlertViewController.h"
#import "CHButtonController.h"
#import "CHGCDViewController.h"
#import "CHLabelViewController.h"
#import "CHDelegateViewController.h"
#import "CHSingleChioseViewController.h"
 NSString * testname2 = @"adsfdfsf";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property(nonatomic,strong)NSArray * dataSourceArr;;


@end



@implementation ViewController

-(NSArray *)dataSourceArr{
    if (!_dataSourceArr) {
        _dataSourceArr = @[@"FileManage",@"CHHash",@"JYTLoding",@"CHProgressHUD",@"CHAlert",@"CHButton",@"GCD",@"LableStyle",@"Delegate",@"CHSingleChiose"];
    }
    return _dataSourceArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    NSLog(@"%s",__func__);
    
//   self.view.backgroundColor = [UIColor redColor];

//
   
    
//      UIBarButtonItem * bar1 = [[UIBarButtonItem alloc]init];
//
//      [bar1 setImage:[UIImage imageNamed:@"back_grey_scca"]];
//      self.navigationItem.backBarButtonItem = bar1;
    
    [self.navigationController.navigationBar setBackIndicatorImage:[UIImage new]];
    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage new]];
     self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_grey_scca"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didClick)];

     
    
}

-(void)didClick{
    NSLog(@"%@",@"ddfd");
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
 
}
#pragma mark -- UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"CELL"];
    }
    cell.textLabel.text = self.dataSourceArr[indexPath.row];
    
    NSLog(@"-----%lf---%lf",cell.textLabel.center.x,cell.textLabel.center.y);
    return cell;
}
#pragma mark --UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * name = self.dataSourceArr[indexPath.row];
    if ([name isEqualToString:@"FileManage"]) {
        FileManageViewController * VC = [[FileManageViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    if ([name isEqualToString:@"CHHash"]) {
        CHHashTableViewController * VC = [[CHHashTableViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    if ([name isEqualToString:@"JYTLoding"]) {
        [[JYTLoadingView sharedInstance]startLoadingWithView:self.view];
        
        [[JYTLoadingView sharedInstance] hudDismissWithSeconds:2];
    }
    if ([name isEqualToString:@"CHProgressHUD"]) {
        CHProgressHUD * hud = [CHProgressHUD showHUDAddedTo:self.view animated:YES];
        
        hud.label.text = @"CHProgressHUD";
        [hud hideAnimated:YES afterDelay:2];
    }
    if ([name isEqualToString:@"CHAlert"]) {
        TestAlertViewController * vc = [[TestAlertViewController alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([name isEqualToString:@"CHButton"]) {
        CHButtonController *VC = [[CHButtonController alloc]init];
       
        [self.navigationController pushViewController:VC animated:YES];
    }
    if ([name isEqualToString:@"GCD"]) {
        CHGCDViewController *VC =[[CHGCDViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    
    if ([name isEqualToString:@"LableStyle"]) {
        CHLabelViewController * VC = [[CHLabelViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    
    if ([name isEqualToString:@"Delegate"]) {
        CHDelegateViewController * VC = [[CHDelegateViewController alloc]init];
        
        [self.navigationController pushViewController:VC animated:YES];
    }if ([name isEqualToString:@"CHSingleChiose"]) {
        CHSingleChioseViewController * VC = [[CHSingleChioseViewController alloc]init];
               
               [self.navigationController pushViewController:VC animated:YES];
    }
}

@end
