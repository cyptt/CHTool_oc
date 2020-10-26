//
//  NSObject+CHNotNull.h
//  CHOCTool
//
//  Created by cyptt on 2020/10/26.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (CHNotNull)

/**
 判断一个对象是否为空 yes 存在空 no 不存在
 */
-(BOOL)notAllNull;
@end

NS_ASSUME_NONNULL_END
