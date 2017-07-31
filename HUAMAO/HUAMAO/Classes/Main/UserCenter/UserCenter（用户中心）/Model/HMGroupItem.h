//
//  HMGroupItem.h
//  HUAMAO
//
//  Created by 裴小康 on 2017/5/21.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMGroupItem : NSObject
/** 描述当前组有多少行 */
@property (nonatomic, strong) NSArray *items;

+ (instancetype)groupWithItems:(NSArray *)items;
@end
