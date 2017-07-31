//
//  HMRiskwarningView.m
//  HUAMAO
//
//  Created by 孙密 on 17/5/17.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMRiskwarningView.h"

@interface HMRiskwarningView()

@property(weak,nonatomic)IBOutlet UITextView *textTextView;


@property(weak,nonatomic)IBOutlet UIButton *SureButton;



@end

@implementation HMRiskwarningView


-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    
//    self.backgroundColor = [UIColor blueColor];

    _textTextView.editable = NO;
  
    self.SureButton.backgroundColor= HMUIColorFromRgbAlpha(0x9E1B17 , 1);
    
    self.SureButton.layer.cornerRadius = HMCORNERRadius;
    
    
    self.SureButton.layer.masksToBounds = YES;
    
    
    
    [self.SureButton addTarget:self action:@selector(SureAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
   

}


-(void)SureAction :(UIButton *)button{
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"WarningSureActionNotifica" object:nil];
    
}


+(instancetype)RiskwarningView{
    
    
    return [[[NSBundle mainBundle]loadNibNamed:@"HMRiskwarningView" owner:self options:nil] lastObject];
}




@end
