//
//  NSDictionary+ObjectForKey.h
//  HUAMAO
//
//  Created by  on 2017/5/24.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ObjectForKey)

-(NSString *)DWStringForKey:(id)key;

-(NSArray *)DWArrayForKey:(id)key;

-(NSDictionary *)DWDictionaryForKey:(id)key;

@end
