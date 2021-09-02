//
//  CHQRCodeManage.m
//  bridging_js
//
//  Created by cyptt on 2021/9/2.
//

#import "CHQRCodeView.h"
#import <AVFoundation/AVFoundation.h>
@interface CHQRCodeView()<AVCaptureMetadataOutputObjectsDelegate>
{
    CGFloat _ScreenW;
    CGFloat _ScreenH;
    
}
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, weak) UIImageView *line;
@property (nonatomic, strong) AVCaptureDevice *device;
@property (nonatomic, strong) AVCaptureSession *session;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *preview;

@property (nonatomic, assign) NSInteger distance;

@property(nonatomic,strong)void(^resultBlock)(NSString * result);
@end


@implementation CHQRCodeView


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return  self;
}

-(void)setUp{
    _ScreenW =[UIScreen mainScreen].bounds.size.width;
    _ScreenH =[UIScreen mainScreen].bounds.size.height;

    [self addTimer];
    [self creatControl];
}
- (void)setupCamera
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //初始化相机设备
        self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
 
        //初始化输入流
        AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
        
        //初始化输出流
        AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
        //设置代理，主线程刷新
        [output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
        
        //初始化链接对象
        self.session = [[AVCaptureSession alloc] init];
        //高质量采集率
        [self.session setSessionPreset:AVCaptureSessionPresetHigh];
        
        if ([self.session canAddInput:input]) [self.session addInput:input];
        if ([self.session canAddOutput:output]) [self.session addOutput:output];
        
        //条码类型（二维码/条形码）
        output.metadataObjectTypes = [NSArray arrayWithObjects:AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code, AVMetadataObjectTypeQRCode, nil];
        
        //更新界面
        dispatch_async(dispatch_get_main_queue(), ^{
            self.preview = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
            self.preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
            self.preview.frame = CGRectMake(0, 0, self->_ScreenW, self->_ScreenH);
            [self.layer insertSublayer:self.preview atIndex:0];
            [self.session startRunning];
        });
    });
}
- (void)creatControl
{
    CGFloat scanW = _ScreenW * 0.65;
    CGFloat padding = 10.0f;
    CGFloat labelH = 20.0f;
    CGFloat cornerW = 26.0f;
    CGFloat marginX = (_ScreenW - scanW) * 0.5;
    CGFloat marginY = (_ScreenH - scanW - padding - labelH) * 0.5;
    
    //遮盖视图
    for (int i = 0; i < 4; i++) {
        UIView *cover = [[UIView alloc] initWithFrame:CGRectMake(0, (marginY + scanW) * i, _ScreenW, marginY + (padding + labelH) * i)];
        if (i == 2 || i == 3) {
            cover.frame = CGRectMake((marginX + scanW) * (i - 2), marginY, marginX, scanW);
        }
        cover.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
        [self insertSubview:cover atIndex:i];
    }
    
    //扫描视图
    UIView *scanView = [[UIView alloc] initWithFrame:CGRectMake(marginX, marginY, scanW, scanW)];
    [self addSubview:scanView];
    
    //扫描线
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, scanW, 2)];
    [self drawLineForImageView:line];
    [scanView addSubview:line];
    self.line = line;
    
    //边框
    UIView *borderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, scanW, scanW)];
    borderView.layer.borderColor = [[UIColor whiteColor] CGColor];
    borderView.layer.borderWidth = 1.0f;
    [scanView addSubview:borderView];
    
    //扫描视图四个角
    for (int i = 0; i < 4; i++) {
        CGFloat imgViewX = (scanW - cornerW) * (i % 2);
        CGFloat imgViewY = (scanW - cornerW) * (i / 2);
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(imgViewX, imgViewY, cornerW, cornerW)];
        if (i == 0 || i == 1) {
            imgView.transform = CGAffineTransformRotate(imgView.transform, M_PI_2 * i);
        }else {
            imgView.transform = CGAffineTransformRotate(imgView.transform, - M_PI_2 * (i - 1));
        }
        [self drawImageForImageView:imgView];
        [scanView addSubview:imgView];
    }
    
    //提示标签
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(scanView.frame) + padding, _ScreenW, labelH)];
    label.text = @"将二维码放入框中，自动扫描";
    label.font = [UIFont systemFontOfSize:16.0f];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    [self addSubview:label];
    
//    //选项栏
//    UIView *tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, _ScreenH - tabBarH, _ScreenW, tabBarH)];
//    tabBarView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8f];
//    [self addSubview:tabBarView];
//
//    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(0, _ScreenH - 120, _ScreenW, 120)];
//    container.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
//    [self addSubview:container];
//
//
//
//    UIView *speline = [[UIView alloc] initWithFrame:CGRectMake(_ScreenW / 2.0, 35, 1, 50)];
//    speline.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.1];
//    [container addSubview:speline];
//    
  
}

//绘制线图片
- (void)drawLineForImageView:(UIImageView *)imageView
{
    CGSize size = imageView.bounds.size;
    UIGraphicsBeginImageContext(size);

    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //创建一个颜色空间
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //设置开始颜色
    const CGFloat *startColorComponents = CGColorGetComponents([[UIColor greenColor] CGColor]);
    //设置结束颜色
    const CGFloat *endColorComponents = CGColorGetComponents([[UIColor whiteColor] CGColor]);
    //颜色分量的强度值数组
    CGFloat components[8] = {startColorComponents[0], startColorComponents[1], startColorComponents[2], startColorComponents[3], endColorComponents[0], endColorComponents[1], endColorComponents[2], endColorComponents[3]
    };
    //渐变系数数组
    CGFloat locations[] = {0.0, 1.0};
    //创建渐变对象
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, 2);
    //绘制渐变
    CGContextDrawRadialGradient(context, gradient, CGPointMake(size.width * 0.5, size.height * 0.5), size.width * 0.25, CGPointMake(size.width * 0.5, size.height * 0.5), size.width * 0.5, kCGGradientDrawsBeforeStartLocation);
    //释放
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(gradient);
    
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

//绘制角图片
- (void)drawImageForImageView:(UIImageView *)imageView
{
    UIGraphicsBeginImageContext(imageView.bounds.size);

    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置线条宽度
    CGContextSetLineWidth(context, 6.0f);
    //设置颜色
    CGContextSetStrokeColorWithColor(context, [[UIColor greenColor] CGColor]);
    //路径
    CGContextBeginPath(context);
    //设置起点坐标
    CGContextMoveToPoint(context, 0, imageView.bounds.size.height);
    //设置下一个点坐标
    CGContextAddLineToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, imageView.bounds.size.width, 0);
    //渲染，连接起点和下一个坐标点
    CGContextStrokePath(context);
    
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

- (void)addTimer
{
    _distance = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)timerAction
{
    if (_distance++ > _ScreenW * 0.65) _distance = 0;
    _line.frame = CGRectMake(0, _distance, _ScreenW * 0.65, 2);
}

- (void)removeTimer
{
    [_timer invalidate];
    _timer = nil;
}


#pragma mark - AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    //扫描完成
    if ([metadataObjects count] > 0) {
   
        //显示结果
        [self handleCodeString:[[metadataObjects firstObject] stringValue]];
    }
}

//识别结果

- (void)handleCodeString:(NSString *)code{


    if(self.resultBlock){
        self.resultBlock(code);
    }
 
}
-(void)startScaning:(void (^ )(NSString *))result{
    
    self.resultBlock = result;
    [self setupCamera];
}
- (void)stopScanning
{
    [_session stopRunning];
    _session = nil;
   
    [self removeTimer];
}

- (void)dealloc
{

    [_session stopRunning];
    _session = nil;
    [_preview removeFromSuperlayer];
    [self removeTimer];
}
@end
