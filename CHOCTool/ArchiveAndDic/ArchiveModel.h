//
//  ArchiveModel.h
//  CHOCTool
//
//  Created by cyptt on 2021/5/13.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArchiveModel : NSObject<NSCoding>
@property(nonatomic,strong)NSString * name;
@property(nonatomic,assign)int  age;
@end

NS_ASSUME_NONNULL_END
