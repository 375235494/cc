//
//  HMintervalView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/7/10.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMintervalView.h"

@implementation HMintervalView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
        UIView * backview = [[UIView alloc]initWithFrame:CGRectZero];
        
        
        backview.height = 22;
        
        backview.width = HMLXScreenWidth -20;
        
        backview.x = 10;
        
        backview.y = (frame.size.height - backview.height)/2;
        
        [self addSubview:backview];
        
        
        UIView * viewLine = [[UIView alloc]init];
        
        
        [backview addSubview:viewLine];
        
        viewLine.x = 0 ;
        
        viewLine.y = backview.height - 2;
        
        
        viewLine.height = 2;
        
        
        viewLine.width = 25;
        
        viewLine .backgroundColor = [UIColor redColor];
        
        
        
        
        
        UILabel * lableText = [[UILabel alloc]init];
        
        lableText.x  = 0;
        
        lableText. y = 0;
        
        lableText.height = backview.height - viewLine.height;
        
        
        lableText.width = 200;
        
        lableText.text = @"新品 • 热门";
        
        lableText.textColor = HMUIColorFromRgbAlpha(0x5F5F5F , 1);
        
        lableText.font = [UIFont systemFontOfSize:12];
        
        [backview addSubview:lableText];

        
    }
    
    return self;
    
}
@end
