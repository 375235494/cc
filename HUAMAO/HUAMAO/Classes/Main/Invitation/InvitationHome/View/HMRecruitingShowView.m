//
//  HMRecruitingShowView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMRecruitingShowView.h"

#import "HMShowView.h"

#import "HMShowPlusView.h"


@interface HMRecruitingShowView()


@property(weak,nonatomic)UIView *contentMB;


@property(weak,nonatomic)UIButton * deleatButon;

@property(weak,nonatomic)UIView * showView;


@end

@implementation HMRecruitingShowView

-(instancetype)init{
    
    
    if(self = [super init]){
        
        //蒙层
        UIView *mb = [[UIView alloc]init];
        
        mb.backgroundColor = [UIColor blackColor];
        
        mb.alpha = 0.0;
        
        [self addSubview:mb];
        
        _contentMB = mb;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        
        UIImage *imagedeleat = [UIImage imageNamed:@"DeleatRound"];
        
        imagedeleat = [imagedeleat imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        [button setBackgroundImage:imagedeleat forState:UIControlStateNormal];

        [button addTarget:self action:@selector(ButtonActonDimiss :) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        
//                [button setTitle:@"关闭" forState:UIControlStateNormal];
        
        _deleatButon = button;
        
        if(HMLXScreenWidth * 2 >  750){
            
             HMShowPlusView  *  ShowView = [HMShowPlusView ShowView];
            
            [self addSubview:ShowView];
            
            
            _showView = ShowView;
            
            
        }else{
            
            HMShowView *  ShowView = [HMShowView ShowView];
            
            [self addSubview:ShowView];
            
            _showView = ShowView;
            
        }

    }
    
    return self;
    
    
}

-(void)ShowRiskwarningView{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    
    self.frame = window.bounds;
   
    
    self.y =  -window.height;

    [window addSubview:self];
    
    [UIView animateWithDuration:0.5 animations:^{

        self.frame = window.bounds;
        
    } completion:^(BOOL finished) {
        
        _contentMB.alpha = 0.78;
    }];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    _contentMB.frame = self.bounds;
 
    _showView.height = 400 * kHMScreenHeight_Case *2 ;

    _showView.width = 250 *kHMScreenWidth_Case *2;
        
 
    _showView.x = (self.width - _showView.width)/2;
    
    
    
    
    _deleatButon.height = 50;
    
    _deleatButon.width = 50;
    
    _deleatButon.x = (self.width - 50)/2 ;
    

    if(HMLXScreenWidth * 2 <  750){
        
        _showView.y = 90 *kHMScreenHeight_Case *2;
        
         _deleatButon.y = _showView.maxY + 50;
        
        
    }else{
        
        _showView.y = 110 *kHMScreenHeight_Case *2;
       
         _deleatButon.y = _showView.maxY;
       
    }

    

}

-(void)setQrcode:(NSString *)qrcode{
    
    _qrcode =qrcode;
    
    if(HMLXScreenWidth * 2 >  750){
        
        HMShowPlusView  *  ShowView = (HMShowPlusView *)_showView;
        
  
        ShowView.qrcode = qrcode;
        
        
    }else{
        
        HMShowView *  ShowView = (HMShowView*)_showView ;
        
        ShowView.qrcode = qrcode;

    }

}

-(void)setYqmcode:(NSString *)yqmcode{
    
    _yqmcode = yqmcode;
    
    if(HMLXScreenWidth * 2 >  750){
        
        HMShowPlusView  *  ShowView = (HMShowPlusView *)_showView;
        
        
        ShowView.yqmcode = yqmcode;
        
        
    }else{
        
        HMShowView *  ShowView = (HMShowView*)_showView ;
        
        ShowView.yqmcode = yqmcode;
        
    }
}


-(void)ButtonActonDimiss:(UIButton *)button{
    
    _contentMB.alpha = 0;
    
    [UIView animateWithDuration:0.5 animations:^{
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        self.y = - window.bounds.size.height;
        
    } completion:^(BOOL finished) {
        
        [self dimiss];
    }];


}

-(void)dimiss{
    
    [self removeFromSuperview];
}

@end
