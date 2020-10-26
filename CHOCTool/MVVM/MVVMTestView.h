//
//  MVVMTestView.h
//  CHOCTool
//
//  Created by cyptt on 2020/10/2.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewModule.h"
NS_ASSUME_NONNULL_BEGIN

@interface MVVMTestView : UIView
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UIButton *submitBTN;
@property(nonatomic,strong)ViewModule * viewModule;
@end

NS_ASSUME_NONNULL_END
