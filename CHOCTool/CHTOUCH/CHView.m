//
//  CHView.m
//  CHOCTool
//
//  Created by cyptt on 2021/10/26.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "CHView.h"

@implementation CHView


-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    
    NSLog(@"x%f---y=%f",point.x,point.y);
    NSLog(@"poin%@",NSStringFromCGPoint(point));
    return  YES;
}

@end
