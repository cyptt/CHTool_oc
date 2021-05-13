//
//  CHExtensionViewController.m
//  CHOCTool
//
//  Created by cyptt on 2021/5/10.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "CHExtensionViewController.h"
//#import "ExPerson.h"
#import "ExPerson+Experson2.h"
@interface CHExtensionViewController ()

@end

@implementation CHExtensionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)personBtnclick:(id)sender {
    ExPerson * p1 = [[ExPerson alloc]init];
    p1.name1 = @"1234";
    NSLog(@"%@",p1.name1);
    [p1 test1];
    
}

- (IBAction)person2:(id)sender {
    ExPerson * p2 = [[ExPerson alloc]init];
    
    //报错类扩展定义的方法必须在类的实现中进行实现( 因为单独定义类的扩展的话 是只生产一个.h文件的，而类别是会生成.h .m两个文件的，因此 类别可以在自己的文件里面实现自己的实现方法，而扩展只能在需要扩展的类里面去进行扩展)。如果单独定义类扩展的文件并且只定义属性的话，也需要将类实现文件中包含进类扩展文件，否则会找不到属性的set和get方法
    
    
    //如果ExPerson 中引入了ExPerson+Experson2.h 这可以使用该属性
    
  
    [p2 setName2:@"dddd"];
    [p2 test2];

    NSLog(@"%@",p2.name2);
    
}


- (IBAction)person3:(id)sender {
    ExPerson * p2 = [[ExPerson alloc]init];
    [p2 test2];
    
}

@end
