//
//  CHStatusViewController.m
//  CHOCTool
//
//  Created by cyptt on 2020/4/3.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "CHStatusViewController.h"

@interface CHStatusViewController ()

@end

@implementation CHStatusViewController

-(instancetype)initWithName:(NSString *)name nibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        NSLog(@"%@",name);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    


//    self.navigationController.navigationBar.backgroundColor = [UIColor blueColor];
//
//
//
//    self.navigationController.navigationBar.barTintColor = [UIColor redColor] ;;

//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav"] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setTintColor:[UIColor redColor]];
//    self.navigationItem.title = @"dffddd";

    
//    UIBarButtonItem * bar1 = [[UIBarButtonItem alloc]init];
//    [bar1 setImage:[UIImage imageNamed:@"back_grey_scca"]];
//
//    self.navigationItem.backBarButtonItem = bar1;

    
//    self.navigationController.navigationBar.backIndicatorImage = [UIImage imageNamed:@""];
//    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@""];
                
    
    
   
                
                  
    
//    self.navigationController.navigationBar.topItem.title = @"";

    self.navigationItem.titleView.backgroundColor = [UIColor whiteColor];

    [self.navigationController.navigationBar setBackIndicatorImage:[UIImage new]];
        [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage new]];
         self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_grey_scca"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didClick)];

         
        
}
-(void)didClick{
    NSLog(@"%@",@"ddfd");
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

     

  
}

-(void)ddd{
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_grey_scca"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:nil action:nil];
            
            self.navigationController.navigationBar.backIndicatorImage = [UIImage new];
            self.navigationController.navigationBar.backIndicatorTransitionMaskImage = [UIImage new];
            
            UIFont *font = [UIFont systemFontOfSize:17.f];

            self.navigationController.navigationBar.translucent = NO;
            NSDictionary *textAttributes = @{

                                             NSFontAttributeName : font,

                                             NSForegroundColorAttributeName : [UIColor blackColor]

                                             };
            [self.navigationController.navigationBar setTitleTextAttributes:textAttributes];
           
            [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
}


@end
