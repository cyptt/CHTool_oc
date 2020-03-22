//
//  CHModel.h
//  ddd
//
//  Created by cyptt on 2020/3/22.
//  Copyright © 2020 com.scca. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<CHModel/CHModel.h>)
FOUNDATION_EXPORT double CHModelVersionNumber;
FOUNDATION_EXPORT const unsigned char CHModelVersionString[];
#import <CHModel/NSObject+CHModel.h>
#import <CHModel/CHClassInfo.h>
#else
#import "NSObject+CHModel.h"
#import "CHClassInfo.h"
#endif
