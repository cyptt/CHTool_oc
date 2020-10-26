//
//  BaseViewModule.m
//  MVP
//
//  Created by 彭超 on 2019/3/7.
//  Copyright © 2019 彭超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModule.h"

@implementation BaseViewModule

-(void)initWithBlockSuccess:(SuccessBlock)successBlock
                    Failure:(FailureBlock)failureBlock
{
    _successBlock = successBlock;
    _failureBlock = failureBlock;
}

@end

