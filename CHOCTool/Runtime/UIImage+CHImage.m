//
//  UIImage+CHImage.m
//  CHOCTool
//
//  Created by cyptt on 2021/5/13.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "UIImage+CHImage.h"
#import <objc/runtime.h>
@implementation UIImage (CHImage)

+(void)load{
    Method m1 = class_getClassMethod(self, @selector(imageNamed:));
    Method m2 = class_getClassMethod(self, @selector(imageWithName:));
    method_exchangeImplementations(m2, m1);
}

+(instancetype)imageWithName:(NSString *)name{
    UIImage * image =[self imageWithName:name];
    if (image ==nil) {
        NSLog(@"空图片");
    }
    return  image;
}
@end
