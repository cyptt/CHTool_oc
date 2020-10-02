//
//  MVPTableViewCell.m
//  CHOCTool
//
//  Created by cyptt on 2020/10/1.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "MVPTableViewCell.h"

@implementation MVPTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)addBtnClick:(UIButton *)sender {
    _num ++;

    self.numL.text =[NSString stringWithFormat:@"%d",_num];
    if (self.delegate) {
        [self.delegate addBtnWithNum:_num indexPath:self.indexPath];
    }
}

//mvc
//-(void)setMvpModel:(MVPModel *)mvpModel{
//    _mvpModel = mvpModel;
//    _num = _mvpModel.count;
//    self.numL.text = [NSString stringWithFormat:@"%d",_num];
//}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

  
}

@end
