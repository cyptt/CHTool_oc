//
//  CHLabelViewController.m
//  CHOCTool
//
//  Created by cyptt on 2020/5/14.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "CHLabelViewController.h"

@interface CHLabelViewController ()

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
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
       self.label1.font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
    
    self.label2.font = [UIFont boldSystemFontOfSize:17];
    

    
//    UILabel *label = [[UILabel alloc] init];
//      label.frame = CGRectMake(60,99.5,87.5,14.5);
//      label.numberOfLines = 0;
//      [self.view addSubview:label];
//
//       NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"请先进行实名认证" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"SourceHanSansCN-Medium" size: 16],NSForegroundColorAttributeName: [UIColor colorWithRed:34/255.0 green:38/255.0 blue:44/255.0 alpha:1.0]}];
//
//
//      label.attributedText = string;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
