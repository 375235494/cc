//
//  HMTitleButton.m
//  HUAMAO
//
//  Created by  on 2017/5/26.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMTitleButton.h"

@implementation HMTitleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:HMColor(80, 80, 80) forState:UIControlStateNormal];
        [self setTitleColor:HMUIColorFromRgbAlpha(0xe91a01, 1) forState:UIControlStateSelected];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return self;
}

  // 重写这个方法的目的：去掉父类在highlighted时做的一切操作
- (void)setHighlighted:(BOOL)highlighted {

}

@end
