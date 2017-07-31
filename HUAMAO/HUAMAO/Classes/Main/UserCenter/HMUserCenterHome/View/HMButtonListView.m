//
//  HMButtonListView.m
//  HUAMAO
//
//  Created by 孙密 on 17/5/17.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMButtonListView.h"
#import "HMUseCenterBaseView.h"

#define ColumSpace 1

@implementation HMButtonListView

-(instancetype)init{
    
    if(self == [super init]){
        
        self.backgroundColor =[UIColor blackColor];
        
        
    }
    
    return self;
}

-(void)ButtonListViewWithImages:(NSArray *)aryimages andAryTitle:(NSArray *)arytitles{
    
    for(int i = 0 ; i< arytitles.count ; i ++){
        
        HMUseCenterBaseView *button = [HMUseCenterBaseView HMUseCenterBaseView];
        
        [button setImage:aryimages[i] andTitel:arytitles[i]];
        
        button.tag = i + 100;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buttontap:)];
        
        [button addGestureRecognizer:tap];

        [self addSubview:button];
        
        
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
        
        if(self.subviews.count%3){
            
            columCount = self.subviews.count/2 + 1;
            
        }else{
            
            columCount = self.subviews.count/2 ;
        }
        
        UIView *view = (UIView *)self.subviews[i];
        
        view.width = (self.width - 2 *ColumSpace)/2;
        
        view.height = (self.height - (columCount - 1) * ColumSpace)/columCount;
        
        view.x = i%3*(view.width + ColumSpace);
        
        view.y = i/3 *(view.height +ColumSpace);
        
    }
    
}

@end
