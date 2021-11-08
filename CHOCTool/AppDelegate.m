//
//  AppDelegate.m
//  CHOCTool
//
//  Created by cyptt on 2020/1/8.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "AppDelegate.h"
#import "TestViewController.h"
#import "ViewController.h"
#import "TwoWindowViewController.h"
@interface AppDelegate ()

@property(nonatomic,strong)UIWindow * window2;
@end

@implementation AppDelegate
@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];

    self.window .backgroundColor = UIColor.redColor;
    
    UIViewController * VC = [[ViewController alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:VC];
    
    self.window .rootViewController = nav;
    [self.window  makeKeyAndVisible];
   

    //window 2
//    self.window2 = [[UIWindow alloc]initWithFrame:CGRectMake(200, 300, 100, 100)];
//
//    self.window2.rootViewController = TwoWindowViewController.new;
//    [self.window2 makeKeyAndVisible];
    
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
}
#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
