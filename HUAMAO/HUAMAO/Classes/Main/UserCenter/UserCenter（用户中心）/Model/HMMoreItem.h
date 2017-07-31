//
//  HMMoreItem.h
//  HUAMAO
//
//  Created by 裴小康 on 2017/5/21.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMMoreItem : NSObject

/** 描述cell图片 */
@property (nonatomic, strong) UIImage *image;
/** 描述cell文字 */
@property (nonatomic, copy) NSString *title;
/** 描述cell的子标题*/
@property (nonatomic, copy) NSString *detailTitle;

/** 保存点击cell做的事情 */
@property (nonatomic, strong) void(^operationBlock)();


+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title detailTitle:(NSString*)detailTitle ;

@end
