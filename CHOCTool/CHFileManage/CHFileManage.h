//
//  CHFileManage.h
//  FileDemo
//
//  Created by cyptt on 2020/1/5.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

//沙盒文件目录结构 Documents、Library（caches、perferences）、temp


#import <Foundation/Foundation.h>



@interface CHFileManage : NSObject

/**
   获取document 目录
 */
+(NSString *)getDocumentPath;

//创建Documen文件夹根据文件夹名称
+(BOOL )createDocumentDirWithName:(NSString *)fileName;
/**
 创建文件夹根据路径
 @param path  要创建的文件夹路径 
 */

+(BOOL)createDir:(NSString *)path;


/**
 创建文件
 @param filePath  要创建的文件路径
 */
+(BOOL)creatFile:(NSString*)filePath;
/**
 写入沙盒
 @param filePath  要写入的文件路径
 @param data          文件data
 */
+(BOOL)writeToFile:(NSString *)filePath contents:(NSData *)data;


/**
 读文件数据
 @param filePath 文件路径

 注意：该方法是把文件一次行写入内存
 */
+(NSData*)readFileData:(NSString *)filePath;


/**
 删除文件
  @param filePath 文件路径
 */
+(BOOL)removeFile:(NSString *)filePath;

/**
 获取文件大小
 @param filePath 文件路径
 */
+(long long)getFileSize:(NSString*)filePath;


/**
 获取文件信息
  @param filePath 文件路径
 */
+(NSDictionary*)getFileInfo:(NSString*)filePath;
@end


