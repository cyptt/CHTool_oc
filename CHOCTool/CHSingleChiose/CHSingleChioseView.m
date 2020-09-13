//
//  CHSingleChioseView.m
//  CHOCTool
//
//  Created by cyptt on 2020/9/13.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "CHSingleChioseView.h"

@interface CHSingleChioseView ()

@property(nonatomic,strong)UIButton * currentBtn;

@property(nonatomic,strong)NSMutableArray * buttonArr;
@end
@implementation CHSingleChioseView

-(NSMutableArray *)buttonArr{
    if (!_buttonArr) {
        _buttonArr = [NSMutableArray array];
    }
    return _buttonArr;
}
-(void)awakeFromNib{
    
    [super awakeFromNib];
    [self initViews];
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
         [self initViews];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
         [self initViews];
    }
    return self;
}

-(void)initViews{
   
    
}

-(void)setTitleArr:(NSArray *)titleArr defaultColor:(UIColor *)defaultColor selectedColor:(UIColor *)selectedColor{
    _titleArr = titleArr;
    CGFloat selfW = self.frame.size.width;
    CGFloat selfH = self.frame.size.height;
    for (int i =0 ; i<titleArr.count; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(selfW*i/titleArr.count, 0, selfW/titleArr.count, selfH);
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        [button setTitleColor:defaultColor forState:UIControlStateNormal];
        [button setTitleColor:selectedColor forState:UIControlStateSelected];
        if (i==0) {
            button.selected = YES;
            self.currentBtn = button;
        }
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [self.buttonArr addObject:button];
        
    }
}

-(void)setButtonTitleSize:(CGFloat)fontSize{
    for (UIButton * btn in self.buttonArr) {
        btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    }
}
-(void)btnClick:(UIButton *)btn{
    self.currentBtn.selected = NO;
    btn.selected = !btn.selected;
    self.currentBtn = btn;
 
    if (self.btnClickBlock) {
        self.btnClickBlock((__bridge void * _Nonnull)(btn.currentTitle));
    }

}


@end
