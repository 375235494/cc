//
//  HMGroupItem.m
//  HUAMAO
//
//  Created by 裴小康 on 2017/5/21.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMGroupItem.h"

@implementation HMGroupItem

+ (instancetype)groupWithItems:(NSArray *)items
{
    HMGroupItem *group = [[self alloc] init];
    
    group.items = items;
    
    return group;
}

@end
