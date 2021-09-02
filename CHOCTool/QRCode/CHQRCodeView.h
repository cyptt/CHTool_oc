//
//  CHQRCodeManage.h
//  bridging_js
//
//  Created by cyptt on 2021/9/2.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CHQRCodeView : UIView


/**
 开始扫码
 */
-(void)startScaning:(void (^ )(NSString *))result;

/**
 停止扫码
 */
-(void)stopScanning;

@end

NS_ASSUME_NONNULL_END
