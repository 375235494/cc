//
//  HMPlaceholderTextView.h
//  HUAMAO
//
//  Created by 裴小康 on 2017/5/17.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMPlaceholderTextView : UITextView

/** 占位文字 */
@property (nonatomic, copy) NSString *placeholder;
/** 占位文字颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;
/** 显示占位文字的label */
@property (nonatomic, weak) UILabel *placeholderLabel;

@end
