//
//  TestRuntime.m
//  CHOCTool
//
//  Created by cyptt on 2020/9/18.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "TestRuntime.h"
#import <objc/runtime.h>
#import "Person.h"
@interface TestRuntime(){
   @public NSString * pubName;

}

@end
@interface Person(){
 
  @public  NSString * personName;
    
}

@end
@implementation TestRuntime{
    
    @private NSString * neiName;
 
    

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        neiName = @"张三";
    }
    return self;
}
-(void)test:(NSString *)msg{
    NSLog(@"%@",msg);
}

-(void)test2{
    

}

-(void)chagePrivateProperty{
    NSLog(@"%@",neiName);
}

-(void)interfacePerson{
    
    Person * person = [[Person alloc]init];
    

   
    
    
    
}
@end
