//
//  ArchiveModel.m
//  CHOCTool
//
//  Created by cyptt on 2021/5/13.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "ArchiveModel.h"
#import <objc/runtime.h>

@implementation ArchiveModel


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        
//        self.name = [coder decodeObjectForKey:@"name"];
//        self.age = [coder decodeIntForKey:@"age"];
        
        //runtime 实现
        
        unsigned int count = 0;
        Ivar * ivars = class_copyIvarList([ArchiveModel class], &count);
        for (int i =0; i<count; i++) {
            Ivar ivar = ivars[i];
            const char * name = ivar_getName(ivar);
    
            NSString * key = [NSString stringWithUTF8String:name];
            id value = [coder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        free(ivars);
  
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)coder{
//    [coder encodeObject:self.name forKey:@"name"];
//    [coder encodeInt:self.age forKey:@"age"];
    
    //runtime 实现
    
    unsigned int count = 0;
    Ivar * ivars = class_copyIvarList([ArchiveModel class ], &count);
    for (int i =0; i<count; i++) {

        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        NSString * key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
    
        [coder encodeObject:value forKey:key];
      
       
    }
    
    free(ivars);
}
@end
