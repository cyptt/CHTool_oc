//
//  Viewmodel.h
//  CHOCTool
//
//  Created by cyptt on 2021/4/19.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^SuccessBlock)(id data);
typedef void(^FailBlock)(id data);

@interface Viewmodel : NSObject
@property(nonatomic,strong)NSMutableArray * dataSourceArr;

-(void)freshDataSource;

@property(nonatomic,strong)NSString * contentKey;
@property (nonatomic, copy) SuccessBlock successBlock;
@property (nonatomic, copy) FailBlock failBlock;
- (void)initWithBlock:(SuccessBlock)successBlock fail:(FailBlock)failBlock;
@end

NS_ASSUME_NONNULL_END
