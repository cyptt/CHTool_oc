//
//  AVPlayerLayerViewController.m
//  CHOCTool
//
//  Created by cyptt on 2021/5/20.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "AVPlayerLayerViewController.h"
#import <AVKit/AVKit.h>
@interface AVPlayerLayerViewController ()<AVPictureInPictureControllerDelegate>
@property(nonatomic,strong)AVPlayerLayer * avPlayerLayer;
@property(nonatomic,strong)AVPictureInPictureController * pip;
@property(nonatomic,strong)AVPlayer * player;
@end

@implementation AVPlayerLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *webVideoPath = @"http://qte73hqda.hn-bkt.clouddn.com/30scypmoview.mp4";
    NSURL *webVideoUrl = [NSURL URLWithString:webVideoPath];
    
    AVPlayerItem * playerItem = [AVPlayerItem playerItemWithURL:webVideoUrl];

    AVPlayer * player = [AVPlayer playerWithPlayerItem:playerItem];
    self.player = player;
    self.avPlayerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    self.avPlayerLayer.frame =CGRectMake(0, 100, self.view.frame.size.width, 200);
    self.avPlayerLayer.videoGravity  = AVLayerVideoGravityResizeAspect;
    self.avPlayerLayer.backgroundColor = [UIColor blackColor].CGColor;
    [self.view.layer addSublayer:self.avPlayerLayer];
   
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 40, 40);
    btn.backgroundColor = [UIColor redColor];
    
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    
    //画中画
    //1.判断是否支持画中画功能
    if ([AVPictureInPictureController isPictureInPictureSupported]) {
        //2.开启权限
        @try {
            NSError *error = nil;
            [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:&error];
            [[AVAudioSession sharedInstance] setActive:YES error:&error];
        } @catch (NSException *exception) {
            NSLog(@"AVAudioSession错误");
        }
        self.pip = [[AVPictureInPictureController alloc] initWithPlayerLayer:self.avPlayerLayer];
        self.pip.delegate = self;
        
      
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.player play];
}

-(void)btnClick{
   
    
    if (self.pip.isPictureInPictureActive) {
        [self.pip stopPictureInPicture];
    } else {
        [self.pip startPictureInPicture];
    }
}
// 即将开启画中画
- (void)pictureInPictureControllerWillStartPictureInPicture:(AVPictureInPictureController *)pictureInPictureController {

}
// 已经开启画中画
- (void)pictureInPictureControllerDidStartPictureInPicture:(AVPictureInPictureController *)pictureInPictureController {

}
// 开启画中画失败
- (void)pictureInPictureController:(AVPictureInPictureController *)pictureInPictureController failedToStartPictureInPictureWithError:(NSError *)error {

}
// 即将关闭画中画
- (void)pictureInPictureControllerWillStopPictureInPicture:(AVPictureInPictureController *)pictureInPictureController {

}
// 已经关闭画中画
- (void)pictureInPictureControllerDidStopPictureInPicture:(AVPictureInPictureController *)pictureInPictureController {

}
// 关闭画中画且恢复播放界面
- (void)pictureInPictureController:(AVPictureInPictureController *)pictureInPictureController restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(void (^)(BOOL restored))completionHandler {

}
@end
