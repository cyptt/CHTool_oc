//
//  CHDelegateManage.m
//  CHOCTool
//
//  Created by cyptt on 2020/5/29.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "CHDelegateManage.h"
@interface CHDelegateManage ()
@property(nonatomic,strong)UIViewController * currentController;
@end
@implementation CHDelegateManage

+ (instancetype)sharedCacheHelper {
    static CHDelegateManage *manage = nil;
    static dispatch_once_t token;
    dispatch_once(&token,^{
        if(manage == nil){
            manage = [[CHDelegateManage alloc]init];
        }
    } );
    return manage;
}



-(void)startinitWithController:(UIViewController *)Controller{
        CHDelegateNextViewController * VC = [[CHDelegateNextViewController alloc]initWithDelegate:self];
    
        [Controller.navigationController pushViewController:VC animated:YES];
}
- (void)testDelegate:(NSString *)name{
    NSLog(@"-----dddddd%@",name);
}
@end
