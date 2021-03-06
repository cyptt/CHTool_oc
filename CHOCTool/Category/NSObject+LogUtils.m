//
//  NSObject+LogUtils.m
//  Mobileshield3.0
//
//  Created by cyptt on 2020/9/17.
//  Copyright © 2020 com.scca.test2. All rights reserved.
//

#import "NSObject+LogUtils.h"

#import <objc/runtime.h>

static NSString * const kLxArrayBegin = @"[";
static NSString * const kLxArrayEnd = @"]";
static NSString * const kLxDictionaryBegin = @"{";
static NSString * const kLxDictionaryEnd = @"}";
static NSString * const kLxSetBegin = @"{(";
static NSString * const kLxSetEnd = @")}";

static BOOL UseLogChineseSort = YES;

@implementation NSObject (LogUtils)

+ (void)setUseLogChineseSort:(BOOL)useSort {
    UseLogChineseSort = useSort;
}

+ (void)unableLogCategory {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self exchangeDescriptionMethodWithClass:[NSArray class]];
        [self exchangeDescriptionMethodWithClass:[NSDictionary class]];
        [self exchangeDescriptionMethodWithClass:[NSSet class]];
    });
}


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self exchangeDescriptionMethodWithClass:[NSArray class]];
        [self exchangeDescriptionMethodWithClass:[NSDictionary class]];
        [self exchangeDescriptionMethodWithClass:[NSSet class]];
    });
}

+ (void)exchangeDescriptionMethodWithClass:(Class)aClass {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    [self exchangeIMP:aClass OrginSel:@selector(debugDescription) NewSel:@selector(log_debugDescription)];
    [self exchangeIMP:aClass OrginSel:@selector(description) NewSel:@selector(log_description)];
    [self exchangeIMP:aClass OrginSel:@selector(descriptionWithLocale:) NewSel:@selector(log_descriptionWithLocale:)];
#pragma clang diagnostic pop
}
+ (void)exchangeIMP:(Class)aClass OrginSel:(SEL)orginalSel NewSel:(SEL)newSel {
    Method originalMethod = class_getInstanceMethod(aClass, orginalSel);
    Method swizzledMethod = class_getInstanceMethod(aClass, newSel);
    BOOL didAddMethod = class_addMethod(aClass, orginalSel, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
//    NSLog(@"--- %@ %d", aClass, didAddMethod);
    if (didAddMethod) {
        class_replaceMethod(aClass, newSel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
}

@end

@implementation NSArray (Log)

- (NSString *)log_debugDescription {
    return [NSString stringWithFormat:@"<%@ %p> %@", NSStringFromClass([self class]), self, [self descriptionWithLocale:nil]];
}

- (NSString *)log_description {
    return [NSString stringWithFormat:@"<%@ %p> %@", NSStringFromClass([self class]), self, [self descriptionWithLocale:nil]];
}

- (NSString *)log_descriptionWithLocale:(id)locale {
    NSMutableString * string = [NSMutableString string];
    [string appendFormat:@"%@\n", kLxArrayBegin];
    NSUInteger count = self.count;
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString * temp = nil;
        if ([obj respondsToSelector:@selector(descriptionWithLocale:)]) {
            temp = [obj performSelector:@selector(descriptionWithLocale:) withObject:locale];
            temp = [temp stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
        } else {
            temp = [obj performSelector:@selector(description) withObject:nil];
            if ([obj isKindOfClass:[NSString class]]) {
                temp = [NSString stringWithFormat:@"\"%@\"", temp];
            }
        }
        [string appendFormat:@"\t%@", temp];
        if (idx+1 != count) {
            [string appendString:@","];
        }
        [string appendString:@"\n"];
    }];
    [string appendString:kLxArrayEnd];
    return string;
}


@end

@implementation NSDictionary (Log)


- (NSString *)log_debugDescription {
    return [NSString stringWithFormat:@"<%@ %p> %@", NSStringFromClass([self class]), self, [self descriptionWithLocale:nil]];
}
- (NSString *)log_description {
    return [NSString stringWithFormat:@"<%@ %p> %@", NSStringFromClass([self class]), self, [self descriptionWithLocale:nil]];
}
- (NSString *)log_descriptionWithLocale:(id)locale {
    NSMutableString * string = [NSMutableString string];
    [string appendFormat:@"%@\n", kLxDictionaryBegin];
    NSArray * allKeys = nil;
    if (UseLogChineseSort) {
        BOOL canCom = YES;
        for (id temp in allKeys) {
            if ([temp respondsToSelector:@selector(compare:)] == NO) {
                canCom = NO;
                break;
            }
        }
        if (canCom) {
            allKeys = [self.allKeys sortedArrayUsingSelector:@selector(compare:)];
        } else {
            allKeys = self.allKeys;
        }
    } else {
        allKeys = self.allKeys;
    }
    NSUInteger count = allKeys.count;
    for (id key in allKeys) {
        NSInteger index = [allKeys indexOfObject:key];
        id value = [self objectForKey:key];
        NSString * temp = nil;
        if ([value respondsToSelector:@selector(descriptionWithLocale:)]) {
            temp = [value performSelector:@selector(descriptionWithLocale:) withObject:locale];
            temp = [temp stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
        } else {
            temp = [value performSelector:@selector(description) withObject:nil];
            if ([value isKindOfClass:[NSString class]]) {
                temp = [NSString stringWithFormat:@"\"%@\"", temp];
            }
        }
        [string appendFormat:@"\t%@ = %@", key, temp];
        if (index+1 != count) {
            [string appendString:@";"];
        }
        [string appendString:@"\n"];
    }
    [string appendString:kLxDictionaryEnd];
    return string;
    
}


@end



@implementation NSSet (Log)


- (NSString *)log_debugDescription {
    return [NSString stringWithFormat:@"<%@ %p> %@", NSStringFromClass([self class]), self, [self descriptionWithLocale:nil]];
}
- (NSString *)log_description {
    return [NSString stringWithFormat:@"<%@ %p> %@", NSStringFromClass([self class]), self, [self descriptionWithLocale:nil]];
}
- (NSString *)log_descriptionWithLocale:(id)locale {
    NSMutableString * string = [NSMutableString string];
    [string appendFormat:@"%@\n", kLxSetBegin];
    NSUInteger count = self.count;
    __block NSInteger idx = 0;
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString * temp = nil;
        if ([obj respondsToSelector:@selector(descriptionWithLocale:)]) {
            temp = [obj performSelector:@selector(descriptionWithLocale:) withObject:locale];
            temp = [temp stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t"];
        } else {
            temp = [obj performSelector:@selector(description) withObject:nil];
            if ([obj isKindOfClass:[NSString class]]) {
                temp = [NSString stringWithFormat:@"\"%@\"", temp];
            }
        }
        [string appendFormat:@"\t%@", temp];
        if (idx+1 != count) {
            [string appendString:@","];
        }
        [string appendString:@"\n"];
        idx += 1;
    }];
    [string appendString:kLxSetEnd];
    return string;
    
}



@end
