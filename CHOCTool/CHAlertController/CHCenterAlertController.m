//
//  CHCenterAlertController.m
//  SCCAAuthSDKDemo
//
//  Created by cyptt on 2020/4/15.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "CHCenterAlertController.h"

@interface CHCenterAlertController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UIView * alertContentView;
@property(nonatomic,strong)UIView * topTitleView;
@property(nonatomic,strong)UIView * bottomSureView;
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSArray * dataSourceArr;
@property(nonatomic,strong)void(^completion) (CAAlertModel * alertModel);
@property(nonatomic,strong)CAAlertModel * selectModel;
@end

static NSString * const CHCenterAlertControllerCELLID = @"CHCenterAlertControllerCELLID";
@implementation CHCenterAlertController

-(instancetype)initAlertControllerWithDataSource:(NSArray<CAAlertModel*> *)dataSource completion:(void (^ __nullable)(CAAlertModel * alertModel))completion{
    if (self = [super init]) {
          self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
//          self.contentH = dataSource.count*50;
          self.dataSourceArr = dataSource;
          self.completion = completion;
        
      }
      return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
          self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    self.view.alpha = 1;
    
    [self.view addSubview:self.alertContentView];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

}

-(void)cancelBtnClick:(UIButton *)btn{
     [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)sureBtnClick:(UIButton *)btn{
      
    BOOL isSelect =NO;
    for(CAAlertModel * model in self.dataSourceArr){
        if (model.isSelect) {
              isSelect = YES;
        }
     
    }
    if (isSelect==NO) {
       
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
         self.completion(self.selectModel);
    }
      
}

#pragma mark --tableviewdelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CACenterAlertTableCell * cell = [tableView dequeueReusableCellWithIdentifier:CHCenterAlertControllerCELLID];
    if (cell==nil) {
        cell = [[CACenterAlertTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CHCenterAlertControllerCELLID];
    }
       CAAlertModel * model = self.dataSourceArr[indexPath.row];
    [cell setAlertModel:model];
 
  
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


    for(CAAlertModel * model in self.dataSourceArr){
        model.isSelect = NO;
    }
    CAAlertModel * model = self.dataSourceArr[indexPath.row];
    model.isSelect = YES;
    self.selectModel = model;
    
    [tableView reloadData];
  
}


#pragma mark -- lazy
-(UIView *)alertContentView{
    if (!_alertContentView) {
        _alertContentView = [[UIView alloc]init];
        _alertContentView.frame = CGRectMake(0, 0, self.view.frame.size.width-30, 500);
        _alertContentView.center = self.view.center;
        _alertContentView.backgroundColor = [UIColor whiteColor];
        _alertContentView.layer.cornerRadius =5;
        _alertContentView.layer.masksToBounds = YES;
        [_alertContentView addSubview:self.topTitleView];
        [_alertContentView addSubview:self.bottomSureView];
        [_alertContentView addSubview:self.tableView];
    }
    return _alertContentView;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.topTitleView.frame) ,self.alertContentView.frame.size.width, self.alertContentView.frame.size.height-self.topTitleView.frame.size.height-self.bottomSureView.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = [UIColor clearColor];
    
    }
    return _tableView;
}

-(UIView *)topTitleView{
    if (!_topTitleView) {
        _topTitleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.alertContentView.frame.size.width, 50)];
        UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.topTitleView.frame.size.height-1, self.topTitleView.frame.size.width, 1)];
        lineView.backgroundColor = [UIColor colorWithRed:236/255.f green:236/255.f blue:236/255.f alpha:1];
        [_topTitleView addSubview: lineView];
        

        UILabel * titleNameL = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, self.view.frame.size.width-20, self.topTitleView.frame.size.height)];
        titleNameL.text = @"请选择住房公积金";
        [titleNameL setFont:[UIFont systemFontOfSize:15]];
        [_topTitleView addSubview:titleNameL];
     
    }
    return _topTitleView;
}

-(UIView *)bottomSureView{
    if (!_bottomSureView) {
        _bottomSureView = [[UIView alloc]initWithFrame:CGRectMake(0, self.alertContentView.frame.size.height-50, self.alertContentView.frame.size.width, 50)];
        UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.alertContentView.frame.size.width, 1)];
        lineView.backgroundColor = [UIColor colorWithRed:236/255.f green:236/255.f blue:236/255.f alpha:1];
        [_bottomSureView addSubview: lineView];
        
        UIButton * cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelBtn.frame = CGRectMake(0, 1, self.bottomSureView.frame.size.width/2, self.bottomSureView.frame.size.height-1);
        [cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [cancelBtn setTitleColor:[UIColor colorWithRed:51/255.f green:51/255.f blue:51/255.f alpha:1] forState:UIControlStateNormal];
        [_bottomSureView addSubview:cancelBtn];
        
        UIView * lineView2 = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(cancelBtn.frame), 0, 1, self.bottomSureView.frame.size.height)];
           lineView2.backgroundColor = [UIColor colorWithRed:236/255.f green:236/255.f blue:236/255.f alpha:1];
        [_bottomSureView addSubview: lineView2];
        
        UIButton * sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sureBtn.frame = CGRectMake(CGRectGetMaxX(lineView2.frame), 0, _bottomSureView.frame.size.width/2 -1, _bottomSureView.frame.size.height-1);
        [sureBtn addTarget:self action:@selector(sureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
              [sureBtn setTitleColor:[UIColor colorWithRed:55/255.f green:141/255.f blue:245/255.f alpha:1]forState:UIControlStateNormal];
              [_bottomSureView addSubview:sureBtn];
        
    }
    return _bottomSureView;
}
@end





@implementation CACenterAlertTableCell

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
-(void)setAlertModel:(CAAlertModel *)alertModel{
    _alertModel = alertModel;
    self.contentL.text =alertModel.name;
    if (alertModel.isSelect) {
        self.imageV.hidden = NO;
    }else{
         self.imageV.hidden = YES;
    }
 

}

-(CGFloat)getW:(NSString *)detail{

      CGSize size = CGSizeMake(MAXFLOAT, MAXFLOAT);
      CGRect rect = [detail boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
      return rect.size.width;
}
-(void)setUp{
 
    UILabel * label = [[UILabel alloc]init];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    [label setFont:[UIFont systemFontOfSize:15]];
    
    label.frame = self.frame;

    [self addSubview:label];
    
    self.contentL = label;
    
    UIView * lineView = [[UIView alloc]init];
    lineView.backgroundColor =  [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    [self.contentView addSubview:lineView];
   

    UIImageView * imageV = [[UIImageView alloc]init];
    imageV.image = [UIImage imageNamed:@"icon_select_scca.png"];
    imageV.translatesAutoresizingMaskIntoConstraints = NO;
    

    self.imageV = imageV;
    [self addSubview:imageV];
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
 

    self.contentL.frame = CGRectMake(0, 0, [self getW:self.alertModel.name], self.contentView.frame.size.height);

    self.contentL.center =CGPointMake(self.center.x, self.contentView.center.y);

    
    // 设置 redView 的宽 = 100.f * 1.f
       NSLayoutConstraint * wcons = [NSLayoutConstraint constraintWithItem:self.imageV
                                       attribute:NSLayoutAttributeWidth
                                       relatedBy:NSLayoutRelationEqual
                                          toItem:nil
                                       attribute:NSLayoutAttributeNotAnAttribute
                                      multiplier:1.f
                                        constant:20.f];
       // 设置 redView 的高 = 100.f * 1.f
       NSLayoutConstraint * hcons =  [NSLayoutConstraint constraintWithItem:self.imageV
                                      attribute:NSLayoutAttributeHeight
                                      relatedBy:NSLayoutRelationEqual
                                         toItem:nil
                                      attribute:NSLayoutAttributeNotAnAttribute
                                     multiplier:1.f
                                       constant:20.f];
       
       //中心
          NSLayoutConstraint *redViewTrailingConstraint =
               [NSLayoutConstraint constraintWithItem:self.imageV
                                            attribute:NSLayoutAttributeCenterY
                                            relatedBy:NSLayoutRelationEqual
                                               toItem:self
                                            attribute:NSLayoutAttributeCenterY
                                           multiplier:1.f
                                             constant:0.f];
          
          //右边
          NSLayoutConstraint *redViewleadingConstraint =
               [NSLayoutConstraint constraintWithItem:self.imageV
                                            attribute:NSLayoutAttributeTrailing
                                            relatedBy:NSLayoutRelationEqual
                                               toItem:self.contentL
                                            attribute:NSLayoutAttributeLeading
                                           multiplier:1.f
                                             constant:-5.f];
         
          
          [self addConstraint:wcons];
          [self addConstraint:hcons];
          [self addConstraint:redViewTrailingConstraint];

          [self addConstraint:redViewleadingConstraint];

}
@end

