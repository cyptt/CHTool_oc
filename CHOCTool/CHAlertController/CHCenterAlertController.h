//
//  CHCenterAlertController.h
//  SCCAAuthSDKDemo
//
//  Created by cyptt on 2020/4/15.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHAlertController.h"
NS_ASSUME_NONNULL_BEGIN

@class CAAlertModel;
@class CACenterAlertTableCell;
@interface CHCenterAlertController : UIViewController
-(instancetype)initAlertControllerWithDataSource:(NSArray<CAAlertModel*> *)dataSource completion:(void (^ __nullable)(CAAlertModel * alertModel))completion;
@end


@interface CACenterAlertTableCell : UITableViewCell
@property(nonatomic,strong)UILabel * contentL;

@property(nonatomic,strong)CAAlertModel * alertModel;
@property(nonatomic,strong)UIImageView * imageV;
@end

NS_ASSUME_NONNULL_END
