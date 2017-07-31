//
//  HMpiceFluctuationsDataSouce.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/26.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMpiceFluctuationsDataSouce.h"

#import "HMproductPrice.h"

#import "HMLine.h"

#import "HMTimeChangeModel.h"

@implementation HMpiceFluctuationsDataSouce


HMSingletonM(piceFluctuationsDataSouce)

-(instancetype)init{
    
    if(self =[super init]){
        
        
        self.productPriceMol = [[HMproductPrice alloc]init];
        
        _lineMol = [[HMLine alloc]init];
        
        _timeChangeModel = [[HMTimeChangeModel alloc]init];
        
    }
    
    return self;
}

-(void)setDicSouce:(NSDictionary *)dicSouce {
    
    _dicSouce = dicSouce;
    
    self.productPriceMol.dicSouce = dicSouce[@"data"];
    
    _status_1 = [dicSouce[@"status_1"] boolValue];
    
    _status_2 = [dicSouce[@"status_2"] boolValue];;
    
    _status_3 = [dicSouce[@"status_3"] boolValue];;

    _status_4 = [dicSouce[@"status_4"] boolValue];
    
    _time = dicSouce[@"time"];
    
    
    if(dicSouce[@"market"]==nil||[dicSouce[@"market"] isKindOfClass:[NSNull class]]|| [dicSouce[@"market"] isKindOfClass:[NSString class]]){
        
        
    }else{
        
        if([dicSouce[@"market"] isKindOfClass:[NSDictionary class]]){
            
            _lineMol.dicmarket = dicSouce[@"market"];
        }
        
        
    }
    
    if(dicSouce[@"market_line"]==nil||[dicSouce[@"market_line"] isKindOfClass:[NSNull class]]|| [dicSouce[@"market_line"] isKindOfClass:[NSString class]]){
        
        
    }else{
        
        if([dicSouce[@"market_line"] isKindOfClass:[NSDictionary class]]){
            
            _lineMol.Klinemodel = dicSouce[@"market_line"];
        }
  
    }
    
    
    
    if(dicSouce[@"line"]==nil||[dicSouce[@"line"] isKindOfClass:[NSNull class]]|| [dicSouce[@"line"] isKindOfClass:[NSString class]]){
        
        
    }else{
        
        if([dicSouce[@"line"] isKindOfClass:[NSDictionary class]]){
            
            _timeChangeModel.dicSouce = dicSouce[@"line"];
        }
        
    }
    
    
    
    
}

@end
