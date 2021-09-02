//
//  D_Person.h
//  CHOCTool
//
//  Created by cyptt on 2021/8/31.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface D_Person : NSObject<NSCopying>
-(void)eat;

@property(nonatomic,strong)NSString * name;
@end

NS_ASSUME_NONNULL_END
