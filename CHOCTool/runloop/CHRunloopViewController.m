//
//  CHRunloopViewController.m
//  CHOCTool
//
//  Created by cyptt on 2021/5/24.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "CHRunloopViewController.h"

@interface CHRunloopViewController ()

@end

@implementation CHRunloopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)threadTimer:(id)sender {
    
    
    dispatch_queue_t queue = dispatch_queue_create("dddd", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
       
        
    });
   
    
   
}


@end
