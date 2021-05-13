//
//  CacheViewController.m
//  CHOCTool
//
//  Created by cyptt on 2021/5/13.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "ArchiveAndDicVController.h"
#import "CHFileManage.h"
#import "ArchiveModel.h"
#import "RuntimeDicModel.h"
@interface ArchiveAndDicVController ()

@end

@implementation ArchiveAndDicVController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/**
 归档
 */
- (IBAction)saveEncode:(id)sender {
    
    NSString * doucment =[CHFileManage getDocumentPath];
    
    NSString * filePath = [doucment stringByAppendingPathComponent:@"archivedemo"];
    
    NSLog(@"%@",filePath);
    
    ArchiveModel * model = [[ArchiveModel alloc]init];
    model.name =  @"zhangsan";
    model.age = 1;
    
    [NSKeyedArchiver archiveRootObject:model toFile:filePath];
    
    
}

/**
 解档
 */
- (IBAction)decode:(id)sender {
    
    NSString * doucment =[CHFileManage getDocumentPath];
    
    NSString * filePath = [doucment stringByAppendingPathComponent:@"archivedemo"];
    
   ArchiveModel * model = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath ];
    NSLog(@"%@",model.name);
    NSLog(@"%d",model.age);
}
- (IBAction)dicToModel:(id)sender {
    
    NSDictionary *dicTest = @{@"Name":@"飞翔",
                              @"Type":@1,
                              @"Des":@"我要飞翔追逐梦想！",
                              @"Motto":@"脚踏实地一步一个脚印！"
                       
                              };
    
    RuntimeDicModel * model  = [[RuntimeDicModel alloc]initWithDicToModel:dicTest];
    //runtime
//    RuntimeDicModel * model = [RuntimeDicModel runtime_initWithDictionaryForModel:dicTest];
    NSLog(@"%@",model.Name);
    NSLog(@"%d",model.Type);
    
}

@end
