//
//  HMDetailListV.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/7/3.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMDetailListV.h"

#import "HMDetailCell.h"

#import "HMDetailModel.h"

#define ColumSpace 1

#define Cellheigth 230

@implementation HMDetailListV

-(instancetype)init{
    
    if(self == [super init]){
        
//        self.backgroundColor =[UIColor blackColor];
        
        
    }
    
    return self;
}

-(void)setArysouce:(NSArray *)arysouce {
    
    _arysouce = arysouce;
    
    for(UIView * view in self.subviews){
        
        [view removeFromSuperview];
    }
    
    
    
    for(int i = 0 ; i< arysouce.count ; i ++){
        
        HMDetailCell *detail = [HMDetailCell DetailCell];
        
        
        detail.dicsouce = arysouce[i];

        detail.tag = i + 100;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buttontap:)];
        
        [detail addGestureRecognizer:tap];
        
        [self addSubview:detail];
        
        
    }
    
}

-(void)buttontap:(UITapGestureRecognizer *)tap{
    
    if(self.Delegeat && [self.Delegeat respondsToSelector:@selector(HMButtonListView:index:)]){
        
        [self.Delegeat HMButtonListView:self index:tap.view.tag];
    }
    

}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    for(int i =0 ; i< self.subviews.count; i++){
        
        NSInteger columCount;
        
        if(self.subviews.count%2){
            
            columCount = self.subviews.count/2 + 1;
            
        }else{
            
            columCount = self.subviews.count/2 ;
        }
        
        UIView *view = (UIView *)self.subviews[i];
        
        view.width = (self.width - 2 *ColumSpace)/2;
        
        view.height = Cellheigth;
        
        view.x = i%2*(view.width + ColumSpace);
        
        view.y = i/2 *(view.height +ColumSpace);
        
    }

}


-(CGFloat )DetailListVHeigth{
    
    CGFloat HeigthDetail=0 ;
    
    for(int i =0 ; i< self.arysouce.count; i++){
        
        NSInteger columCount;
        
        if(self.arysouce.count%2){
            
            columCount = self.subviews.count/2 + 1;
            
        }else{
            
            columCount = self.subviews.count/2 ;
        }

        
        CGFloat height = Cellheigth;
        
 
        CGFloat y = i/2 *(height +ColumSpace);
        
        HeigthDetail = height + y;
        
    }
    
    
    return HeigthDetail;
    
}

@end
