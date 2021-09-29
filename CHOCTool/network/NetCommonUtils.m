//
//  NetCommonUtils.m
//  CHOCTool
//
//  Created by cyptt on 2021/9/28.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "NetCommonUtils.h"

@implementation NetCommonUtils

+(NSString*)formString:(NSDictionary*)formDict {
    NSLog(@"-formDict------%@",formDict);
    if (!formDict || [formDict allKeys].count==0) {
        return @"";
    }
    NSMutableString *formStr = [NSMutableString string];
    if (formDict) {
        [[formDict allKeys] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *objStr = (NSString*)obj;
            id value = formDict[objStr];
            if ([value isKindOfClass:[NSString class]]) {
                [formStr appendFormat:@"%@=%@&", objStr, (__bridge NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)value,NULL,CFSTR(":/?#[]@!$&’()*+,;="),kCFStringEncodingUTF8)];
            }
            if ([value isKindOfClass:[NSArray class]]) {
                for (NSString *val in value) {
                    [formStr appendFormat:@"%@=%@&", objStr, (__bridge NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)val,NULL,CFSTR(":/?#[]@!$&’()*+,;="),kCFStringEncodingUTF8)];
                }
            }
        }];
    }
    
    //    return [[[formStr substringWithRange:NSMakeRange(0, formStr.length-1)] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]] dataUsingEncoding:NSUTF8StringEncoding];
    return [formStr substringWithRange:NSMakeRange(0, formStr.length-1)];
}

+(NSString *)getmMimeType:(NSString *)path{
    NSURL * url = [NSURL fileURLWithPath:path];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    NSHTTPURLResponse * response = nil;
     [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
     return response.MIMEType;
}
@end
