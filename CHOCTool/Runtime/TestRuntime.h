//
//  TestRuntime.h
//  CHOCTool
//
//  Created by cyptt on 2020/9/18.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestRuntime : NSObject
{
    NSString *  pubmTest;
}
-(void)test:(NSString *)msg;

-(void)chagePrivateProperty;
@property(nonatomic,strong)NSString * nametest;
@property(nonatomic,assign)int  age;


-(void)interfacePerson;

@end

NS_ASSUME_NONNULL_END
