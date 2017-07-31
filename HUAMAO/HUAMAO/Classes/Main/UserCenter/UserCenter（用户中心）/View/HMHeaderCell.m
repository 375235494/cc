//
//  HMHeaderCell.m
//  HUAMAO
//
//  Created by 裴小康 on 2017/6/1.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMHeaderCell.h"

@implementation HMHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
}


-(void)setFrame:(CGRect)frame
{
    frame.size.height += 1;
//    frame.origin.y += 5;
    [super setFrame:frame];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
