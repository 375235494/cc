//
//  HMKlineGraphView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/20.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMKlineGraphView.h"

#import "HMmovementsView.h"

#import "HMKlineView.h"

@interface HMKlineGraphView()

@property(strong,nonatomic)HMmovementsView *movementsV;

@property(strong,nonatomic)HMKlineView * KlineV;

@end

@implementation HMKlineGraphView
  

-(instancetype)init{
    
    if(self = [super init]){
   
         [self addSubview:self.KlineV];
        
         [self addSubview:self.movementsV];
        
        
        self.backgroundColor = HMUIColorFromRgbAlpha(0x1e1e1e , 1);;
    }
    
    return self;
    
}


-(void)showKlineView{

    [self bringSubviewToFront:self.KlineV];
 
}

-(void)showmovement{
    
 
    
    [self bringSubviewToFront:self.movementsV];
}


+(CGFloat)lineGraphViewHeigth{
    
    return 210;
}

-(HMmovementsView *)movementsV{
    
    if(_movementsV == nil){
        
        _movementsV = [[HMmovementsView alloc]initWithFrame:CGRectMake(0, 0, HMLXScreenWidth-60, 150)];
        
    }
    
    return _movementsV;
    
}

-(HMKlineView *)KlineV{
    
    if(_KlineV == nil){
        
        _KlineV = [[HMKlineView alloc]initWithFrame:CGRectMake(0, 0, HMLXScreenWidth -60, 150)];
    }
    
    return _KlineV ;
}




@end
