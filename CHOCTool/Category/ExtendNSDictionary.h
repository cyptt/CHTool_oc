//
//  ExtendNSDictionary.h
//  Futuan
//
//  Created by 陈 福权 on 11-12-4.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary(util)

-(NSString *) toString:(NSString *)aKey;
-(int) toInt:(NSString *)aKey;
-(float) toFloat:(NSString *)aKey;	

@end
