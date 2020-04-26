//
//  FileManageViewController.m
//  CHOCTool
//
//  Created by cyptt on 2020/1/9.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "FileManageViewController.h"
#import "CHFileManage.h"
@interface FileManageViewController ()
@property(nonatomic,strong)NSArray * dataSourceArr;;
@end

@implementation FileManageViewController
-(NSArray *)dataSourceArr{
    if (!_dataSourceArr) {
        _dataSourceArr = @[@"getDocumentPath",@"createDocumentDirWithName",@"createDir",@"credeFile",@"writeToFile"];
    }
    return _dataSourceArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
  
}

-(void)getDocumentPath{
    NSLog(@"%@", [CHFileManage getDocumentPath]);
   
}
-(void)writeToFile{
        NSString * path = [[NSBundle mainBundle]pathForResource:@"小知识点" ofType:@"docx"];
       NSData * data=  [CHFileManage readFileData:path];
       NSString * filePath = [[[CHFileManage getDocumentPath]stringByAppendingPathComponent:@"CHTest"]stringByAppendingPathComponent:@"小知识点.docx"];
       [CHFileManage writeToFile:filePath contents:data];
    
}

-(void)createDir{
    NSString * filepath = [[CHFileManage getDocumentPath] stringByAppendingPathComponent:@"choo1"];
    NSLog(@"%@",filepath);
    [CHFileManage createDir:filepath];
}
-(void)createFile{
    
}
-(void)createDocumentDirWithName{
    [CHFileManage createDocumentDirWithName:@"chooo2/001"];
}
#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataSourceArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"FileManageViewControllerCELL"];
     if (cell==nil) {
         cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"FileManageViewControllerCELL"];
     }
     cell.textLabel.text = self.dataSourceArr[indexPath.row];
     return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * name = self.dataSourceArr[indexPath.row];
    if ([name isEqualToString:@"getDocumentPath"]) {
      
        [self getDocumentPath];
    
    }else if ([name isEqualToString:@"writeToFile"]) {
        [self writeToFile];
    }else if ([name isEqualToString:@"createDir"]){
        [self createDir];
    }else if ([name isEqualToString:@"credeFile"]){
        [self createFile];
    }else if ([name isEqualToString:@"createDocumentDirWithName"]){
        [self createDocumentDirWithName];
    }
}

@end
