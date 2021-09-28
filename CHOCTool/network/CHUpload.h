//
//  CHUpload.h
//  CHOCTool
//
//  Created by cyptt on 2021/9/28.
//  Copyright © 2021 com.qingtiantree. All rights reserved.

/**
     *  post的上传文件，不同于普通的数据上传，
     *  普通上传，只是将数据转换成二进制放置在请求体中，进行上传，有响应体得到结果。
     *  post上传，当上传文件是， 请求体中会多一部分东西， Content——Type，这是在请求体中必须要书写的，而且必须要书写正确，不能有一个标点符号的错误。负责就会请求不上去，或者出现请求的错误（无名的问题等）
     *  其中在post 请求体中加入的格式有{1、边界 2、参数 3、换行 4、具体数据 5、换行 6、边界 7、换行 8、对象 9、结束符}
*/
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CHUpload : NSObject
+(instancetype)shareInstance;
/**
 上传图片
 @param url 路径
 @param mutipartFilePaths 上传文件路径数组
 @param mutipartFileNames 上传的文件参数名数组 如果不传默认为file
 @param parameters 参数
 @param success 成功回调
 @param failure 失败回调
 @param progress 进度
 */
-(void)uploadFileWithUrl:(NSString *)url mutipartFilePaths:(NSArray *)mutipartFilePaths mutipartFileNames:(NSArray * __nullable)mutipartFileNames parameters:(NSDictionary * __nullable)parameters success:(void(^ __nullable)(id responseObj))success failure:(void(^ __nullable)(NSError * err))failure progress:(void(^ __nullable)(float precent))progress;
@end

NS_ASSUME_NONNULL_END
