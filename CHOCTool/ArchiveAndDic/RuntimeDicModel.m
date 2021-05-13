//
//  RuntimeDicModel.m
//  CHOCTool
//
//  Created by cyptt on 2021/5/13.
//  Copyright © 2021 com.qingtiantree. All rights reserved.
//

#import "RuntimeDicModel.h"
#import <objc/message.h>

@implementation RuntimeDicModel
+ (instancetype)runtime_initWithDictionaryForModel:(NSDictionary *)dic{
    
    id myObj = [[self alloc]init];
    unsigned int outCount;     //获取类中的所有成员属性
    objc_property_t *arrPropertys = class_copyPropertyList([self class], &outCount);
     
     for (NSInteger i = 0; i < outCount; i ++) {
         
         //获取属性名字符串
         objc_property_t property = arrPropertys[i];
         //model中的属性名
         NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
         
         id propertyValue = dic[propertyName];
         if (propertyValue != nil) {
             [myObj setValue:propertyValue forKey:propertyName];
             
         }
         
     }
     //注意在runtime获取属性的时候，并不是ARC Objective-C的对象所有需要释放
     free(arrPropertys);
     return myObj;
}

-(instancetype)initWithDicToModel:(NSDictionary *)dic{
    if (self = [super init]) {

        self.Name = dic[@"Name"];
        self.Type  = [dic[@"Type"] intValue];
        self.Des = dic[@"Des"];
        self.Motto = dic[@"Motto"];
        
    }
    
    return self;
}

@end
