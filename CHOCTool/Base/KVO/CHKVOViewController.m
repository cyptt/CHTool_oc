//
//  CHKVOViewController.m
//  CHOCTool
//
//  Created by cyptt on 2021/9/3.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "CHKVOViewController.h"
#import "KVOModel.h"
@interface CHKVOViewController ()
@property(nonatomic,strong)KVOModel * kvoModel;
@end

@implementation CHKVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _kvoModel = [[KVOModel alloc]init];
    NSLog(@"----%@",NSStringFromSelector(@selector(name)));
    [_kvoModel addObserver:self forKeyPath:NSStringFromSelector(@selector(name)) options:NSKeyValueObservingOptionNew context:nil];
  
    
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    NSLog(@"%@",keyPath);
    NSLog(@"%@",object);
    NSLog(@"%@",change);
    NSLog(@"%@",context);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.kvoModel.name = @"1";
    
    
    //手动触发
//    static int magicNum;
// [_kvoModel willChangeValueForKey:NSStringFromSelector(@selector(name))];
//    _kvoModel.name = [NSString stringWithFormat:@"name=%d", 1];
//    [_kvoModel didChangeValueForKey:NSStringFromSelector(@selector(name))];
}
- (void)dealloc
{
    
    [self removeObserver:self forKeyPath:self.kvoModel.name];
}

@end
