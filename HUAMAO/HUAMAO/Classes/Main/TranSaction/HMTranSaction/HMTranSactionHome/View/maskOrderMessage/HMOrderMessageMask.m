//
//  HMOrderMessageMask.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/1.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMOrderMessageMask.h"

#import "HMOrderMessage.h"

#import "HMorderMessageMol.h"

@interface HMOrderMessageMask()

@property(weak,nonatomic)UIView *contentMB;


@property(weak,nonatomic)HMOrderMessage * showView;

@end


@implementation HMOrderMessageMask


-(void)setMolmessage:(HMorderMessageMol *)molmessage{
    
    _molmessage = molmessage;
    
    self.showView.molmessage = molmessage;
    
}

-(instancetype)init{
    
    
    if(self = [super init]){
        
        //蒙层
        UIView *mb = [[UIView alloc]init];
        
        mb.backgroundColor = [UIColor blackColor];
        
        mb.alpha = 0.78;
        
        [self addSubview:mb];
        
        _contentMB = mb;
        
        HMOrderMessage *  ShowView = [HMOrderMessage ShowView];
        
        __weak typeof(self) WeekSelf = self;
        
        ShowView.ComingAction =^(){
            
            [WeekSelf End];
            
        };
        
        [self addSubview:ShowView];
        
        _showView = ShowView;
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dissMiss)];
        
        [_contentMB addGestureRecognizer:tap];
        
        
    }
    
    return self;
    
    
}


-(void)dissMiss{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
    }];
    
    
    
    
}

-(void)ShowMaskView{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    self.frame = window.bounds;
    
    _contentMB.frame = self.bounds;
    
    _showView.frame = CGRectMake((self.width - 270) /2, self.maxY, 270 , 290);

    [window addSubview:self];
    
    [self Show];
}




-(void)Show{
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        _showView.transform = CGAffineTransformMakeTranslation(0, - (self.height - 170 *kHMScreenHeight_Case *2 ));
        
        
    } completion:^(BOOL finished) {
        
    }];
    
    
}

-(void)End{
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        _showView.transform = CGAffineTransformIdentity;
        
        
    } completion:^(BOOL finished) {
        
    
        [self removeFromSuperview];
        
    }];

    
}


-(void)layoutSubviews{
    
    [super layoutSubviews];
    
}

@end
