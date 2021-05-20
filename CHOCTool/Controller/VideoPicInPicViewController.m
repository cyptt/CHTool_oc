//
//  VideoPicInPicViewController.m
//  CHOCTool
//
//  Created by cyptt on 2021/5/20.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "VideoPicInPicViewController.h"
#import <AVKit/AVKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "AVPlayerLayerViewController.h"
@interface VideoPicInPicViewController ()
@property(nonatomic,strong)AVPlayerViewController *playerController;
@property(nonatomic,strong)AVPictureInPictureController * pip;

@end

@implementation VideoPicInPicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   

    


    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
 
}
- (IBAction)avplayer:(id)sender {
    
    //网络视频路径
    NSString *webVideoPath = @"http://qte73hqda.hn-bkt.clouddn.com/30scypmoview.mp4";
    NSURL *webVideoUrl = [NSURL URLWithString:webVideoPath];
    self.playerController =[[AVPlayerViewController alloc]init];
    self.playerController.view.frame = self.view.bounds;
    
    [self.view addSubview:self.playerController.view];
    self.playerController.player = [[AVPlayer alloc]initWithURL:webVideoUrl];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 40, 40);
    btn.backgroundColor = [UIColor redColor];
    
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
   
}
- (IBAction)avplayerLayer:(id)sender {
    
    AVPlayerLayerViewController * VC =  [[AVPlayerLayerViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
}


-(void)btnClick{
    [self.playerController.player play];
}


@end
