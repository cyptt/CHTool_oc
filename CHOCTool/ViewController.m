//
//  ViewController.m
//  CHOCTool
//
//  Created by cyptt on 2020/1/8.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "ViewController.h"
#import "FileManageViewController.h"
#import "CHHashTableViewController.h"
#import "JYTLoadingView.h"
#import "CHProgressHUD.h"
#import "TestAlertViewController.h"
#import "CHButtonController.h"
#import "CHGCDViewController.h"
#import "CHLabelViewController.h"
#import "CHDelegateViewController.h"
#import "CHSingleChioseViewController.h"
#import "CHScrolleTestViewController.h"
#import "CHDeviceInfo.h"
#import "RuntimeViewController.h"
#import "MVPViewController.h"
#import "MVVMViewController.h"
#import "NULL_NILViewController.h"
#import "CHScrollewVController.h"
#import "CHOrgScrollewVController.h"
#import "CHObject.h"
#import "CHObject+Obj2.h"
#import "CHObject+Obj1.h"
#import "CHExtensionViewController.h"
#import "CategoryViewController.h"
#import "ArchiveAndDicVController.h"
#import "CHUIStudtyViewController.h"
#import "VideoPicInPicViewController.h"
#import "CHRunloopViewController.h"
#import "ImagePickerViewController.h"
#import "TestViewController.h"
#import "CHNSCacheViewController.h"
#import "TestVideoViewController.h"
#import "BaseViewController.h"
#import <objc/objc.h>
#import "CHQRCodeViewController.h"
#import "WeakPerson.h"
#import "NETViewController.h"
#import "CHAnimationController.h"
#import "CHTouchViewController.h"
#import "UIKitViewController.h"
 NSString * testname2 = @"adsfdfsf";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
}


@property (strong, nonatomic) UITableView *tableview;
@property(nonatomic,strong)NSArray * dataSourceArr;;
@property(nonatomic,strong)UIWindow * selfWindow;
@end

NSString * LOGCHNESE = @"打印中文";
NSString * DeviceInfo = @"设备info";
NSString * RUNTIME = @"RUNTIME";
NSString * MVP = @"MVP";
NSString * MVVM = @"MVVM";
NSString * NULL_NIL = @"NULL_NIL";
NSString * CHUIScrollView = @"CHUIScrollView";
NSString * CHOrgScroll = @"CHOrgScroll";
NSString * EXTENSION = @"EXTENSION";
NSString * CATEGORY = @"CATEGORY";
NSString * ArchiveAndDic = @"ArchiveAndDic";
NSString * UISTUDY = @"UISTUDY";
NSString * VIDEODPICTUREINPIC = @"VIDEODPICTUREINPIC";
NSString * CHRUNLOOP = @"CHRUNLOOP";
NSString * IMAGEPICKER = @"IMAGEPICKER";
NSString * TESTVC = @"TESTVC";
NSString * CHNSCache = @"NSCache";
NSString * VIDEO = @"TestVideoViewController";
NSString * Base = @"Base";
NSString * QRCode = @"QRCode";
NSString * CHNET = @"CHNET";
NSString * CHANIMATION = @"CHANIMATION";
NSString * CHTOUCH = @"CHTOUCH";
NSString * UI_KIT = @"UI_KIT";


@implementation ViewController


-(UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        [self.view addSubview:_tableview];
    }
    return  _tableview;
}
-(NSArray *)dataSourceArr{
    if (!_dataSourceArr) {
        _dataSourceArr = @[@"TESTCLICK",@"TESTCLICK2",UI_KIT,CHTOUCH,CHANIMATION,CHNET,Base,QRCode,VIDEO,TESTVC,CHNSCache,EXTENSION,CATEGORY,RUNTIME,CHRUNLOOP,ArchiveAndDic,UISTUDY,VIDEODPICTUREINPIC,NULL_NIL,CHUIScrollView,CHOrgScroll,MVP,MVVM,@"FileManage",@"CHHash",@"JYTLoding",@"CHProgressHUD",@"CHAlert",@"CHButton",@"GCD",@"LableStyle",@"Delegate",@"CHSingleChiose",@"ScrollTest",LOGCHNESE,DeviceInfo,IMAGEPICKER];
    }
    return _dataSourceArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];

    self.tableview.delegate = self;
    self.tableview.dataSource = self;
  

    
    [self.navigationController.navigationBar setBackIndicatorImage:[UIImage new]];
    [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage new]];
     self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_grey_scca"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didClick)];

     

    
}

-(void)didClick{
    NSLog(@"%@",@"ddfd");
}

-(void)testClick{
   

//     WeakPerson * person ;
//    NSLog(@"---start--%p,%@",person,person.name);
//    person = [[WeakPerson alloc]init];
//    person.name =[NSString stringWithFormat:@"zs%d",arc4random()] ;
//    NSLog(@"----end%p",person);
//

  
//     NSString * name1 ;
//    NSLog(@"---start--%p---%@",name1,name1);
//    name1 =  @"123333";
//    NSLog(@"---end--%p---%@",name1,name1);
    NSString * name2 = @"222333" ;
    NSString * name3 = name2;

    NSString * name4 = [name2 copy];
    
    NSString * name5 = [name2 mutableCopy];
    NSLog(@"%p",name2);
    NSLog(@"%p",&name2);
    NSLog(@"%p",name3);
    NSLog(@"%p",&name3);
    NSLog(@"%p",name4);
    NSLog(@"%p",name5);
 
    
    
  
}
-(void)testClick2{
    NSString * name = @"222333";
    NSLog(@"%p--%s",name,__func__);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
 
 
    
}
#pragma mark -- UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"CELL"];
    }
    cell.textLabel.text = self.dataSourceArr[indexPath.row];
    

    return cell;
}
#pragma mark --UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * name = self.dataSourceArr[indexPath.row];
    if ([name isEqualToString:CHUIScrollView]) {
        CHScrollewVController * VC = [[CHScrollewVController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    if ([name isEqualToString:CHOrgScroll]) {
        CHOrgScrollewVController * VC  = [[CHOrgScrollewVController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    if ([name isEqualToString:@"FileManage"]) {
        FileManageViewController * VC = [[FileManageViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    if ([name isEqualToString:@"CHHash"]) {
        CHHashTableViewController * VC = [[CHHashTableViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    if ([name isEqualToString:@"JYTLoding"]) {
        [[JYTLoadingView sharedInstance]startLoadingWithView:self.view];
        
        [[JYTLoadingView sharedInstance] hudDismissWithSeconds:2];
    }
    if ([name isEqualToString:@"CHProgressHUD"]) {
        CHProgressHUD * hud = [CHProgressHUD showHUDAddedTo:self.view animated:YES];
        
        hud.label.text = @"CHProgressHUD";
        [hud hideAnimated:YES afterDelay:2];
    }
    if ([name isEqualToString:@"CHAlert"]) {
        TestAlertViewController * vc = [[TestAlertViewController alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];
    }
    if ([name isEqualToString:@"CHButton"]) {
        CHButtonController *VC = [[CHButtonController alloc]init];
       
        [self.navigationController pushViewController:VC animated:YES];
    }
    if ([name isEqualToString:@"GCD"]) {
        CHGCDViewController *VC =[[CHGCDViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    
    if ([name isEqualToString:@"LableStyle"]) {
        CHLabelViewController * VC = [[CHLabelViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    
    if ([name isEqualToString:@"Delegate"]) {
        CHDelegateViewController * VC = [[CHDelegateViewController alloc]init];
        
        [self.navigationController pushViewController:VC animated:YES];
    }if ([name isEqualToString:@"CHSingleChiose"]) {
        CHSingleChioseViewController * VC = [[CHSingleChioseViewController alloc]init];
               
               [self.navigationController pushViewController:VC animated:YES];
    }
    if ([name isEqualToString:@"ScrollTest"]) {
        CHScrolleTestViewController * VC = [[CHScrolleTestViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    if ([name isEqualToString:LOGCHNESE]) {
      //NSObject+Logutils
    }
    if ([name isEqualToString:DeviceInfo]) {
        NSLog(@"%@",CHDeviceInfo.deviceId);
        NSLog(@"%@",CHDeviceInfo.osVersion);
        NSLog(@"%@",CHDeviceInfo.osName);
        NSLog(@"%@",CHDeviceInfo.deviceName);
        NSLog(@"%@",CHDeviceInfo.deviceModel);
    }
    if ([name isEqualToString:RUNTIME]) {
        
        RuntimeViewController *VC  =[[RuntimeViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    if ([name isEqualToString:MVP]) {
        MVPViewController *VC  =[[MVPViewController alloc]init];
               [self.navigationController pushViewController:VC animated:YES];
    }
    if ([name isEqualToString:MVVM]) {
        MVVMViewController *VC  =[[MVVMViewController alloc]init];
               [self.navigationController pushViewController:VC animated:YES];
    }
    if ([name isEqualToString:NULL_NIL]) {
        NULL_NILViewController * VC = [[NULL_NILViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    if ([name isEqualToString:EXTENSION]) {
        CHExtensionViewController *VC = [[CHExtensionViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    if ([name isEqualToString:CATEGORY]) {
        CategoryViewController * VC = [[CategoryViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    if ([name isEqualToString:ArchiveAndDic]) {
        ArchiveAndDicVController * VC = [[ArchiveAndDicVController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    
    if ([name isEqualToString:UISTUDY]) {
        CHUIStudtyViewController * VC = [[CHUIStudtyViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    if ([name isEqualToString:VIDEODPICTUREINPIC]) {
        VideoPicInPicViewController * VC  = [[VideoPicInPicViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    if ([name isEqualToString:CHRUNLOOP]) {
        CHRunloopViewController * VC = [[CHRunloopViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    
    if ([name isEqualToString:IMAGEPICKER]) {
        ImagePickerViewController * imagePicker = [[ImagePickerViewController alloc]init];
        [self.navigationController pushViewController:imagePicker animated:YES];
    }
    if ([name isEqualToString:TESTVC]) {
        TestViewController * VC = [[TestViewController alloc]init];
        
        [self.navigationController pushViewController:VC animated:YES];
    }
    if ([name isEqualToString:CHNSCache]) {
        CHNSCacheViewController * VC = [[CHNSCacheViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    if ([name isEqualToString:VIDEO]) {
        TestVideoViewController * VC = [[TestVideoViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    if ([name isEqualToString:Base]) {
        BaseViewController * VC = [[BaseViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    else if([name isEqualToString:QRCode]){
        CHQRCodeViewController * VC = [[CHQRCodeViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }else if([name isEqualToString:@"TESTCLICK"]){
        [self testClick];
    }else if([name isEqualToString:@"TESTCLICK2"]){
        [self testClick2];
    }else if([name isEqualToString:CHNET]){
        NETViewController * VC = [[NETViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }else if([name isEqualToString:CHANIMATION]){
        CHAnimationController * VC = [[CHAnimationController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
        
    }else if([name isEqualToString:CHTOUCH]){
        CHTouchViewController * VC = [[CHTouchViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }else if([name isEqualToString:UI_KIT]){
        UIKitViewController * VC =  [[UIKitViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }
}

@end
