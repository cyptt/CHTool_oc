//
//  Present.h
//  CHOCTool
//
//  Created by cyptt on 2020/10/1.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MVPModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PresentDelegate <NSObject>

-(void)addBtnWithNum:(int )num indexPath:(NSIndexPath*)indexPath;

-(void)reloadUI;

@end
@interface Present : NSObject<PresentDelegate>
@property(nonatomic,strong)NSArray * dataSourceArr;
- (instancetype)initWithDataSourceArr:(NSArray *)dataSourceArr;
@end

NS_ASSUME_NONNULL_END
