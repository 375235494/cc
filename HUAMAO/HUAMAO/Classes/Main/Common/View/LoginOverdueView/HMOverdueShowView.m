//
//  HMOverdueShowView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/24.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMOverdueShowView.h"

#import "WLXContentView.h"

#import "HMLoginRegisteredVC.h"

#import "HMLoginNavVC.h"

@interface HMOverdueShowView ()
<WLXContentViewDelegeat>

@property(weak,nonatomic)WLXContentView *contentV;

@property(weak,nonatomic)UIView * viewMB;

@end

@implementation HMOverdueShowView



-(void)SureAction:(WLXContentView*)contentv{

    HMLoginRegisteredVC * rootloginVC = [[HMLoginRegisteredVC alloc]init];
    
    HMLoginNavVC *Navlogin = [[HMLoginNavVC alloc]initWithRootViewController:rootloginVC];
    
    
    [UIApplication sharedApplication].keyWindow.rootViewController = Navlogin;
    
    [self ShowViewDismiss];
    

}

-(void)OverdueShow{
    
    
    UIWindow *window =[UIApplication sharedApplication].windows.lastObject;
    
    self.frame = window.bounds;
    
    self.viewMB.frame = window.bounds;

    [window addSubview:self];
}


-(void)ShowViewDismiss
{
    [self removeFromSuperview];
}




-(instancetype)init{
    if(self = [super init]){
        
        
        UIView *viewcont =[[UIView alloc]init];
        
        viewcont.backgroundColor =[UIColor blackColor];
        
        [self addSubview:viewcont];
        
        viewcont.alpha = 0.2;
        
        _viewMB =viewcont;
        
        WLXContentView *contentv = [WLXContentView  ContentView];
        
        contentv.contentvDelegeat = self;
        
        
        [self addSubview:contentv];
        
        _contentV = contentv;
        
        
        
    }
    
    return self;
}

-(void)layoutSubviews {
    
    [super layoutSubviews];
    
    _contentV.width = 200;
    
    _contentV.height = 100;
    
    _contentV.x = (HMLXScreenWidth - _contentV.width)/2;
    
    _contentV.y = (HMLXScreenHeight - _contentV.height)/2;
}



    

    
    
    




@end
