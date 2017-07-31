//
//  NSDictionary+ObjectForKey.m
//  HUAMAO
//
//  Created by  on 2017/5/24.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "NSDictionary+ObjectForKey.h"

@implementation NSDictionary (ObjectForKey)

-(NSString *)DWStringForKey:(id)key
{
    id object = [self objectForKey:key];
    
    if ([object isKindOfClass:[NSNull class]]||object == nil)
    {
        return @"";
    }
    return [NSString stringWithFormat:@"%@",object];
}

-(NSArray *)DWArrayForKey:(id)key
{
    id object=[self objectForKey:key];
    
    if (![object isKindOfClass:[NSArray class]])
    {
        return [NSArray array];
    }
    return object;
}

-(NSDictionary *)DWDictionaryForKey:(id)key
{
    id object = [self objectForKey:key];
    
    if (![object isKindOfClass:[NSDictionary class]])
    {
        return [NSDictionary dictionary];
    }
    return object;
}



@end
