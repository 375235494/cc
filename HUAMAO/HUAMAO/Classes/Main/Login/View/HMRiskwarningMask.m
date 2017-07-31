//
//  HMRiskwarningMask.m
//  HUAMAO
//
//  Created by 孙密 on 17/5/17.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMRiskwarningMask.h"

#import "HMRiskwarningView.h"

@interface HMRiskwarningMask()

@property(weak,nonatomic)UIView *contentMB;


@property(weak,nonatomic)UIButton *deleatButon;

@property(weak,nonatomic)HMRiskwarningView * RiskwarningView;

@end

@implementation HMRiskwarningMask



-(instancetype)init{
    if(self = [super init]){
        
        //蒙层
        UIView *mb = [[UIView alloc]init];
        
        mb.backgroundColor = [UIColor blackColor];
        
        mb.alpha = 0.78;
        
        [self addSubview:mb];
        
        _contentMB = mb;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        
        UIImage *imagedeleat = [UIImage imageNamed:@"关闭"];
        
        imagedeleat = [imagedeleat imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [button setBackgroundImage:imagedeleat forState:UIControlStateNormal];
        
        
        [button addTarget:self action:@selector(ButtonActonDimiss :) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self addSubview:button];
        
//        [button setTitle:@"关闭" forState:UIControlStateNormal];
        
        _deleatButon = button;
        
        
        HMRiskwarningView *  RiskwarningView = [HMRiskwarningView RiskwarningView];

        
        [self addSubview:RiskwarningView];

        
        _RiskwarningView = RiskwarningView;
 
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dimiss) name:@"WarningSureActionNotifica" object:nil];
        
    }
    
    return self;
}

-(void)ShowRiskwarningView{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    
    self.frame = window.bounds;
    
    
    [window addSubview:self];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    _contentMB.frame = self.bounds;
    
    _deleatButon.width = 20;
    
    
    _deleatButon.height = 20;
    
    _deleatButon.y = 30;
    
    _deleatButon.x = self.width - 30 - _deleatButon.width;
    
    
    _RiskwarningView.width =  self.width - 30 *2;
    
    
    _RiskwarningView.x = 30;
    
    
    _RiskwarningView.height = self.height - self.deleatButon.maxY - _deleatButon.y;
    
    
    _RiskwarningView.y  =  self.deleatButon.maxY;

    
    
}

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}


-(void)ButtonActonDimiss:(UIButton *)button{
    
    [self dimiss];
    
}

-(void)dimiss{
    
    [self removeFromSuperview];
}

@end
