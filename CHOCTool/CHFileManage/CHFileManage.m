//
//  CHFileManage.m
//  FileDemo
//
//  Created by cyptt on 2020/1/5.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "CHFileManage.h"

@implementation CHFileManage

+(NSString *)getDocumentPath{
    NSString * path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    return path;
}
+(BOOL )createDocumentDirWithName:(NSString *)fileName{
    if (fileName.length ==0) {
        return NO;
    }
    NSString * path = [[CHFileManage getDocumentPath]stringByAppendingPathComponent:fileName];
    NSLog(@"createDocumentDirWithName ---path---%@",path);
    BOOL isSucess = [CHFileManage createDir:path];
    return isSucess;
}
+(BOOL)createDir:(NSString *)path{
    if (path.length==0) {
        return NO;
    }
    NSFileManager * fileManager = [NSFileManager defaultManager];
    BOOL isSucess = YES;
    BOOL isExist = [fileManager fileExistsAtPath:path];
    if (isExist ==NO) {
        NSError * error;
        if (![fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error]) {
            isSucess =NO;
        }
    }
    return isSucess;
}

+(BOOL)creatFile:(NSString*)filePath{
    if (filePath.length==0) {
        return NO;
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:filePath]) {
        return YES;
    }
    NSError *error;
    NSString *dirPath = [filePath stringByDeletingLastPathComponent];
    BOOL isSuccess = [fileManager createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&error];
    if (error) {
        NSLog(@"creat File Failed:%@",[error localizedDescription]);
    }
    if (!isSuccess) {
        return isSuccess;
    }
    isSuccess = [fileManager createFileAtPath:filePath contents:nil attributes:nil];
    return isSuccess;
}
+(BOOL)writeToFile:(NSString *)filePath contents:(NSData *)data{
    if (filePath.length==0) {
           return NO;
       }
       BOOL result = [self creatFile:filePath];
       if (result) {
           if ([data writeToFile:filePath atomically:YES]) {
               NSLog(@"write Success");
           }else{
               NSLog(@"write Failed");
           }
       }
       else{
           NSLog(@"write Failed");
       }
       return result;
}

+(NSData*)readFileData:(NSString *)filePath{
       NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:filePath];
       NSData *fileData = [handle readDataToEndOfFile];
       [handle closeFile];
       return fileData;
}

+(BOOL)removeFile:(NSString *)filePath{
    BOOL isSuccess = NO;
       NSError *error;
       NSFileManager *fileManager = [NSFileManager defaultManager];
       isSuccess = [fileManager removeItemAtPath:filePath error:&error];
       if (error) {
           NSLog(@"removeFile Field：%@",[error localizedDescription]);
       }else{
           NSLog(@"removeFile Success");
       }
       return isSuccess;
}

+(long long)getFileSize:(NSString*)path{
    unsigned long long fileLength = 0;
    NSNumber *fileSize;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDictionary *fileAttributes = [fileManager attributesOfItemAtPath:path error:nil];
    if ((fileSize = [fileAttributes objectForKey:NSFileSize])) {
        fileLength = [fileSize unsignedLongLongValue]; //单位是 B
    }
    return fileLength;
}


+(NSDictionary*)getFileInfo:(NSString*)filePath{
    NSError *error;
    NSDictionary *reslut =  [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:&error];
    if (error) {
        NSLog(@"getFileInfo Failed:%@",[error localizedDescription]);
    }
    return reslut;
}
@end
