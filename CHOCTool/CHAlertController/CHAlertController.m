//
//  CHAlertController.m
//  SCCAAuthSDKDemo
//
//  Created by cyptt on 2020/3/28.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "CHAlertController.h"

@interface CHAlertController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UIView * alertContentView;

@property(nonatomic,assign)CGFloat contentH;
@property(nonatomic,strong)UIButton * cancelBtn;
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSArray * dataSourceArr;

@property(nonatomic,strong)void(^completion) (CAAlertModel * alertModel);
@end

static NSString * const CHAlertControllerCELLID = @"CHAlertControllerCELLID";

@implementation CHAlertController
- (instancetype)init
{
    self = [super init];
    if (self) {
          self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    }
    return self;
}
-(instancetype)initAlertControllerWithDataSource:(NSArray<CAAlertModel*> *)dataSource completion:(void (^ __nullable)(CAAlertModel * alertModel))completion{
    if (self = [super init]) {
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        self.contentH = dataSource.count*50;
        self.dataSourceArr = dataSource;
        self.completion = completion;
      
    }
    return self;
}

#pragma mark --tableviewdelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CAAlertTableCell * cell = [tableView dequeueReusableCellWithIdentifier:CHAlertControllerCELLID];
    if (cell==nil) {
        cell = [[CAAlertTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CHAlertControllerCELLID];
    }
    CAAlertModel * model = self.dataSourceArr[indexPath.row];
    cell.contentL.text =model.name;;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self dismissViewControllerAnimated:YES completion:nil];
    self.completion(self.dataSourceArr[indexPath.row]);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    self.view.alpha = 1;
    
    [self.view addSubview:self.alertContentView];
 

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
        [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark --lazy

-(UIView *)alertContentView{
    if (!_alertContentView) {
    
        
    
        _alertContentView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-self.contentH, self.view.frame.size.width, self.contentH)];
        _alertContentView.backgroundColor = [UIColor whiteColor];
        _alertContentView.alpha=1;
        [_alertContentView addSubview:self.tableView];
    
    }
    return _alertContentView;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,self.alertContentView.frame.size.width , self.alertContentView.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = [UIColor clearColor];
    
    }
    return _tableView;
}


@end

@interface CAAlertTableCell ()
@property(nonatomic,strong)UIView * lineView;

@end
@implementation CAAlertTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUp];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

-(void)setUp{

    UILabel * label = [[UILabel alloc]init];
 
    
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    [label setFont:[UIFont systemFontOfSize:15]];

    [self.contentView addSubview:label];
    self.contentL = label;
    
    UIView * lineView = [[UIView alloc]init];
    lineView.backgroundColor =  [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    [self.contentView addSubview:lineView];
    self.lineView = lineView;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.contentL.frame = self.bounds;
    self.lineView.frame = CGRectMake(0, self.frame.size.height-1, self.frame.size.width, 1);
    
    
}

@end


@implementation CAAlertModel

@end
