//
//  HMSelectTimeCell.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMSelectTimeCell.h"

@interface HMSelectTimeCell ()


@property(weak,nonatomic)UIButton *selectView;

@end

@implementation HMSelectTimeCell

-(instancetype)init{
    
    if(self = [super init]){
        
        
        NSArray *arysouce = @[@"未选中180s",@"未选中60s",@"未选中300s"];
        
        NSArray *selcetSouce = @[@"选中180s",@"选中60s",@"选中300s"];
        
        for (int i = 0 ; i < arysouce.count; i++) {
            
            UIButton * buttonV = [UIButton buttonWithType:UIButtonTypeSystem];
            
            [buttonV addTarget:self action:@selector(TimeSelectViewAction:) forControlEvents:UIControlEventTouchDown];
            
            [buttonV setImage:[[UIImage imageNamed:arysouce[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
            
            [buttonV setImage:[[UIImage imageNamed:selcetSouce[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateDisabled];
            
            buttonV.tag = 1000+ i;
       
            [self addSubview:buttonV];
            
            buttonV.width = HMLXScreenWidth/arysouce.count;
            
            buttonV.height = 120;
            
            buttonV.x = i *  buttonV.width;
            
            buttonV.y = 0;
            
            
            if(i == 1){
                
                
                buttonV.enabled = NO;
                
                self.selectView =buttonV;
            }
            
        }

   

    }
    
    return self;
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];

    
}


-(void)TimeSelectViewAction:(UIButton *)buttonSelectView{
    
    
    buttonSelectView.enabled = NO;
    
    self.selectView.enabled = YES;
    
    self.selectView = buttonSelectView;

    
    if(self.Delegate &&[self.Delegate respondsToSelector:@selector(SelectTimeCell:SelectIndex:)]){
        
        [self.Delegate SelectTimeCell:self SelectIndex:buttonSelectView.tag];
    }
    
    
    
}




+(instancetype)initSelectTimeCell{
    
    
    return [[self alloc]init];
    
    
}

+(CGFloat )SelectTimeCellHeight{
    
    return 120;
}


@end
