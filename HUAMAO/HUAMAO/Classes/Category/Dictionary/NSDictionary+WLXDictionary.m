//
//  NSDictionary+WLXDictionary.m
//  WLXFamily
//
//  Created by liuming on 16/4/26.
//  Copyright © 2016年 WuHan Future Star. All rights reserved.
//

#import "NSDictionary+WLXDictionary.h"

@implementation NSDictionary (WLXDictionary)

/*
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

@end
