//
//  HMCHiCHeadView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/20.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMCHiCHeadView.h"

@implementation HMCHiCHeadView

-(void)setArytitle:(NSArray *)arytitle{
    
    _arytitle = arytitle;
    
    for(int i = 0; i<arytitle.count; i++){
 
        UILabel *lable = (UILabel*) self.subviews[i];
        
        lable.text = arytitle[i];

    }
    
}

+(instancetype)CHiCHeadView{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"HMCHiCHeadView" owner:self options:nil]lastObject];
    
}


@end
