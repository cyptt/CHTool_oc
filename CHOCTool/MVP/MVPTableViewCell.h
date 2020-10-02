//
//  MVPTableViewCell.h
//  CHOCTool
//
//  Created by cyptt on 2020/10/1.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVPModel.h"
#import "Present.h"
NS_ASSUME_NONNULL_BEGIN

@interface MVPTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *numL;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@property(nonatomic,strong)MVPModel * mvpModel;
@property(nonatomic,assign)int  num;
@property(nonatomic,strong)NSIndexPath * indexPath;

@property(nonatomic,weak)id<PresentDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
