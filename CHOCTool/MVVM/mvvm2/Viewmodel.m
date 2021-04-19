//
//  Viewmodel.m
//  CHOCTool
//
//  Created by cyptt on 2021/4/19.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "Viewmodel.h"
#import "Model.h"
@implementation Viewmodel


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataSourceArr = [NSMutableArray array];
        
        [self addObserver:self forKeyPath:@"contentKey" options:NSKeyValueObservingOptionNew  context:@"ddd"];
        
    }
    return self;
}

-(void)dealloc{
    
    [self removeObserver:self forKeyPath:@"contentKey"];
    
}
-(void)freshDataSource{
  
    for (int i =0 ; i<10; i++) {
        Model * model = Model.new;
        model.count = i;
        model.name = [NSString stringWithFormat:@"name%d",i];
        [self.dataSourceArr addObject:model];
    }

}

- (void)initWithBlock:(SuccessBlock)successBlock fail:(FailBlock)failBlock{
    _successBlock = successBlock;
    _failBlock    = failBlock;
}

#pragma mark --kvo
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    NSLog(@"NSKeyValueChangeNewKey---%@",change[NSKeyValueChangeNewKey]);
    
    NSLog(@"NSKeyValueChangeIndexesKey---%@",change[NSKeyValueChangeIndexesKey]);
    NSLog(@"object---%@",object);
    NSLog(@"context---%@",context);
    
    NSArray *resultArray = [change[NSKeyValueChangeNewKey] componentsSeparatedByString:@","];
    NSString * result1 = resultArray[0];
    
    NSString * result2 = resultArray[1];
    for (int i =0 ; i<self.dataSourceArr.count; i++) {
        Model * model = self.dataSourceArr[i];

        if ([result2 isEqualToString:model.name]) {
            model.count = result1.intValue;
        }
      
    }
    
    if (self.successBlock) {
        self.successBlock(self.dataSourceArr);
    }
}
@end
