//
//  Present.m
//  CHOCTool
//
//  Created by cyptt on 2020/10/1.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "Present.h"

@implementation Present

- (instancetype)initWithDataSourceArr:(NSArray *)dataSourceArr
{
    self = [super init];
    if (self) {
        self.dataSourceArr = dataSourceArr;
        
    }
    return self;
}

-(void)addBtnWithNum:(int)num indexPath:(NSIndexPath *)indexPath{
    
    MVPModel * model = self.dataSourceArr[indexPath.row];
    model.count = num;
    
}
@end
