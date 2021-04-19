//
//  MVVM2ControllerViewController.m
//  CHOCTool
//
//  Created by cyptt on 2021/4/19.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "MVVM2ControllerViewController.h"
#import "Viewmodel.h"
#import "MVVMTableViewCell.h"
@interface MVVM2ControllerViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataSourceArr;
@property(nonatomic,strong)Viewmodel * viewModel;
@end

@implementation MVVM2ControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.tableView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.viewModel = [[Viewmodel alloc]init];
     [self.viewModel freshDataSource];
    self.dataSourceArr = self.viewModel.dataSourceArr;
    
    [self.viewModel initWithBlock:^(id  _Nonnull data) {
        self.dataSourceArr = data;
        [self.tableView reloadData];
        } fail:^(id  _Nonnull data) {
            
        }];
    
}

#pragma mark---tableDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  self.dataSourceArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MVVMTableViewCell * cell =  [tableView dequeueReusableCellWithIdentifier:@"CELL_MVVM"];
    if (!cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([MVVMTableViewCell class]) owner:self options:nil].lastObject;
    }
    
    [cell setViewModel:self.viewModel];
    [cell setModel:self.dataSourceArr[indexPath.row]];
    
    return  cell;
}
#pragma mark---lazy
-(UITableView *)tableView{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return  _tableView;
}
@end
