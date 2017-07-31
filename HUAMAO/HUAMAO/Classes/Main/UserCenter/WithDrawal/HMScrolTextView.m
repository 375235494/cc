//
//  HMScrolTextView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/15.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMScrolTextView.h"

#define TIMESCROL 0.08

#define TIMESPACE 1

@interface HMScrolTextView()
<UIScrollViewDelegate>

@property(weak,nonatomic)UILabel *labletext;


@property(strong,nonatomic)NSTimer *timer;

@end

@implementation HMScrolTextView

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    UILabel * labletext = [[UILabel alloc]init];
    
    labletext.x = 8 ;
    
    labletext.y = 0 ;
    
    labletext.height = 44;
    
    labletext.width = 630;
    
    labletext.font = [UIFont systemFontOfSize:14];
    
    labletext.text = @"通过竞猜游戏当日赚取的金豆须隔日进行转让，赚取的金豆在国翠商城内购物则不受任何时间限制。";
    
    labletext.textColor = [UIColor whiteColor];//HMUIColorFromRgbAlpha(0xfa1900 , 1);
    
    [self addSubview:labletext];
    
    self.contentSize = labletext.bounds.size;
    
    [self timeScroll];
    
}

-(void)timeScroll{
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:TIMESCROL target:self selector:@selector(scrollTimer) userInfo:nil repeats:YES];
}

-(void)scrollTimer{
    
    if(self.contentOffset.x >= 610){
        
        self.contentOffset = CGPointMake(0,  self.contentOffset.y);
    }
    
    [self setContentOffset:CGPointMake(self.contentOffset.x + TIMESPACE,  self.contentOffset.y) animated:NO];
}

-(void)stopScroll{
    
    [self.timer invalidate];
    
    self.timer = nil;
    
}

@end
