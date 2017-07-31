//
//  HMMoreArrowItem.h
//  HUAMAO
//
//  Created by 裴小康 on 2017/5/21.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMMoreItem.h"

@interface HMMoreArrowItem : HMMoreItem
// 保存一个跳转的控制器类名，1.字符串 2.Class

/** 目的控制器的类名 Class */
@property (nonatomic, assign) Class descVc;
@end
