//
//  HMprofitMaskView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/24.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMprofitMaskView.h"

#import "HMOrderMessage.h"

#import "HMorderMessageMol.h"

#import "HMprofitView.h"

@interface HMprofitMaskView()


@property(weak,nonatomic)UIView *contentMB;


@property(weak,nonatomic)HMprofitView * showView;


@property(weak,nonatomic)UIImageView *animoView;

@end

@implementation HMprofitMaskView


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
        
        

        HMprofitView *  ShowView = [HMprofitView ShowView];
        
        
        __weak typeof(self) WeekSelf = self;
        
        ShowView.ComingAction =^(){
            
            [WeekSelf End];
            
        };

        [self addSubview:ShowView];
        
        _showView = ShowView;
        
        
        UIImageView *imagv = [[UIImageView alloc]init];
        
        _animoView = imagv;
        
        [self addSubview:imagv];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(End)];
        
        [_contentMB addGestureRecognizer:tap];
        
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(MaskTag) name:@"MaskShow" object:nil];
        
    }
    
    return self;
    
    
}

-(void)MaskTag{
    
    NSInteger tagMask = [[[NSUserDefaults standardUserDefaults]objectForKey:@"maskTag"] integerValue];
    
    if(self.TagMask == tagMask){
        
        return;
    }
    
    
    [self EndWithOtherShow];
        
}


-(void)dissMiss{
    
    [self removeFromSuperview];
    
}

-(void)ShowMaskView{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    self.frame = window.bounds;
    
    _contentMB.frame = self.bounds;
    
    _showView.frame = CGRectMake((self.width - 270) /2, self.maxY, 270 , 360);
    
  
    _animoView.x = _showView.x;
    
    
    _animoView.y = 90 * kHMScreenHeight_Case *2;
    
    
    _animoView.height = 300;
    
    _animoView.width = 270;
    
    
    [window addSubview:self];
    
    [self Show];
}




-(void)Show{
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        _showView.transform = CGAffineTransformMakeTranslation(0, - (self.height - 140 *kHMScreenHeight_Case *2 ));
        
        
    } completion:^(BOOL finished) {
        
        if(_molmessage.moneyprofit >=0){
            
            NSMutableArray * arayImg = [NSMutableArray array];
            
            for(int i = 1 ; i < 13 ; i++){
                
                [arayImg addObject:[UIImage imageNamed:[NSString stringWithFormat:@"礼花%d",i]]];
            }
            
            
            [self.animoView setAnimationRepeatCount:3];
            
            [self.animoView setAnimationImages:arayImg];
            
            [self.animoView setAnimationDuration:1];
            
            [self.animoView startAnimating];
            
            
        }else{
            
            
            
        }
        
    }];
    
    
}

-(void)End{
    

        [UIView animateWithDuration:0.5 animations:^{
            
            _showView.transform = CGAffineTransformIdentity;
            
            
        } completion:^(BOOL finished) {
            
            
            if(self.Delegeat && [self.Delegeat respondsToSelector:@selector(profitMaskViewRloatMoney:)]){
                
                [self.Delegeat profitMaskViewRloatMoney:self];
                
            }
            
            [self removeFromSuperview];
            
        }];
            

    
}

-(void)EndWithOtherShow{
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.alpha = 0;
        
        
    } completion:^(BOOL finished) {
        
        
        if(self.Delegeat && [self.Delegeat respondsToSelector:@selector(profitMaskViewRloatMoney:)]){
            
            [self.Delegeat profitMaskViewRloatMoney:self];
            
        }
        
        [self removeFromSuperview];
        
    }];
    
    
    
}


-(void)layoutSubviews{
    
    [super layoutSubviews];
    
}

-(void)dealloc {
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}


@end
