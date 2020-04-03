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
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property(nonatomic,strong)NSArray * dataSourceArr;;
@end



@implementation ViewController

-(NSArray *)dataSourceArr{
    if (!_dataSourceArr) {
        _dataSourceArr = @[@"FileManage",@"CHHash",@"JYTLoding",@"CHProgressHUD",@"CHAlert"];
    }
    return _dataSourceArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    
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
}

@end
