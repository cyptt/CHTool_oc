//
//  CHDefaultAlert.m
//  CHOCTool
//
//  Created by cyptt on 2021/9/22.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "CHDefaultAlert.h"

@interface CHDefaultAlert ()

@end

@implementation CHDefaultAlert



+(void)showAlertWithController:(UIViewController *)controller title:(NSString *)title message:(NSString *)msg arr:(NSArray *)arr handler:(void (^ __nullable)(UIAlertAction *action))handler{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (int i =0; i<arr.count; i++) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:arr[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
            if (handler) {
                handler(action);
            }
        }];
        [alert addAction:action];
    }
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (handler) {
            handler(action);
        }
    }];
    
    [alert addAction:cancel];
    
    [controller presentViewController:alert animated:YES completion:nil];
}






@end
