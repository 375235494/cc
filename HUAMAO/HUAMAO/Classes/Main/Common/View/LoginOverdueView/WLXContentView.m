//
//  WLXContentView.m
//  WLXTeacher
//
//  Created by 陈臣 on 16/7/28.
//  Copyright © 2016年 WuHan Future Star. All rights reserved.
//

#import "WLXContentView.h"



@implementation WLXContentView


-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super initWithCoder:aDecoder]){
        
        self.backgroundColor =  HMUIColorFromRgb(0xf0f0f0);
        
        self.layer.cornerRadius = 10;
        
        // 超出layer边框的全部裁剪掉
        self.layer.masksToBounds = YES;
        
        
    }
    
    return self;
}

+(instancetype)ContentView{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"WLXContentView" owner:self options:nil] lastObject ];
}


- (IBAction)SureAction:(UIButton *)sender {
    
    if(self.contentvDelegeat &&[self.contentvDelegeat respondsToSelector:@selector(SureAction:)]){
        
        [self.contentvDelegeat SureAction:self];
        
    }
    
    
}


@end
