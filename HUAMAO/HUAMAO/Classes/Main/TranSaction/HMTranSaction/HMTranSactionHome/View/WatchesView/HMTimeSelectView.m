//
//  HMTimeSelectView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMTimeSelectView.h"

@interface HMTimeSelectView ()

@property (weak, nonatomic) IBOutlet UILabel *minitLabel;

@property (weak, nonatomic) IBOutlet UILabel *timelable;

@property (weak, nonatomic) IBOutlet UIImageView *imageIcon;

@end

@implementation HMTimeSelectView

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    
    [self  addGestureRecognizer:tap];
}

+(instancetype)TimeSelectView{
    return [[[NSBundle mainBundle]loadNibNamed:@"HMTimeSelectView" owner:self options:nil]lastObject];
    
}

-(void)setStrMinit:(NSString *)strMinit{
    
    _strMinit = strMinit;
    
    self.minitLabel.text = strMinit;
}

-(void)tapAction:(UITapGestureRecognizer *)tap{
    
    if(_viewSelect ==YES) return;
    
    [self setViewSelect:YES];
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(TimeSelectViewAction:)]){
        
        [self.delegate TimeSelectViewAction:self];
    }
    
    
    
}

-(void)setViewSelect:(BOOL)viewSelect{
    
    _viewSelect = viewSelect;
    
    if(viewSelect == YES){
        
        self.imageIcon.image = [UIImage imageNamed:@"选中时钟"];
        
        self.timelable.textColor = [UIColor whiteColor];
        
        self.minitLabel.textColor = [UIColor whiteColor];
        
    }else{
        
        self.imageIcon.image = [UIImage imageNamed:@"未选中时钟"];
        
        self.timelable.textColor = HMUIColorFromRgbAlpha(0xBCBCBC , 1);
        
        self.minitLabel.textColor = HMUIColorFromRgbAlpha(0xBCBCBC , 1);
        
    }
    
   
}




@end
