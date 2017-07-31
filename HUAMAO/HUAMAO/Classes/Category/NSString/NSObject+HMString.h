//
//  NSObject+HMString.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/18.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (HMString)

+ (NSString*)convertToJSONData:(id)infoDict;

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

@end
