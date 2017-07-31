//
//  HMTextScrolView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMTextScrolView.h"

#import "Masonry.h"

#define TIMESCROL 0.08

#define TIMESPACE 1

@interface HMTextScrolView()


@property(weak,nonatomic)UILabel *labletext;


@property(strong,nonatomic)NSTimer *timer;

@end

@implementation HMTextScrolView

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    self.bounces = NO;
    
    self.showsHorizontalScrollIndicator = NO;
    
    self.showsVerticalScrollIndicator = NO;
    

    UILabel * labletext = [[UILabel alloc]init];
    
    labletext.x =8;
    
    labletext.y = 0;
    
    labletext.height = 25 ;
    
    labletext.width = 790;

    labletext.font = [UIFont systemFontOfSize:12];
    
//    竞猜活动开启时间为7月1日至10月1日结束，为期3个月，敬请控制竞猜活动期间金豆数量浮动所产生的任何风险，活动解释权归国翠商城所有。
    labletext.text = @"竞猜活动开启时间为7月1日至10月1日结束，为期3个月，敬请控制竞猜活动期间金豆数量浮动所产生的任何风险，活动解释权归国翠商城所有。";
    
    labletext.textColor = HMUIColorFromRgbAlpha(0xfa1900 , 1);
    
    [self addSubview:labletext];

    self.contentSize = CGSizeMake(labletext.width, 0);
    
    [self timeScroll];
    
}




-(void)timeScroll{
    
     _timer = [NSTimer scheduledTimerWithTimeInterval:TIMESCROL target:self selector:@selector(scrollTimer) userInfo:nil repeats:YES];
}

-(void)scrollTimer{
    
    if(self.contentOffset.x >= 770){
        
        self.contentOffset = CGPointMake(0,  self.contentOffset.y);
    }
    
    [self setContentOffset:CGPointMake(self.contentOffset.x + TIMESPACE,  self.contentOffset.y) animated:NO];
}

-(void)stopScroll{
    
    [self.timer invalidate];
    
    self.timer = nil;
    
}

@end
