//
//  HMbuttonSelectView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMbuttonSelectView.h"
@interface HMbuttonSelectView()

@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;




@property (weak, nonatomic) IBOutlet UIView *SelectView;



@end


@implementation HMbuttonSelectView

-(void)awakeFromNib {
    
    [super awakeFromNib];
    

    
    _titleLable.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buttonSelect:)];
    
    
    [self addGestureRecognizer:tap];
    
}

+(instancetype)buttonSelectView{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"HMbuttonSelectView" owner:self options:nil]lastObject];
}


-(void)buttonSelect:(UITapGestureRecognizer *)tap{

    if(_Slect ==YES) return;

    [self setSlect:!_Slect];
    
    if(self.SelectViewDelegate && [self.SelectViewDelegate respondsToSelector:@selector(buttonSelectViewAction:)]){
        
        [self.SelectViewDelegate buttonSelectViewAction:self];
    }
    
    
}


-(void)setSlect:(BOOL)Slect{
    
    _Slect = Slect;
    
   
    
    if(Slect == YES){
        
//
 
        self.SelectView.backgroundColor = HMUIColorFromRgbAlpha(0xfdbe19 , 1);
        
        self.backgroundColor = [UIColor blackColor];
        
        self.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
        self.layer.shadowOffset = CGSizeMake(3,3);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
        self.layer.shadowOpacity = 0.5;//阴影透明度，默认0
        self.layer.shadowRadius = 3;//阴影半径，默认3
        
        self.layer.masksToBounds =  NO;
     
   
        self.titleLable.textColor = HMUIColorFromRgbAlpha(0xaeadad , 1);
       
    
        [UIView animateWithDuration:0.2 animations:^{
            
            self.transform = CGAffineTransformTranslate(self.transform, -2, -2);
          
            
        }];
        
       

        
    }else{
        
        self.SelectView.backgroundColor = HMUIColorFromRgbAlpha(0x323232 , 1);

        self.backgroundColor = HMUIColorFromRgbAlpha(0x1e1e1e , 1);
        
        self.layer.masksToBounds =  YES;
        
        self.titleLable.textColor = HMUIColorFromRgbAlpha(0x484F57 , 1);
        
        
        
        [UIView animateWithDuration:0.2 animations:^{
            
            self.transform = CGAffineTransformIdentity;
            
            
        }];
        

    
        
    }

    
}

-(void)setTitleStr:(NSString *)titleStr{
    
    _titleStr = titleStr;
    
    _titleLable.text = titleStr;
    
}

-(void)setPriceStr:(NSString *)priceStr{
    
    _priceStr = priceStr;
    
    self.moneyLabel.text = priceStr;
    
}

-(void)setStateUpOrDown:(BOOL)stateUpOrDown{
    
    _stateUpOrDown = stateUpOrDown;
    
    if(stateUpOrDown == YES){
        
        self.moneyLabel.textColor = HMUIColorFromRgbAlpha(0xf91900 , 1);
        
        self.stateImage.image = [UIImage imageNamed:@"红色箭头"];
        
        
        
    }else{
        
        self.moneyLabel.textColor = HMUIColorFromRgbAlpha(0x18962a , 1);
        
        self.stateImage.image = [UIImage imageNamed:@"蓝色箭头"];
    }
    
    
}


@end
