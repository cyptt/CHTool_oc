//
//  TestVideoViewController.m
//  CHOCTool
//
//  Created by cyptt on 2021/8/7.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "TestVideoViewController.h"
#import "CNFile.h"
@interface TestVideoViewController ()

@end

@implementation TestVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)btn1:(id)sender {
    
    
}

-(void)readDataWithChunk:(NSInteger)chunk file:(CNFile*)file{
    int offset =1024*1024;
    NSInteger chunks = (file.fileSize%1024==0)?((int)(file.fileSize/1024*1024)):((int)(file.fileSize/(1024*1024) +1));
    
    NSData* data;
    
    NSFileHandle*readHandle = [NSFileHandle fileHandleForReadingAtPath:file.filePath];


    [readHandle seekToFileOffset:offset * chunk];

    data = [readHandle readDataOfLength:offset];

 

}



@end
