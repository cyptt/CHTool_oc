//
//  BaseViewController.m
//  CHOCTool
//
//  Created by cyptt on 2021/8/31.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "BaseViewController.h"
#import "MoreStatusViewController.h"
#import "D_Person.h"
#import "WeakPerson.h"

typedef void(^CHBlock)(void);
@interface BaseViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray * dataSourceArr;

@property(nonatomic,copy)NSMutableArray * mArr;

@property(nonatomic,strong)WeakPerson * selfStrongPerson;
@property(nonatomic,strong)WeakPerson * selfWeakPerson;


@property(nonatomic,copy)CHBlock chblock;
@end

NSString * MORESTATUS = @"多态"; //多态
NSString * yuanlei = @"元类";
NSString * COPY = @"copy和mucopy";
NSString * WEAK_TEST = @"WEAK_TEST";
NSString * BLOCK_XUNHUAN = @"BLOCK_XUNHUAN"; //block循环引用
@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
   
}
-(NSArray *)dataSourceArr{
    if (!_dataSourceArr) {
        _dataSourceArr = @[MORESTATUS,yuanlei,COPY,WEAK_TEST,BLOCK_XUNHUAN];
    }
    return _dataSourceArr;
}
#pragma mark --UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  self.dataSourceArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"CELL"];
    }
    cell.textLabel.text = self.dataSourceArr[indexPath.row];
    
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString * name = self.dataSourceArr[indexPath.row];
    if ([name isEqualToString:MORESTATUS]) {
        MoreStatusViewController * VC = [[MoreStatusViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }else if([name isEqualToString:yuanlei]){
        [self yuanleiFuc];
    }else if([name isEqualToString:COPY]){
        [self copyAndMcopy];
    }else if([name isEqualToString:WEAK_TEST]){
        [self weakTest];
    }else if([name isEqualToString:BLOCK_XUNHUAN]){
        [self blockXunhuan];
    }
}

-(void)yuanleiFuc{
    Class pClass= [D_Person  class];
    NSLog(@"%p",pClass);
    
    
    Class pClass2= [D_Person class];
    NSLog(@"%p",pClass2);
}

-(void)copyAndMcopy{
    
    NSString * str1 = @"001";
    NSString * copyStr1 = [str1 copy];
    copyStr1 = @"002";
    NSString * mutableStr1 = [str1 mutableCopy];
    NSLog(@"%p---%@",str1,str1);
    NSLog(@"%p---%@",copyStr1,copyStr1);
    NSLog(@"%p---%@",mutableStr1,mutableStr1);
    
    
    NSMutableArray * mutArr = [NSMutableArray arrayWithCapacity:1];
    NSMutableArray * copMutArr = [mutArr copy];
    
    [mutArr addObject:@"1"];
    
    NSLog(@"%p---%@",mutArr,mutArr);
    NSLog(@"%p---%@",copMutArr,copMutArr);
    

    self.mArr = [mutArr mutableCopy]; ;
    
#warning  self.mArr copy修饰会变成不可变数组
//    [self.mArr addObject:@"2"];
  

    NSLog(@"%p---%@",self.mArr, self.mArr);
    
    D_Person * person = [[D_Person alloc]init];
    D_Person * person2 = [person copy];
    NSLog(@"%p---%@",person, person.name);
    NSLog(@"%p---%@",person2, person2.name);
    

}

-(void)weakTest{
    
    //weak 脱离作用域就会销毁，对象内存释放，指向这块内存所以weak指针都会销毁
    
    __strong WeakPerson * strongPerson;
    __weak WeakPerson * weakPerson;
    
    {
        WeakPerson * person = [[WeakPerson alloc]init];
        person.name = @"1234";
//        strongPerson = person;
        weakPerson = person;
        NSLog(@"---%@",weakPerson.name);
    }
//    NSLog(@"strongPerson----%@ ---%p---%@",strongPerson,&strongPerson,strongPerson.name);

//    NSLog(@"weakPerson----%@",weakPerson);
  
}

-(void)blockXunhuan{
    

  
    //循环引用
    self.chblock =  ^{
    
        NSLog(@"%@",self.dataSourceArr);
    };
    self.chblock();
}

- (void)dealloc
{
    NSLog(@"----");
}
@end
