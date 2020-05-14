//
//  CHCommonAlertController.m
//  SCCAAuthSDKDemo
//
//  Created by cyptt on 2020/5/11.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "CHTitleAlertController.h"

@interface CHTitleAlertController ()
@property(nonatomic,strong)void(^completion) (void);

@property(nonatomic,strong)UIView *alertContentView;
@property(nonatomic,strong)NSString * showTitle;

@property(nonatomic,strong)UILabel * showLablel;
@property(nonatomic,strong)UIButton * sureBtn;

@property(nonatomic,strong)UIView * bottomView;

@property(nonatomic,strong)UIButton * bottomSureBtn;
@property(nonatomic,strong)UIButton * bottomCancleBtn;

@property(nonatomic,assign)BOOL  isSigle;
@property(nonatomic,strong)NSString * singleBtnTitle;
@property(nonatomic,strong)NSString * leftTitle;
@property(nonatomic,strong)NSString * rightTitle;
@end

@implementation CHTitleAlertController
-(instancetype)initAlertControllerWithTitle:(NSString *)title isSigle:(BOOL)isSigle completion:(void (^ __nullable)(void))completion{
    if (self =[super init]) {
        self.completion =  completion;
        self.showTitle = title;
        self.isSigle = isSigle;
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        
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
    
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
       self.view.alpha = 1;
   
    if (self.isSigle) {
        self.bottomView.hidden = YES;
        self.sureBtn.hidden = NO;
    }else{
        self.sureBtn.hidden = YES;
        self.bottomView.hidden =NO;
    }
}
-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    [self.view addSubview:self.alertContentView];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
  
}

-(CGFloat)alertViewH{
    
    return [self textHeight:self.showTitle];
    
}

-(void)singleBtnClick:(UIButton *)btn{
    
    if (self.singleBtnCallBackBlock) {
        self.singleBtnCallBackBlock();
    }
      [self dismissViewControllerAnimated:NO completion:nil];
}

-(void)leftBtnClick:(UIButton *)btn{
    if (self.leftBtnCallBackBlock) {
        self.leftBtnCallBackBlock();
    }
      [self dismissViewControllerAnimated:NO completion:nil];
}
-(void)rightBtnClick:(UIButton *)btn{
    if (self.rightBtnCallBackBlock) {
        self.rightBtnCallBackBlock();
    }
      [self dismissViewControllerAnimated:NO completion:nil];
}

-(CGFloat)textHeight:(NSString *)str{
    NSDictionary * attributes = [self attributes];
   //这里的size，width传label的宽，高默认都传MAXFLOAT
    CGSize textRect = CGSizeMake([UIScreen mainScreen].bounds.size.width - 30, MAXFLOAT);
    CGFloat textHeight = [str boundingRectWithSize: textRect
                                           options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                        attributes:attributes
                                           context:nil].size.height;
    return textHeight+20;
}
-(NSDictionary *)attributes{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
       paragraphStyle.lineSpacing = 10;
       paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
       //Attribute传和label设定的一样
       NSDictionary * attributes = @{
                                     NSFontAttributeName:[UIFont systemFontOfSize:15.f],
                                     NSParagraphStyleAttributeName: paragraphStyle
                                     };
    return attributes;
}
-(void)setContentTitleColor:(UIColor *)color{
    [self.showLablel setTextColor:color];
}

-(void)setLeftTitle:(NSString *)leftTitle{
    _leftTitle = leftTitle;
    
    [self.bottomCancleBtn setTitle:leftTitle forState:UIControlStateNormal];
}

-(void)setRightTitle:(NSString *)rightTitle{
    _rightTitle = rightTitle;
     [self.bottomSureBtn setTitle:rightTitle forState:UIControlStateNormal];
}

-(void)setSingleBtnTitle:(NSString *)singleBtnTitle{
    _singleBtnTitle = singleBtnTitle;
    [self.sureBtn setTitle:singleBtnTitle forState:UIControlStateNormal];
}

-(void)setLeftBgColor:(UIColor *)color{
    [self.bottomCancleBtn setTitleColor:color forState:UIControlStateNormal];
}
-(void)setRightBgColor:(UIColor *)color{
     [self.bottomSureBtn setTitleColor:color forState:UIControlStateNormal];
}
-(void)setSigleBgColor:(UIColor *)color{
     [self.sureBtn setTitleColor:color forState:UIControlStateNormal];
}

-(void)setLeftTitleColor:(UIColor *)color{
    [self.bottomCancleBtn setTitleColor:color forState:UIControlStateNormal];
}
-(void)setRightTitleColor:(UIColor *)color{
    [self.bottomSureBtn setTitleColor:color forState:UIControlStateNormal];
}
-(void)setSigleTitleColor:(UIColor *)color{
    [self.sureBtn setTitleColor:color forState:UIControlStateNormal];
}
#pragma mark --lazy
-(UIView *)alertContentView{
    if (!_alertContentView) {
    
        _alertContentView = [[UIView alloc]init];
        _alertContentView.frame = CGRectMake(0, 0, self.view.frame.size.width-40, [self alertViewH] +40+100);
        _alertContentView.center = self.view.center;
        _alertContentView.backgroundColor = [UIColor whiteColor];
        _alertContentView.layer.cornerRadius =5;
        _alertContentView.layer.masksToBounds = YES;
        [_alertContentView addSubview:self.showLablel];
        [_alertContentView addSubview:self.sureBtn];
        [_alertContentView addSubview:self.bottomView];
       
    }
    return _alertContentView;
}


-(UILabel *)showLablel{
    if (!_showLablel) {
        _showLablel = [[UILabel alloc]initWithFrame:CGRectMake(20, 40, self.alertContentView.frame.size.width-40, [self alertViewH])];

        _showLablel.text = self.showTitle;
        if ([self alertViewH]>40) {
            _showLablel.textAlignment = NSTextAlignmentLeft;
        }else{
            _showLablel.textAlignment = NSTextAlignmentCenter;
        }
            [_showLablel setValue:@(20) forKey:@"lineSpacing"];
        
        _showLablel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        _showLablel.font = [UIFont systemFontOfSize:15];
        _showLablel.numberOfLines=0;
       
    }
   return  _showLablel ;
}

-(UIButton *)sureBtn{
    if (!_sureBtn) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _sureBtn.frame =CGRectMake(20, self.alertContentView.frame.size.height-60, self.alertContentView.frame.size.width-40, 44);
        _sureBtn.backgroundColor = [UIColor colorWithRed:55/255.0 green:141/255.0 blue:245/255.0 alpha:1];
        [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _sureBtn.layer.masksToBounds = YES;
        _sureBtn.layer.cornerRadius =3;
        _sureBtn.hidden = YES;
        [_sureBtn addTarget:self action:@selector(singleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
}


-(UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, self.alertContentView.frame.size.height-60, self.alertContentView.frame.size.width, 44)];
        _bottomView.hidden = YES;
    
        [_bottomView addSubview:self.bottomCancleBtn];
        [_bottomView addSubview:self.bottomSureBtn];
    }
    return _bottomView;
}

-(UIButton *)bottomCancleBtn{
    if (!_bottomCancleBtn) {
        _bottomCancleBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _bottomCancleBtn.frame = CGRectMake(20, 0, self.alertContentView.frame.size.width/2 -30, 44);
        _bottomCancleBtn.backgroundColor = [UIColor colorWithRed:214/255.0 green:214/255.0 blue:214/255.0 alpha:1];
        [_bottomCancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_bottomCancleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_bottomCancleBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _bottomCancleBtn.layer.masksToBounds = YES;
        _bottomCancleBtn.layer.cornerRadius =3;
    }
    return _bottomCancleBtn;
}

-(UIButton *)bottomSureBtn{
    if (!_bottomSureBtn) {
        _bottomSureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _bottomSureBtn.frame = CGRectMake(self.alertContentView.frame.size.width/2 +10, 0, self.alertContentView.frame.size.width/2 -30, 44);
        _bottomSureBtn.backgroundColor = [UIColor colorWithRed:55/255.0 green:141/255.0 blue:245/255.0 alpha:1];
        [_bottomSureBtn setTitle:@"确定" forState:UIControlStateNormal];
           [_bottomSureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_bottomSureBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _bottomSureBtn.layer.masksToBounds = YES;
        _bottomSureBtn.layer.cornerRadius =3;
    }
    return _bottomSureBtn;
}
@end
