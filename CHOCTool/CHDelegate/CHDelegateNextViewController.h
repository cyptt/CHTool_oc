//
//  CHDelegateNextViewController.h
//  CHOCTool
//
//  Created by cyptt on 2020/5/29.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface CHDelegateNextViewController : UIViewController
-(instancetype)initWithDelegate:(id<CHDelegate>)delegate;
@property(nonatomic,weak) id<CHDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
