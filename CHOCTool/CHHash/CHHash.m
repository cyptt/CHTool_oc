//
//  CHHash.m
//  CHOCTool
//
//  Created by cyptt on 2020/1/9.
//  Copyright © 2020 com.qingtiantree. All rights reserved.
//

#import "CHHash.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>

#define FileHashDefaultChunkSizeForReadingData 1024*8
@implementation CHHash

+(NSString *)sha1OffilePath:(NSString *)filePath{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // Make sure the file exists
    if( [fileManager fileExistsAtPath:filePath isDirectory:nil] )
    {
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        unsigned char digest[CC_SHA1_DIGEST_LENGTH];
        CC_SHA1( data.bytes, (CC_LONG)data.length, digest );
        
        NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
        
        for( int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++ )
        {
            [output appendFormat:@"%02x", digest[i]];
        }
        
        return output;
    }
    else
    {
        return @"失败";
    }
}



+(NSString *)md5OffilePath:(NSString *)filePath{
     NSFileManager *fileManager = [NSFileManager defaultManager];
        // Make sure the file exists
        if( [fileManager fileExistsAtPath:filePath isDirectory:nil] )
        {
            NSData *data = [NSData dataWithContentsOfFile:filePath];
            unsigned char digest[CC_MD5_DIGEST_LENGTH];
            CC_MD5( data.bytes, (CC_LONG)data.length, digest );
            NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
            
            for( int i = 0; i < CC_MD5_DIGEST_LENGTH; i++ )
            {
                [output appendFormat:@"%02x", digest[i]];
            }
            
            return output;
        }
        else
        {
            return @"";
        }
}
//md5
+(NSString*)shardMD5WithPath:(NSString*)filePath{
    return (__bridge_transfer NSString *)FileMD5HashCreateWithPath((__bridge CFStringRef)filePath, FileHashDefaultChunkSizeForReadingData);
}

CFStringRef FileMD5HashCreateWithPath(CFStringRef filePath,size_t chunkSizeForReadingData) {
    // Declare needed variables
    CFStringRef result = NULL;
    CFReadStreamRef readStream = NULL;
    // Get the file URL
    CFURLRef fileURL =
    CFURLCreateWithFileSystemPath(kCFAllocatorDefault,
                                  (CFStringRef)filePath,
                                  kCFURLPOSIXPathStyle,
                                  (Boolean)false);
    if (!fileURL) goto done;
    // Create and open the read stream
    readStream = CFReadStreamCreateWithFile(kCFAllocatorDefault,
                                            (CFURLRef)fileURL);
    if (!readStream) goto done;
    bool didSucceed = (bool)CFReadStreamOpen(readStream);
    if (!didSucceed) goto done;
    // Initialize the hash object
    CC_MD5_CTX hashObject;
    CC_MD5_Init(&hashObject);
    // Make sure chunkSizeForReadingData is valid
    if (!chunkSizeForReadingData) {
        chunkSizeForReadingData = FileHashDefaultChunkSizeForReadingData;
    }
    // Feed the data to the hash object
    bool hasMoreData = true;
    while (hasMoreData) {
        uint8_t buffer[chunkSizeForReadingData];
        CFIndex readBytesCount = CFReadStreamRead(readStream,(UInt8 *)buffer,(CFIndex)sizeof(buffer));
        if (readBytesCount == -1) break;
        if (readBytesCount == 0) {
            hasMoreData = false;
            continue;
        }
        CC_MD5_Update(&hashObject,(const void *)buffer,(CC_LONG)readBytesCount);
    }
    // Check if the read operation succeeded
    didSucceed = !hasMoreData;
    // Compute the hash digest
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &hashObject);
    // Abort if the read operation failed
    if (!didSucceed) goto done;
    // Compute the string result
    char hash[2 * sizeof(digest) + 1];
    for (size_t i = 0; i < sizeof(digest); ++i) {
        snprintf(hash + (2 * i), 3, "%02x", (int)(digest[i]));
    }
    result = CFStringCreateWithCString(kCFAllocatorDefault,(const char *)hash,kCFStringEncodingUTF8);
done:
    if (readStream) {
        CFReadStreamClose(readStream);
        CFRelease(readStream);
    }
    if (fileURL) {
        CFRelease(fileURL);
    }
    return result;
}
//sha1
+(NSString*)shardFileSha1WithPath:(NSString*)filePath{
    return (__bridge_transfer NSString *)FileSHA1CreateWithPath((__bridge CFStringRef)filePath, FileHashDefaultChunkSizeForReadingData);
}

CFStringRef FileSHA1CreateWithPath(CFStringRef filePath,size_t chunkSizeForReadingData) {
    // Declare needed variables
    CFStringRef result = NULL;
    CFReadStreamRef readStream = NULL;
    // Get the file URL
    CFURLRef fileURL =
    CFURLCreateWithFileSystemPath(kCFAllocatorDefault,
                                  (CFStringRef)filePath,
                                  kCFURLPOSIXPathStyle,
                                  (Boolean)false);
    if (!fileURL) goto done;
    // Create and open the read stream
    readStream = CFReadStreamCreateWithFile(kCFAllocatorDefault,
                                            (CFURLRef)fileURL);
    if (!readStream) goto done;
    bool didSucceed = (bool)CFReadStreamOpen(readStream);
    if (!didSucceed) goto done;
  
    CC_SHA1_CTX hashObject;
    CC_SHA1_Init(&hashObject);

    if (!chunkSizeForReadingData) {
        chunkSizeForReadingData = FileHashDefaultChunkSizeForReadingData;
    }
    // Feed the data to the hash object
    bool hasMoreData = true;
    while (hasMoreData) {
        uint8_t buffer[chunkSizeForReadingData];
        CFIndex readBytesCount = CFReadStreamRead(readStream,(UInt8 *)buffer,(CFIndex)sizeof(buffer));
        if (readBytesCount == -1) break;
        if (readBytesCount == 0) {
            hasMoreData = false;
            continue;
        }
        CC_SHA1_Update(&hashObject,(const void *)buffer,(CC_LONG)readBytesCount);
       
    }


    // Check if the read operation succeeded
    didSucceed = !hasMoreData;
    // Compute the hash digest
    unsigned char cHMAC[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1_Final(cHMAC, &hashObject);
    // Abort if the read operation failed
    if (!didSucceed) goto done;
    // Compute the string result
    char hmac[2 * sizeof(cHMAC) + 1];
    for (size_t i = 0; i < sizeof(cHMAC); ++i) {
        snprintf(hmac + (2 * i), 3, "%02x", (int)(cHMAC[i]));
    }
    result = CFStringCreateWithCString(kCFAllocatorDefault,(const char *)hmac,kCFStringEncodingUTF8);
done:
    if (readStream) {
        CFReadStreamClose(readStream);
        CFRelease(readStream);
    }
    if (fileURL) {
        CFRelease(fileURL);
    }
    return result;
}

+ (NSString *)hmacSHA256WithSecret:(NSString *)secret filePath:(NSString *)filePath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
           // Make sure the file exists
           if( [fileManager fileExistsAtPath:filePath isDirectory:nil] )
           {
            
               const char *cKey  = [secret cStringUsingEncoding:NSASCIIStringEncoding];
                NSData *cData = [NSData dataWithContentsOfFile:filePath];// 有可能有中文 所以用NSUTF8StringEncoding -> NSASCIIStringEncoding
                unsigned char cHMAC[CC_SHA256_DIGEST_LENGTH];
                CCHmac(kCCHmacAlgSHA256, cKey, strlen(cKey), [cData bytes], [cData length], cHMAC);
                NSData *HMACData = [NSData dataWithBytes:cHMAC length:sizeof(cHMAC)];
                const unsigned char *buffer = (const unsigned char *)[HMACData bytes];
                NSMutableString *HMAC = [NSMutableString stringWithCapacity:HMACData.length * 2];
                for (int i = 0; i < HMACData.length; ++i){
                    [HMAC appendFormat:@"%02x", buffer[i]];
                }
                
                return HMAC;
           }
           else
           {
               return @"";
           }
 
}
//HMAC
+(NSString*)shardFileHMACWithPath:(NSString*)path withKey:(NSString *)key{
    return (__bridge_transfer NSString *)FileHMACCreateWithPath((__bridge CFStringRef)path, FileHashDefaultChunkSizeForReadingData,key);
}

CFStringRef FileHMACCreateWithPath(CFStringRef filePath,size_t chunkSizeForReadingData,NSString* key) {
    // Declare needed variables
    CFStringRef result = NULL;
    CFReadStreamRef readStream = NULL;
    // Get the file URL
    CFURLRef fileURL =
    CFURLCreateWithFileSystemPath(kCFAllocatorDefault,
                                  (CFStringRef)filePath,
                                  kCFURLPOSIXPathStyle,
                                  (Boolean)false);
    if (!fileURL) goto done;
    // Create and open the read stream
    readStream = CFReadStreamCreateWithFile(kCFAllocatorDefault,
                                            (CFURLRef)fileURL);
    if (!readStream) goto done;
    bool didSucceed = (bool)CFReadStreamOpen(readStream);
    if (!didSucceed) goto done;
    // Initialize the hash object
    const char *cKey  = [key cStringUsingEncoding:NSASCIIStringEncoding];
    CCHmacContext ctx;
    CCHmacInit(&ctx, kCCHmacAlgSHA256, cKey, strlen(cKey));
    // Make sure chunkSizeForReadingData is valid
    if (!chunkSizeForReadingData) {
        chunkSizeForReadingData = FileHashDefaultChunkSizeForReadingData;
    }
    // Feed the data to the hash object
    bool hasMoreData = true;
    while (hasMoreData) {
        uint8_t buffer[chunkSizeForReadingData];
        CFIndex readBytesCount = CFReadStreamRead(readStream,(UInt8 *)buffer,(CFIndex)sizeof(buffer));
        if (readBytesCount == -1) break;
        if (readBytesCount == 0) {
            hasMoreData = false;
            continue;
        }
        CCHmacUpdate(&ctx, (const void *)buffer,(CC_LONG)readBytesCount);
    }
    // Check if the read operation succeeded
    didSucceed = !hasMoreData;
    // Compute the hash digest
    unsigned char cHMAC[CC_SHA256_DIGEST_LENGTH];
    CCHmacFinal(&ctx, cHMAC);
    // Abort if the read operation failed
    if (!didSucceed) goto done;
    // Compute the string result
    char hmac[2 * sizeof(cHMAC) + 1];
    for (size_t i = 0; i < sizeof(cHMAC); ++i) {
        snprintf(hmac + (2 * i), 3, "%02x", (int)(cHMAC[i]));
    }
    result = CFStringCreateWithCString(kCFAllocatorDefault,(const char *)hmac,kCFStringEncodingUTF8);
done:
    if (readStream) {
        CFReadStreamClose(readStream);
        CFRelease(readStream);
    }
    if (fileURL) {
        CFRelease(fileURL);
    }
    return result;
}
@end
