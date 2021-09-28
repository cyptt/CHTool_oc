//
//  CHDefaultAlert.h
//  CHOCTool
//
//  Created by cyptt on 2021/9/22.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CHDefaultAlert : NSObject
+(void)showAlertWithController:(UIViewController *)controller title:(NSString *)title message:(NSString *)msg arr:(NSArray *)arr handler:(void (^ __nullable)(UIAlertAction *action))handler;

@end

NS_ASSUME_NONNULL_END
