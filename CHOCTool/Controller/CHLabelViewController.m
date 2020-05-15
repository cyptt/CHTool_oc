//
//  CHLabelViewController.m
//  CHOCTool
//
//  Created by cyptt on 2020/5/14.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "CHLabelViewController.h"

@interface CHLabelViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testL;

@end

@implementation CHLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
 for(NSString *familyName in [UIFont familyNames])
    {
        NSLog(@"%@",familyName);
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for(NSString *fontName in fontNames)
        {
            NSLog(@"\t|- %@",fontName);
        }
    }
    
    self.label1.font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
    
    self.label2.font = [UIFont fontWithName:@"Helvetica-BoldOblique" size:17];
    
    NSString * str1 = @"你的风好大货到付款的好方法";
    if (   [str1 rangeOfString:@"你的风d"].location !=NSNotFound) {
        NSLog(@"dddfdfd");
    }
 
   NSString * str2=  [str1 substringWithRange:NSMakeRange(3, 4)];
    
    NSLog(@"str2-----%@",str2);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSMutableAttributedString * mutableString = [[NSMutableAttributedString alloc]initWithString:@"123456fg90df江东父老撒法兰多拉会发生手榴弹啊登录分哈伦裤撒谎法拉第好啊舒服多啦可视电话烦死啦啊的好福利卡坏了"];
 
    NSRange range = NSMakeRange(3, 3);
    [mutableString replaceCharactersInRange:range withString:@"***"];
    
    NSRange range2 = NSMakeRange(6, 30);
    //段落样式
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
       
    paragraphStyle.paragraphSpacing = 20;
    paragraphStyle.lineSpacing = 5;
    paragraphStyle.firstLineHeadIndent = 30;
        
    NSDictionary * attributesDic = @{NSForegroundColorAttributeName:[UIColor redColor],
                                     NSBackgroundColorAttributeName:[UIColor yellowColor],
                                     NSFontAttributeName:[UIFont systemFontOfSize:17],
                                     NSParagraphStyleAttributeName:paragraphStyle,
//                                     NSObliquenessAttributeName:@(1),
//                                     NSExpansionAttributeName:@(1),
//                                     NSKernAttributeName:@(10),
//                                     NSUnderlineStyleAttributeName:@(1),
//                                     NSUnderlineColorAttributeName:[UIColor blueColor],
    };
    
    [mutableString setAttributes:attributesDic range:NSMakeRange(0, mutableString.string.length)];

    [mutableString setAttributes:attributesDic range:range2];
    
    
    NSRange range3 = NSMakeRange(8, 1);
    [mutableString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:range3];
    
     
    
    [self.testL setAttributedText:mutableString];;
   

    
    CGFloat lableH = [self lableH:mutableString.string size:CGSizeMake(self.testL.frame.size.width, MAXFLOAT) attributes:attributesDic];
    
    NSLog(@"---%lf",lableH);

    
}

-(CGFloat)lableH:(NSString *)str size:(CGSize)size attributes:(NSDictionary<NSAttributedStringKey,id> *)attributes{
    
  CGSize boundSize=  [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    
    return boundSize.height;
}



@end
