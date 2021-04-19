//
//  MVVMTableViewCell.m
//  CHOCTool
//
//  Created by cyptt on 2021/4/19.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "MVVMTableViewCell.h"

@implementation MVVMTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setViewModel:(Viewmodel *)viewModel{
    _viewModel = viewModel;
}

-(void)setModel:(Model *)model{
    _model = model;
    self.tableL.text =[NSString stringWithFormat:@"%d",model.count];
}
- (IBAction)addClick:(id)sender {

    self.model.count = self.model.count +1;
    
    
    self.viewModel.contentKey = [NSString stringWithFormat:@"%d,%@",self.model.count,self.model.name];
}

@end
