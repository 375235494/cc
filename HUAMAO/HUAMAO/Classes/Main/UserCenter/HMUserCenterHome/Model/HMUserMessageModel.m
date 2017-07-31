//
//  HMUserMessageModel.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMUserMessageModel.h"

@implementation HMUserMessageModel


-(void)setMessageSouce:(NSDictionary *)messageSouce{
    
    _messageSouce = messageSouce;
    
    NSLog(@"%@",messageSouce);
    
    _strIcon = messageSouce[@"head"];
    
    _name = messageSouce[@"nick"];
    
    _strNum = messageSouce[@"phone"];
    
}

-(void)setTradingSouce:(NSDictionary *)tradingSouce{
    
    _tradingSouce = tradingSouce;
    
    NSLog(@"%@",tradingSouce);
    
    NSArray *arySouc =(NSArray *)tradingSouce[@"resultStr"];
    
    _Number = [NSString stringWithFormat:@"%ld",arySouc.count];
    
     CGFloat mony =0 ;
    
    for(NSDictionary *dic in arySouc){
        
        CGFloat Money11 = [dic[@"money"] floatValue];

        mony = mony + Money11;
        
    }
    
 
    _mony = [NSString stringWithFormat:@"%.1f",mony];
    
    
    
}



@end
