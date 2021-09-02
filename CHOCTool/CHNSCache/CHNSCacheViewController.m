//
//  CHNSCacheViewController.m
//  CHOCTool
//
//  Created by cyptt on 2021/6/22.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "CHNSCacheViewController.h"
#import "ExPerson.h"
@interface CHNSCacheViewController ()<NSCacheDelegate>

@property(nonatomic,strong)    NSCache * cache ;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property(nonatomic,strong)NSString * caStr;

@end

@implementation CHNSCacheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self setStr];
    self.cache = [NSCache new];
    
    
    self.cache.delegate = self;
    
  
    
    
}
- (void)dealloc
{
    
    NSLog(@"内存泄露");
}
- (IBAction)startCacheBtn:(id)sender {


  
//    NSMutableArray * dataArr = [NSMutableArray array];
    for (int i = 0; i<10; i++) {
        NSLog(@"%d",i);
        
//        NSString * str = [NSString stringWithFormat:@"----%d",1];
      
//        NSString * str = [[NSString alloc]init];
//        ;
//        str = @"1";
//
//        NSLog(@"----%p",str)
        
        ExPerson * person = [[ExPerson alloc]init];
        person.name1 = [NSString stringWithFormat:@"%d",i];

//        NSLog(@"----%p",person);
//        NSLog(@"指针地址-----%p",&person);
        
        
        
        NSLog(@"内存地址-----%p",person.name1);
        
        NSLog(@"指针地址-----%p",&person);
//        NSString * filePath = [[NSBundle mainBundle] pathForResource:@"img001" ofType:@"png"];
//        NSData * data = [[NSData alloc]initWithContentsOfFile:filePath];
//
//        NSLog(@"%p",data);
//        NSLog(@"---data---%@",data);
    
//        [dataArr addObject:data];
//        [self.cache setObject:data forKey:[NSString stringWithFormat:@"key%d",i]];
    }
 

    
    
}

- (IBAction)removeCacheBtn:(id)sender {
    
    [self.cache removeAllObjects];
}

- (IBAction)getCacheBtn:(id)sender {
    
    
    for (int i = 0; i<1000000; i++) {
        NSLog(@"%d",i);
        NSString * filePath = [[NSBundle mainBundle] pathForResource:@"img001" ofType:@"png"];
        NSData * data = [[NSData alloc]initWithContentsOfFile:filePath];
                NSLog(@"---data---%@",data);
        NSLog(@"%@",[self.cache objectForKey:[NSString stringWithFormat:@"key%d",i]]);


    }
  

}


-(void)cache:(NSCache *)cache willEvictObject:(id)obj{
    NSLog(@"%----@",obj);
}


-(void)removeCache:(NSSet *)objects{
    NSLog(@"removeCache---%@",objects);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"img001" ofType:@"png"];
    NSLog(@"filepath%@",filePath);
    self.imageV.image = [UIImage imageWithContentsOfFile:filePath];
}

-(void)setStr{
    self.caStr = @"概念股是指具有某种特别内涵的股票,而这一内涵通常会被当作一种选股和炒作题材，成为股市的热点。其有具体的名称，事物,题材等，例如金融股，地产股，资产重组股，券商股，奥运题材股，保险股，期货概念等都称之为概念股。简单来说概念股就是对股票所在的行业经营业绩增长的提前炒作。概念股是指具有某种特别内涵的股票,而这一内涵通常会被当作一种选股和炒作题材，成为股市的热点。其有具体的名称，事物,题材等，例如金融股，地产股，资产重组股，券商股，奥运题材股，保险股，期货概念等都称之为概念股。简单来说概念股就是对股票所在的行业经营业绩增长的提前炒作概念股是指具有某种特别内涵的股票,而这一内涵通常会被当作一种选股和炒作题材，成为股市的热点。其有具体的名称，事物,题材等，例如金融股，地产股，资产重组股，券商股，奥运题材股，保险股，期货概念等都称之为概念股。简单来说概念股就是对股票所在的行业经营业绩增长的提前炒作概念股是指具有某种特别内涵的股票,而这一内涵通常会被当作一种选股和炒作题材，成为股市的热点。其有具体的名称，事物,题材等，例如金融股，地产股，资产重组股，券商股，奥运题材股，保险股，期货概念等都称之为概念股。简单来说概念股就是对股票所在的行业经营业绩增长的提前炒作概念股是指具有某种特别内涵的股票,而这一内涵通常会被当作一种选股和炒作题材，成为股市的热点。其有具体的名称，事物,题材等，例如金融股，地产股，资产重组股，券商股，奥运题材股，保险股，期货概念等都称之为概念股。简单来说概念股就是对股票所在的行业经营业绩增长的提前炒作概念股是指具有某种特别内涵的股票,而这一内涵通常会被当作一种选股和炒作题材，成为股市的热点。其有具体的名称，事物,题材等，例如金融股，地产股，资产重组股，券商股，奥运题材股，保险股，期货概念等都称之为概念股。简单来说概念股就是对股票所在的行业经营业绩增长的提前炒作概念股是指具有某种特别内涵的股票,而这一内涵通常会被当作一种选股和炒作题材，成为股市的热点。其有具体的名称，事物,题材等，例如金融股，地产股，资产重组股，券商股，奥运题材股，保险股，期货概念等都称之为概念股。简单来说概念股就是对股票所在的行业经营业绩增长的提前炒作概念股是指具有某种特别内涵的股票,而这一内涵通常会被当作一种选股和炒作题材，成为股市的热点。其有具体的名称，事物,题材等，例如金融股，地产股，资产重组股，券商股，奥运题材股，保险股，期货概念等都称之为概念股。简单来说概念股就是对股票所在的行业经营业绩增长的提前炒作概念股是指具有某种特别内涵的股票,而这一内涵通常会被当作一种选股和炒作题材，成为股市的热点。其有具体的名称，事物,题材等，例如金融股，地产股，资产重组股，券商股，奥运题材股，保险股，期货概念等都称之为概念股。简单来说概念股就是对股票所在的行业经营业绩增长的提前炒作概念股是指具有某种特别内涵的股票,而这一内涵通常会被当作一种选股和炒作题材，成为股市的热点。其有具体的名称，事物,题材等，例如金融股，地产股，资产重组股，券商股，奥运题材股，保险股，期货概念等都称之为概念股。简单来说概念股就是对股票所在的行业经营业绩增长的提前炒作概念股是指具有某种特别内涵的股票,而这一内涵通常会被当作一种选股和炒作题材，成为股市的热点。其有具体的名称，事物,题材等，例如金融股，地产股，资产重组股，券商股，奥运题材股，保险股，期货概念等都称之为概念股。简单来说概念股就是对股票所在的行业经营业绩增长的提前炒作概念股是指具有某种特别内涵的股票,而这一内涵通常会被当作一种选股和炒作题材，成为股市的热点。其有具体的名称，事物,题材等，例如金融股，地产股，资产重组股，券商股，奥运题材股，保险股，期货概念等都称之为概念股。简单来说概念股就是对股票所在的行业经营业绩增长的提前炒作概念股是指具有某种特别内涵的股票,而这一内涵通常会被当作一种选股和炒作题材，成为股市的热点。其有具体的名称，事物,题材等，例如金融股，地产股，资产重组股，券商股，奥运题材股，保险股，期货概念等都称之为概念股。简单来说概念股就是对股票所在的行业经营业绩增长的提前炒作概念股是指具有某种特别内涵的股票,而这一内涵通常会被当作一种选股和炒作题材，成为股市的热点。其有具体的名称，事物,题材等，例如金融股，地产股，资产重组股，券商股，奥运题材股，保险股，期货概念等都称之为概念股。简单来说概念股就是对股票所在的行业经营业绩增长的提前炒作";
}
@end
