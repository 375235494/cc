//
//  HMDelegeatTextView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/7/22.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMDelegeatTextView.h"

@implementation HMDelegeatTextView

+(instancetype)DelegeatTextView{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"HMDelegeatTextView" owner:self options:nil] lastObject];
    
}


- (IBAction)back:(id)sender {
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.alpha = 0;
        
    } completion:^(BOOL finished) {

        [self removeFromSuperview];
    }];
}

- (IBAction)SureAction:(UIButton *)sender {
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
        
        self.SureBlock();
        
        
    }];
    
}

@end
