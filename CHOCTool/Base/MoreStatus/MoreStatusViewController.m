//
//  MoreStatusViewController.m
//  CHOCTool
//
//  Created by cyptt on 2021/8/31.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "MoreStatusViewController.h"
#import "D_Person.h"
#import "D_Teacher.h"
#import "D_Student.h"
@interface MoreStatusViewController ()

@end

@implementation MoreStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    D_Person * person = [[D_Person alloc]init];
    NSLog(@"%p",&person);
    [self print:person];
    
    
    
    
    D_Teacher * teacher = [[D_Teacher alloc]init];

    NSLog(@"%p",&teacher);
    [self print:teacher];
    
    
    D_Student * student = [[D_Student alloc]init];

    NSLog(@"%p",&student);
    [self print:student];
    
  
    D_Person * person2 = [[D_Student alloc]init];
    
    [person2 eat];
}

-(void)print:(D_Person *)person{
    [person eat];
}

@end
