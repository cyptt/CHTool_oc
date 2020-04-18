//
//  CHAlertController.h
//  SCCAAuthSDKDemo
//
//  Created by cyptt on 2020/3/28.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CAAlertTableCell;
@class CAAlertModel;
@interface CHAlertController : UIViewController

-(instancetype)initAlertControllerWithDataSource:(NSArray<CAAlertModel*> *)dataSource completion:(void (^ __nullable)(CAAlertModel * alertModel))completion;
@end

@interface CAAlertTableCell : UITableViewCell
@property(nonatomic,strong)UILabel * contentL;
@end

@interface CAAlertModel : NSObject
@property(nonatomic,strong)NSString * name;
@property(nonatomic,strong)NSString * ID;

@property(nonatomic,assign)BOOL  isSelect;
@end

NS_ASSUME_NONNULL_END
