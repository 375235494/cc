//
//  HMCIcModel.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/20.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMCIcModel.h"

@implementation HMCIcModel

-(instancetype)initWithDic:(NSDictionary *)dic{
    
    if(self = [super init]){
 
//        CGFloat min4 = [dicSouce[@"min_4"] floatValue];
//        
//        NSString * strmin4 = [NSString stringWithFormat:@"%.1f",min4 ];
//        
//        _min_4 = [NSNumber numberWithFloat: [strmin4 floatValue]];
        

        _typeJY = [dic[@"type"] integerValue];
        
        _name = dic [@"name"];
        
        _cycle =  dic[@"tzq"];
        
        _startDate =  dic[@"addtimestr"];
        
        _startPrice = [NSString stringWithFormat:@"%.1f", [dic[@"price"] floatValue]];
        
        _money =[NSString stringWithFormat:@"%.f豆", [dic[@"money"] floatValue]];// [NSString stringWithFormat:@" %@",dic[@"money"]] ;
        
        _leftTime = dic[@"lefttime"];
        
        _currPrice = [NSString stringWithFormat:@"%.1f", [dic[@"endprice"] floatValue]];  //[NSString stringWithFormat:@" %@", dic[@"endprice"]];
        
        _orderId = dic[@"id"];
        
        
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
        
        dic[@"orderId"]= _orderId;

//
        
        if(_leftTime.floatValue == 0){
            
             [[NSNotificationCenter defaultCenter]postNotificationName:@"CountdownIsZero" object:nil userInfo:dic];
        }
       
        
        
    }
    
    return self;
}


+(instancetype)CIcModelWithDic:(NSDictionary *)dic{
    
    return [[self alloc]initWithDic:dic];
}





@end
