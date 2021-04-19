//
//  MVVMTableViewCell.h
//  CHOCTool
//
//  Created by cyptt on 2021/4/19.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Viewmodel.h"
#import "Model.h"
NS_ASSUME_NONNULL_BEGIN

@interface MVVMTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UILabel *tableL;


@property(nonatomic,strong)Viewmodel * viewModel;

@property(nonatomic,strong)Model * model;
@end

NS_ASSUME_NONNULL_END
