//
//  MVPViewController.m
//  CHOCTool
//
//  Created by cyptt on 2020/10/1.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "MVPViewController.h"
#import "MVPModel.h"
#import "MVPTableViewCell.h"
#import "Present.h"
@interface MVPViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)NSMutableArray * dataSourceArr;
@property(nonatomic,strong) Present * prsent;
@end

static NSString * const MVPCELLID = @"MVPCELLID";

@implementation MVPViewController

- (NSMutableArray *)dataSourceArr{

    if (!_dataSourceArr) {
        _dataSourceArr = [NSMutableArray array];
        NSArray * dataArr1 = @[@{@"count":@1},@{@"count":@1},@{@"count":@1},@{@"count":@1},@{@"count":@1},@{@"count":@1},@{@"count":@1},@{@"count":@1},@{@"count":@1},@{@"count":@1}];
        for (int i = 0; i<dataArr1.count; i++) {
            MVPModel * model = [[MVPModel alloc]init];
            model.count = [dataArr1[i][@"count"] intValue];
            [_dataSourceArr addObject:model];
            
        }
    }
    return _dataSourceArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.prsent = [[Present alloc]initWithDataSourceArr:self.dataSourceArr];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSourceArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MVPTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:MVPCELLID];
    if (nil==cell) {
        cell = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([MVPTableViewCell class]) owner:self options:nil].lastObject;
    }
    MVPModel * model = self.dataSourceArr[indexPath.row];
    cell.indexPath = indexPath;
    cell.delegate = self.prsent;
    cell.numL.text = [NSString stringWithFormat:@"%d",model.count];
    
//    [cell setMvpModel:self.dataSourceArr[indexPath.row]];
    return cell;
    

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    MVPModel * model = self.dataSourceArr[0];
    NSLog(@"%d",model.count);
}

@end
