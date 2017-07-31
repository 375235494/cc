//
//  HMGoldGameCell.m
//  HUAMAO
//
//  Created by karl_pei on 2017/7/7.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMGoldGameCell.h"

@implementation HMGoldGameCell

- (void)awakeFromNib {
    [super awakeFromNib];

}


-(void)setFrame:(CGRect)frame
{
    frame.size.height -= 5;
    frame.origin.y += 5;
    [super setFrame:frame];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
