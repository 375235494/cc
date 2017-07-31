//
//  HMLoginShowmask.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/5.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMLoginShowmask.h"

#import "HMloginShow.h"

#define ShowViewHeigth 280

#define MoveDurTion 0.5



@interface HMLoginShowmask()

@property(weak,nonatomic)UIView *contentMB;

@property(weak,nonatomic)HMloginShow * showView;

@end

@implementation HMLoginShowmask

-(void)setLogingMessage:(NSString *)logingMessage{
    
    _logingMessage = logingMessage;
    
    _showView.logingMessage = logingMessage;
    
}

-(instancetype)init{
    
    
    if(self = [super init]){
        
        //蒙层
        UIView *mb = [[UIView alloc]init];
        
        mb.backgroundColor = [UIColor blackColor];
        
        mb.alpha = 0.78;
        
        [self addSubview:mb];
        
        _contentMB = mb;
        
        HMloginShow *  ShowView = [HMloginShow ShowView];
        
        __weak typeof(self) WeekSelf = self;
        
        ShowView.SureAction =^(){
            
//            [WeekSelf End];
            
        };
        
        
        
        [self addSubview:ShowView];
        
        _showView = ShowView;
        
        
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(End)];
        
        [self addGestureRecognizer:tap];
        
    }
    
    return self;
    
    
}

-(void)ShowMaskView{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    self.frame = window.bounds;
    
    _contentMB.frame = self.bounds;
    
    _showView.frame = CGRectMake((self.width - 60) /2, (self.height - 60)/2, 60 , 60);
    
    
    _showView.layer.anchorPoint =  CGPointMake(1, 1);
    
    [window addSubview:self];
    
    [self Show];
}




-(void)Show{
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        _showView.transform = CGAffineTransformScale(_showView.transform, 2, 2);
        
        
    } completion:^(BOOL finished) {
        
  
        
    }];
    
    
}

-(void)End{
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        _showView.transform = CGAffineTransformIdentity;
        
        
    } completion:^(BOOL finished) {
        
        
        [self removeFromSuperview];
        
    }];
    
    
}


-(void)layoutSubviews{
    
    [super layoutSubviews];
    
}


@end
