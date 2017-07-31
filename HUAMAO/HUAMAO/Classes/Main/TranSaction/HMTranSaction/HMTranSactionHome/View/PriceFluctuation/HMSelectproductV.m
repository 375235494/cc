//
//  HMSelectproductV.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMSelectproductV.h"

#import "HMbuttonSelectView.h"

#import "HMpiceFluctuationsDataSouce.h"

#import "HMproductPrice.h"

@interface HMSelectproductV()
<buttonSelectViewDelegate>

@property(weak,nonatomic)HMbuttonSelectView *selectView;


@end
@implementation HMSelectproductV


-(void)DataChageAction{
    
    HMpiceFluctuationsDataSouce *souce =  [HMpiceFluctuationsDataSouce sharedpiceFluctuationsDataSouce];

    for(int i = 0 ; i<self.subviews.count; i++){
        
        HMbuttonSelectView * view = (HMbuttonSelectView *)self.subviews[i];
        
        
        if([view.titleStr isEqualToString:@"金乌木"]){
            

            view.stateUpOrDown = souce.productPriceMol.typeUpOrDown4;
            
            if(souce.status_4 == YES){
                
                view.priceStr = [NSString stringWithFormat:@"%@",souce.productPriceMol.curr_4 ];
                
            }else{
                
                view.priceStr = @"休市";
                
                view.stateImage.image = [UIImage imageNamed:@""];
             
            }
            
        }
        
        if([view.titleStr isEqualToString:@"黑檀木"]){
            
            view.stateUpOrDown = souce.productPriceMol.typeUpOrDown1;
            
            if(souce.status_1 == YES){
                
                view.priceStr = [NSString stringWithFormat:@"%@",souce.productPriceMol.curr_1 ];
                
            }else{
                
                view.priceStr = @"休市";
                
                view.stateImage.image = [UIImage imageNamed:@""];
            }
            
        }
        
        if([view.titleStr isEqualToString:@"红楠木"]){
            
            view.stateUpOrDown = souce.productPriceMol.typeUpOrDown2;
            
            if(souce.status_2 == YES){
                
                view.priceStr = [NSString stringWithFormat:@"%@",souce.productPriceMol.curr_2];
                
            }else{
                
                view.priceStr = @"休市";
                
                view.stateImage.image = [UIImage imageNamed:@""];
            }
            
            
            
        }
        
    
        
    }
    
}

-(instancetype)init{
    
    if(self = [super init]){
        
        self.layer.borderWidth = 2;
        
        
        self.layer.borderColor = [UIColor blackColor].CGColor;
        
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(DataChageAction) name:@"DataChage" object:nil];
        
        NSArray *arysouce = @[@"红楠木",@"黑檀木",@"金乌木"];
        
        for (int i = 0 ; i < arysouce.count; i++) {
            
            HMbuttonSelectView * buttonV = [HMbuttonSelectView buttonSelectView];
            
     
            buttonV.width = (HMLXScreenWidth-10)/arysouce.count;
            
            buttonV.height = 55;
            
            
            buttonV.y = 0;
            
            buttonV.x = (arysouce.count - 1 - i) * buttonV.width ;
            
            buttonV.tag = 1000 + arysouce.count - 1 - i;
            
            
            buttonV.SelectViewDelegate = self;
            
            buttonV.titleStr = arysouce[i];
            
            [self addSubview:buttonV];
            
            if(i ==2){
                
                buttonV.transform = CGAffineTransformTranslate(self.transform, -2, -2);
                
                buttonV.Slect = YES;
                
                self.selectView = buttonV;
                
            }else{
                
                buttonV.Slect = NO;
            }
            
            
            buttonV.stateUpOrDown = YES;
 
        }
  
    }

    return self;
    
}


+(CGFloat)SelectproductVHeigth{
    
    return 55;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
//    for(int i = 0 ; i<self.subviews.count; i++){
//        
//        UIView * view = self.subviews[i];
//        
//        
//        view.width = self.width/self.subviews.count;
//        
//        view.height = self.height;
//        
//        
//        view.y = 0;
//        
//        view.x = i * view.width;
//        
//        
//
//    }
    
}


-(void)buttonSelectViewAction:(HMbuttonSelectView *)buttonSelectView{
    
    NSLog(@"%ld",buttonSelectView.tag);
    
    buttonSelectView.Slect = YES;
    
    self.selectView.Slect = NO;
    
    self.selectView = buttonSelectView;
    
    
     [self bringSubviewToFront:buttonSelectView];

    for(HMbuttonSelectView *buttonView in self.subviews){
        
        if(buttonView.tag == buttonSelectView.tag - 1){
            
             buttonView.lineView.backgroundColor = [UIColor clearColor];
            
        }else{
            
             buttonView.lineView.backgroundColor = [UIColor blackColor];
        }
        
    }

   
    
   
//    [self bringSubviewToFront:buttonSelectView];
    
    
    if(self.Delegate &&[self.Delegate respondsToSelector:@selector(SelectproductV:WithIndex:)]){
        
        [self.Delegate SelectproductV:self WithIndex:buttonSelectView.tag];
    }
    
    
}

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
