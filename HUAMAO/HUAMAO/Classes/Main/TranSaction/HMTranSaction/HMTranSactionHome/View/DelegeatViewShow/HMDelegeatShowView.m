//
//  HMDelegeatShowView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/16.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMDelegeatShowView.h"
#import "HMDelegeatView.h"


#import "HMDelegeatTextView.h"

@interface HMDelegeatShowView()

@property(weak,nonatomic)UIView *contentMB;

@property(weak,nonatomic)HMDelegeatView * showView;

@end

@implementation HMDelegeatShowView

-(instancetype)init{
    
    
    if(self = [super init]){
        
        //蒙层
        UIView *mb = [[UIView alloc]init];
        
        mb.backgroundColor = [UIColor blackColor];
        
        mb.alpha = 0.78;
        
        [self addSubview:mb];
        
        _contentMB = mb;
        
        HMDelegeatView *  ShowView = [HMDelegeatView DelegeatView];
        
       __weak typeof(self) weakSelf = self;
        
        ShowView.SureButtonAction = ^{
            
            [weakSelf DelegeatViewEnd];
            
        };
        
        ShowView.CancelButtonAction = ^{
            
            [weakSelf DelegeatViewEnd];
            
        };
        
        
        ShowView.DelegeatLableAction = ^{
            
            
            HMDelegeatTextView * DelegeatTextView = [HMDelegeatTextView DelegeatTextView];
            
            
            DelegeatTextView.SureBlock = ^{
                
                weakSelf.showView.SelectSureButton.selected = YES;
                
                
            };
            
            DelegeatTextView.alpha = 0;
            
            UIWindow * window = [UIApplication sharedApplication].keyWindow;
            
            DelegeatTextView.x = 0;
            
            DelegeatTextView.y = 0 ;
            
            DelegeatTextView.height = window.height;
            
            DelegeatTextView.width = window.width;
            
            [weakSelf addSubview:DelegeatTextView];
            
            
            [UIView animateWithDuration:0.5 animations:^{
                
                DelegeatTextView.alpha = 1;
                
            } completion:^(BOOL finished) {
                
                
                
            }];
            
            
        };
        

        [self addSubview:ShowView];
        
        _showView = ShowView;
        

    }

    return self;

}



-(void)ShowMaskView{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    self.frame = window.bounds;
    
    _contentMB.frame = self.bounds;
    
    _showView.alpha = 0;
    
    _showView.frame = CGRectMake((self.width - 350)/2 , (self.height - 430)/2, 350 , 430);

//    _showView.layer.anchorPoint =  CGPointMake(1, 1);
    
    [window addSubview:self];
    
    [self ShowDelegeatView];
}


-(void)ShowDelegeatView{
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        _showView.alpha = 1;
        
        
    } completion:^(BOOL finished) {
        
        
        
    }];


    
}

-(void)DelegeatViewEnd{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        _showView.alpha = 0;
        
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
    }];

    
   
    
    
}


@end
