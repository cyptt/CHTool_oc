//
//  CHNetError.m
//  CHOCTool
//
//  Created by cyptt on 2022/1/12.
//  Copyright © 2022 com.qingtiantree. All rights reserved.
//

#import "CHNattiveError.h"
static NSString * const NETERROR = @"NET_ERROR";
@implementation CHNattiveError

+(NSError *)error:(NSString *)errMsg code:(NSInteger)code{
    
    NSString * domanin;
    if (errMsg != nil || errMsg.length >0) {
        domanin = errMsg;
    }else{
        domanin = [NSString stringWithFormat:@"%@%ld",NETERROR,code];
        
    }

    NSError * err = [[NSError alloc]initWithDomain:domanin code:code userInfo:nil];
    
    return  err;
}
@end
