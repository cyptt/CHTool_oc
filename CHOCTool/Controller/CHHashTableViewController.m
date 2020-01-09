//
//  CHHashTableViewController.m
//  CHOCTool
//
//  Created by cyptt on 2020/1/9.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "CHHashTableViewController.h"
#import "CHHash.h"

@interface CHHashTableViewController ()
@property(nonatomic,strong)NSArray * dataSourceArr;
@end

@implementation CHHashTableViewController

-(NSArray *)dataSourceArr{
    if (!_dataSourceArr) {
        _dataSourceArr = @[@"CommonSHA1",@"piecewiseSHA1",@"CommonMD5",@"shardMD5",@"CommonHMAC256",@"shardHMAC256"];
    }
    return _dataSourceArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
   
}

-(void)CommonSHA1{
     NSString * path = [[NSBundle mainBundle]pathForResource:@"小知识点" ofType:@"docx"];
    
   NSLog(@"%@",[CHHash sha1OffilePath:path]);
     
    
}

-(void)piecewiseSHA1{
        NSString * path = [[NSBundle mainBundle]pathForResource:@"小知识点" ofType:@"docx"];
    
    NSLog(@"%@",[CHHash shardFileSha1WithPath:path]);
    
}

-(void)CommonMD5{
    NSString * path = [[NSBundle mainBundle]pathForResource:@"小知识点" ofType:@"docx"];
    NSLog(@"%@",[CHHash md5OffilePath:path]);
}
-(void)shardMD5{
        NSString * path = [[NSBundle mainBundle]pathForResource:@"小知识点" ofType:@"docx"];
    NSLog(@"%@",[CHHash shardMD5WithPath:path]);
}
-(void)CommonHMAC256{
       NSString * path = [[NSBundle mainBundle]pathForResource:@"小知识点" ofType:@"docx"];
    NSLog(@"%@",[CHHash hmacSHA256WithSecret:@"12345" filePath:path]);
}
-(void)shardHMAC256{
       NSString * path = [[NSBundle mainBundle]pathForResource:@"小知识点" ofType:@"docx"];
    NSLog(@"%@",[CHHash shardFileHMACWithPath:path withKey:@"12345"]);
}
#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataSourceArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CHHashTableViewControllerCELL"];
     if (cell==nil) {
         cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"CHHashTableViewControllerCELL"];
     }
     cell.textLabel.text = self.dataSourceArr[indexPath.row];
     return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * name = self.dataSourceArr[indexPath.row];
    if ([name isEqualToString:@"CommonSHA1"]) {
        [self CommonSHA1];
    }
    if ([name isEqualToString:@"piecewiseSHA1"]) {
        [self piecewiseSHA1];
    }
    if ([name isEqualToString:@"CommonMD5"]) {
        [self CommonMD5];
        
    }
    if ([name isEqualToString:@"shardMD5"]) {
        [self shardMD5];
    }
    if ([name isEqualToString:@"CommonHMAC256"]) {
        [self CommonHMAC256];
    }
    if ([name isEqualToString:@"shardHMAC256"]) {
        [self shardHMAC256];
    }
   
}


@end
