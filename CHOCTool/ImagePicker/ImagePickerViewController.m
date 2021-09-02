//
//  ImagePickerViewController.m
//  CHOCTool
//
//  Created by cyptt on 2021/5/25.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "ImagePickerViewController.h"

@interface ImagePickerViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@property(nonatomic,strong)UIImagePickerController * picker;
@end

@implementation ImagePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.picker = [[UIImagePickerController alloc]init];
    self.picker.delegate = self;
  
    
}
- (IBAction)btnClick:(id)sender {
    
    [self presentViewController:self.picker animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //通过UIImagePickerControllerMediaType判断返回的是照片还是视频
  
    NSLog(@"%@",info);
    
    UIImage * image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.imageV.image = image;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
