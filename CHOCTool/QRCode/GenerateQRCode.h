//
//  GenerateQRCode.h
//  CHOCTool
//
//  Created by cyptt on 2021/9/2.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface GenerateQRCode : NSObject
+ (UIImage *)createQRCodeWithTargetString:(NSString *)targetString logoImage:(UIImage *)logoImage;
@end

NS_ASSUME_NONNULL_END
