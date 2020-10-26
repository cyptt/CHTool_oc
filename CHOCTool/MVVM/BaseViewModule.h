//
//  BaseViewModule.h
//  MVP
//
//  Created by 彭超 on 2019/3/7.
//  Copyright © 2019 彭超. All rights reserved.
//

#ifndef BaseViewModule_h
#define BaseViewModule_h

typedef void(^SuccessBlock)(id data);
typedef void(^FailureBlock)(id data);

@interface BaseViewModule : NSObject

@property (nonatomic, copy)SuccessBlock successBlock;
@property (nonatomic, copy)FailureBlock failureBlock;

-(void)initWithBlockSuccess:(SuccessBlock)successBlock
                    Failure:(FailureBlock)failureBlock;

@end

#endif /* BaseViewModule_h */
