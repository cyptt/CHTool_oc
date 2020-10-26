//
//  Present.m
//  MVP
//
//  Created by 彭超 on 2019/3/7.
//  Copyright © 2019 彭超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewModule.h"
#import "MVVMModel.h"

@interface ViewModule()

@property (nonatomic, strong)MVVMModel*  modual;


@end

@implementation ViewModule

-(instancetype)init
{
    self = [super init];
    if(self)
    {
        _result = @"init";
    }
    
    return self;
}

-(void)doSomeThing
{
    
    //刷新数据
    
    [self addObserver:self forKeyPath:@"result" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld|NSKeyValueObservingOptionInitial context:nil];
    
    
      _result = @"1234";
    
    //todo
    
}

-(void)dataUpdated
{

    
    //如果result值变了更新ViewcController中的label的值
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    
    NSLog(@"%@ change",change[NSKeyValueChangeNewKey]);
    
    if([keyPath isEqualToString:@"result"])
    {
        if(!change[NSKeyValueChangeNewKey])
        {
            return;
        }
        if (self.successBlock) {
              self.successBlock(change[NSKeyValueChangeNewKey]);
        }
      
    }
}

@end
