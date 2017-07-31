//
//  HMMoreItem.m
//  HUAMAO
//
//  Created by 裴小康 on 2017/5/21.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMMoreItem.h"

@implementation HMMoreItem

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title detailTitle:(NSString *)detailTitle
{
    HMMoreItem *item = [[self alloc] init];
    
    item.image = image;
    
    item.title = title;
        
    item.detailTitle = detailTitle;
    
    return item;
}


@end
