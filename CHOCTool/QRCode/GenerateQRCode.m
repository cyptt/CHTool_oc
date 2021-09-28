//
//  GenerateQRCode.m
//  CHOCTool
//
//  Created by cyptt on 2021/9/2.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "GenerateQRCode.h"

@implementation GenerateQRCode

#pragma mark -- 生成二维码

+ (UIImage *)createQRCodeWithTargetString:(NSString *)targetString logoImage:(UIImage *)logoImage {
    // 1.创建一个二维码滤镜实例
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    
    // 2.给滤镜添加数据
    NSString *targetStr = targetString;
    NSData *targetData = [targetStr dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    [filter setValue:targetData forKey:@"inputMessage"];
    
    // 3.生成二维码
    CIImage *image = [filter outputImage];
    
    // 4.高清处理: size 要大于等于视图显示的尺寸
    UIImage *img = [self createNonInterpolatedUIImageFromCIImage:image size:[UIScreen mainScreen].bounds.size.width];
    
    //5.嵌入LOGO
    //5.1开启图形上下文
    UIGraphicsBeginImageContext(img.size);
    //5.2将二维码的LOGO画入
    [img drawInRect:CGRectMake(0, 0, img.size.width, img.size.height)];
    
    UIImage *centerImg = logoImage;
    CGFloat centerW=img.size.width*0.25;
    CGFloat centerH=centerW;
    CGFloat centerX=(img.size.width-centerW)*0.5;
    CGFloat centerY=(img.size.height -centerH)*0.5;
    [centerImg drawInRect:CGRectMake(centerX, centerY, centerW, centerH)];
    //5.3获取绘制好的图片
    UIImage *finalImg=UIGraphicsGetImageFromCurrentImageContext();
    //5.4关闭图像上下文
    UIGraphicsEndImageContext();

    //6.生成最终二维码
    return finalImg;
}

+(UIImage *)createNonInterpolatedUIImageFromCIImage:(CIImage *)image size:(CGFloat)size {
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 1.创建bitmap
    size_t width = CGRectGetWidth(extent)*scale;
    size_t height = CGRectGetHeight(extent)*scale;
    
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    //2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    
    return [UIImage imageWithCGImage:scaledImage];
}
@end
