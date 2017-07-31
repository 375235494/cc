//
//  HMJYModel.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/20.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMJYModel.h"

@implementation HMJYModel


-(instancetype)initWithDic:(NSDictionary *)dic{
    
    if(self = [super init]){
        
        _name = dic [@"name"];
        
        _cycle = dic[@"tzq"];
        
        _typeJY =  [dic[@"type"] integerValue];
        

        _Buyingpoints = [NSString stringWithFormat:@"%.1f",[dic[@"price"] floatValue]];

        _money = [NSString stringWithFormat:@"%@豆",dic[@"money"]] ;
        
        _Profit = [NSString stringWithFormat:@"%.f豆",[dic[@"winmoney"] floatValue] - [dic[@"money"] floatValue]] ;
        
        _endTime = [NSString stringWithFormat:@"%@",dic[@"endtimestr"]] ;
        
        
        if([dic[@"winmoney"] floatValue] - [dic[@"money"] floatValue] >=0){
            
            _ProfitIs = YES;
            
        }else{
            
            _ProfitIs = NO;
            
        }
        
    }
    
    return self;
}


+(instancetype)JYModelWithDic:(NSDictionary *)dic{
    
    return [[self alloc]initWithDic:dic];
}


@end
