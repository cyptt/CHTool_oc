//
//  RuntimeDicModel.h
//  CHOCTool
//
//  Created by cyptt on 2021/5/13.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RuntimeDicModel : NSObject

@property(nonatomic,copy)NSString *Name;
@property(nonatomic,assign)int Type;
@property(nonatomic,copy)NSString *Des;
@property(nonatomic,copy)NSString *Motto;
+ (instancetype)runtime_initWithDictionaryForModel:(NSDictionary *)dic;
-(instancetype)initWithDicToModel:(NSDictionary *)dic;
@end

NS_ASSUME_NONNULL_END
