//
//  CHSingleChioseView.m
//  CHOCTool
//
//  Created by cyptt on 2020/9/13.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "CHSingleChioseView.h"

@interface CHSingleChioseView (){
    CGFloat selfW;
    CGFloat selfH;
}

@property(nonatomic,strong)UIButton * currentBtn;

@property(nonatomic,strong)NSMutableArray * buttonArr;
@property(nonatomic,strong)NSMutableArray * lineArr;


@end
NSInteger SigleChioseTAG = 10000;
@implementation CHSingleChioseView


-(NSMutableArray *)buttonArr{
    if (!_buttonArr) {
        _buttonArr = [NSMutableArray array];
    }
    return _buttonArr;
}
-(NSMutableArray *)lineArr{
    if (!_lineArr) {
        _lineArr =[NSMutableArray array];
    }
    return _lineArr;
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
    selfW = self.frame.size.width;
    selfH = self.frame.size.height;
    
}

-(void)setTitleArr:(NSArray *)titleArr defaultColor:(UIColor *)defaultColor selectedColor:(UIColor *)selectedColor titleSize:(CGFloat)fontSize{
    _titleArr = titleArr;

    for (int i =0 ; i<titleArr.count; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(selfW*i/titleArr.count, 0, selfW/titleArr.count, selfH-10);
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
        button.tag =SigleChioseTAG +i;
        
        
        
        CGFloat lineW = [self getWidthWithString:titleArr[i] font:[UIFont systemFontOfSize:fontSize]] +4;
        UIView * lineView = [[UILabel alloc]initWithFrame:CGRectMake(0, selfH-10+2, lineW, 2)];
    
        lineView.center = CGPointMake(selfW*i/titleArr.count+selfW/(2*titleArr.count), selfH-10+1);
        lineView.backgroundColor = selectedColor;
        
        if (button.selected) {
            lineView.hidden = NO;
        }else{
            lineView.hidden = YES;
        }
    

        [self addSubview:lineView];
        [self.lineArr addObject:lineView];
        
    }
}

-(void)setButtonTitleSize:(CGFloat)fontSize{
    for (UIButton * btn in self.buttonArr) {
        btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    }
    
    int i =0;
    for (UIView * lineView in self.lineArr) {
  
        CGFloat lineW = [self getWidthWithString:self.titleArr[i] font:[UIFont systemFontOfSize:fontSize]] +4;
        lineView.frame= CGRectMake(0, selfH-10+2, lineW, 2);
        
        lineView.center = CGPointMake(selfW*i/self.titleArr.count+selfW/(2*self.titleArr.count), selfH-10+1);
              i++;
    }
}
-(void)btnClick:(UIButton *)btn{
    self.currentBtn.selected = NO;
    btn.selected = !btn.selected;
    self.currentBtn = btn;
  
    for (UIView * lineView in self.lineArr) {
      
        if ([lineView isEqual:self.lineArr[btn.tag-SigleChioseTAG]]) {
            lineView.hidden= NO;
        }else{
            lineView.hidden = YES;
        }
    }
   
 
    if (self.btnClickBlock) {
        self.btnClickBlock((__bridge void * _Nonnull)(btn.currentTitle));
    }


}

-(void)hideLineView{
    for (UIView * lineView in self.lineArr) {
        lineView.backgroundColor = [UIColor clearColor];
    }
    
    int i =0;
    for (UIButton * button in self.buttonArr) {
      
        button.frame = CGRectMake(selfW*i/self.titleArr.count, 0, selfW/self.titleArr.count, selfH);
          ++i;
    }
}



-(CGFloat)getWidthWithString:(NSString *)string font:(UIFont *)font{
    NSDictionary *attrs = @{NSFontAttributeName:font};
    CGFloat width = [string boundingRectWithSize:CGSizeZero options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
    return width;
}
@end
