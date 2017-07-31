//
//  HMMaskView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMMaskView.h"

#import "HMBuyShowView.h"

#import "HMOrderMessage.h"


#import "HMOrderMessage.h"

#import "HMorderMessageMol.h"

#define ShowViewHeigth 290

#define MoveDurTion 0.5

@interface HMMaskView ()
<HMBuyShowViewDelegate>

@property(weak,nonatomic)UIView *contentMB;


@property(weak,nonatomic)HMBuyShowView * showView;

@property(weak,nonatomic)HMOrderMessage * showMessage;

@end



@implementation HMMaskView

-(instancetype)init{
    
    
    if(self = [super init]){
        
        //蒙层
        UIView *mb = [[UIView alloc]init];
        
        mb.backgroundColor = [UIColor blackColor];// HMUIColorFromRgbAlpha(0x9E8F44 , 0.59);;
        
        mb.alpha = 0.78;
        
        [self addSubview:mb];
        
        _contentMB = mb;
  
        HMBuyShowView *  ShowView = [HMBuyShowView ShowView];

        [self addSubview:ShowView];
        
        _showView = ShowView;

        HMOrderMessage *  ShowOrderMessage = [HMOrderMessage ShowView];
        
        ShowOrderMessage.frame = CGRectZero;
        
        __weak typeof(self) WeekSelf = self;
        
        ShowOrderMessage.ComingAction =^(){
            
          
            [WeekSelf endOrderMessage];
            
        };
        
        _showMessage = ShowOrderMessage;
        
        [self addSubview:ShowOrderMessage];
        
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dissMiss)];
        
        [_contentMB addGestureRecognizer:tap];

        
    }
    
    return self;

}

-(void)dissMiss{
    
    [UIView animateWithDuration:MoveDurTion animations:^{
        
        self.alpha = 0;
        
        
    } completion:^(BOOL finished) {
        
         [self removeFromSuperview];
        
    }];
    
   
    
}

-(void)ShowOrderMessage{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
     self.frame = window.bounds;
    
    _contentMB.frame = self.bounds;
    
     _showMessage.frame = CGRectMake((self.width - 270) /2, self.maxY, 270 , 290);

     [window addSubview:self];
    
    [self OrderMessageShow];

}

-(void)OrderMessageShow{
    
    [UIView animateWithDuration:MoveDurTion animations:^{
        
        _showMessage.transform = CGAffineTransformMakeTranslation(0, - (self.height - 170 *kHMScreenHeight_Case *2 ));
        
        
    } completion:^(BOOL finished) {
        
    }];
}


-(void)ShowMaskView{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    self.frame = window.bounds;

    _contentMB.frame = self.bounds;
    
    _showView.frame = CGRectMake(0, self.maxY, self.width, ShowViewHeigth);
    
    _showView .Delegate = self;
    
    [window addSubview:self];
    
    [self Show];
}


-(void)setHY:(NSInteger)HYselect cycleTime:(NSInteger)Timeselect orderType:(NSInteger)Typeselect{
    
    [self.showView setHY:HYselect cycleTime:Timeselect orderType:Typeselect];
    
}


-(void)Show{
    
    
    [UIView animateWithDuration:MoveDurTion animations:^{
        
        _showView.transform = CGAffineTransformMakeTranslation(0, - ShowViewHeigth);
        
        
    } completion:^(BOOL finished) {
        
    }];
    
 
}

-(void)End{
    

    [UIView animateWithDuration:MoveDurTion animations:^{
        
        _showView.transform = CGAffineTransformIdentity;
        
        
    } completion:^(BOOL finished) {
        
    
        [self removeFromSuperview];
        
    }];
    
    
}


-(void)layoutSubviews{
    
    [super layoutSubviews];

}


-(void)moneySelectAction:(NSInteger)index{
    
    if(self.Delegate&& [self.Delegate respondsToSelector:@selector(MaskView:moneySelectIndex:)]){
        
        [self.Delegate MaskView:self moneySelectIndex:index];
    }
    
    
}

-(void)cancelAction{
    
    if(self.Delegate && [self.Delegate respondsToSelector:@selector(MaskViewCancel:)]){
        
        [self.Delegate MaskViewCancel:self];
    }

    [self End];
    
    
}

-(void)SureAction{
    
    
    if(self.Delegate && [self.Delegate respondsToSelector:@selector(MaskViewSure:)]){
        
        [self.Delegate MaskViewSure:self];
    }
    
  
}


-(void)SureEnd{
    
    
    [UIView animateWithDuration:MoveDurTion animations:^{
        
        _showView.transform = CGAffineTransformIdentity;
        
        
    } completion:^(BOOL finished) {
        
        
        self.contentMB.backgroundColor = [UIColor blackColor];
        
        self.contentMB.alpha = 0.78;
        
        [self ShowOrderMessage];
       
        
    }];
    
}




-(void)endOrderMessage{
    
    [UIView animateWithDuration:MoveDurTion animations:^{
        
        _showMessage.transform = CGAffineTransformIdentity;
        
        
    } completion:^(BOOL finished) {
        
        
        [self removeFromSuperview];
        
    }];
}



-(void)setMolmessage:(HMorderMessageMol *)molmessage{
    
    _molmessage = molmessage;
    
    self.showMessage.molmessage = molmessage;
    
}




@end
