//
//  CHObject+Obj1.m
//  CHOCTool
//
//  Created by cyptt on 2021/4/23.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "CHObject+Obj1.h"
#import <objc/runtime.h>
@implementation CHObject (Obj1)

-(void)test{
    NSLog(@"002");
}


-(void)setName2:(NSString *)name2{
    
    objc_setAssociatedObject(self, &"name2Key", name2, OBJC_ASSOCIATION_COPY);
    
}
-(NSString *)name2{
    return objc_getAssociatedObject(self, &"name2Key");;
}
@end
