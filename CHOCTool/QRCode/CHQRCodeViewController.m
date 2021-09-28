//
//  CHQRCodeViewController.m
//  bridging_js
//
//  Created by cyptt on 2021/9/2.
//

#import "CHQRCodeViewController.h"
#import "CHQRCodeView.h"
#import "GenerateQRCode.h"

@interface CHQRCodeViewController ()

@end

@implementation CHQRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    CHQRCodeView * qrCodeView = [[CHQRCodeView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-400)];
    [self.view addSubview:qrCodeView];
    
    [qrCodeView startScaning:^(NSString * result) {
        NSLog(@"-----%@",result);
        [qrCodeView stopScanning];
    }];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UIImage * image =   [GenerateQRCode createQRCodeWithTargetString:@"dddd" logoImage:nil];
    
    UIImageView * imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 100, 100, 100)];
    imageV.image = image;
    
    [self.view addSubview:imageV];
    NSLog(@"%@",image);
}

@end
