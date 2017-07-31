//
//  HMwithdrawalModel.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/18.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMwithdrawalModel.h"

@implementation HMwithdrawalModel

-(void)setDicsouce:(NSDictionary *)dicsouce{
    
    _dicsouce = dicsouce;
    
    NSLog(@"%@",dicsouce);
    
    _strMoney = [NSString stringWithFormat:@"%.1f", [dicsouce[@"account"] floatValue] ] ;
    
    
    _bank = dicsouce[@"bankname"];
    
    _Name = dicsouce[@"username"];
    
    _bankNumber = dicsouce[@"bankno"];
    
    _PhoneNumber = dicsouce[@"phone"];
    
    _peopelNum = dicsouce[@"sfzid"];
    
    
}

@end
