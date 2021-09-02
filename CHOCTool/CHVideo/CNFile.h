//
//  CNFile.h
//  CHOCTool
//
//  Created by cyptt on 2021/8/25.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CNFile : NSObject
@property(nonatomic,copy)NSString* fileType;//image or movie

@property(nonatomic,copy)NSString* filePath;//文件在app中路径

@property(nonatomic,copy)NSString* fileName;//文件名

@property(nonatomic,assign)NSInteger fileSize;//文件大小

@property (nonatomic,assign)NSInteger trunks;//总片数

@property(nonatomic,copy)NSString* fileInfo;

@property(nonatomic,strong)UIImage * fileImage;//文件缩略图

@property(nonatomic,strong) NSMutableArray* fileArr;//标记每片的上传状态

@end

NS_ASSUME_NONNULL_END
