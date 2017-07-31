//
//  HMorderMessageMol.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/2.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMorderMessageMol.h"

@implementation HMorderMessageMol

-(void)setDicSouce:(NSDictionary *)dicSouce{

    _dicSouce = dicSouce;
    
    _cycelTime = [dicSouce[@"lefttime"] integerValue];
    
    NSString *Producename = dicSouce[@"name"];
    
    if([Producename isEqualToString:@"金乌木"]){
        
        _product = 0;
        
    }else if([Producename isEqualToString:@"黑檀木"]){
        
        _product =1;
        
    }else if([Producename isEqualToString:@"红楠木"]){
        
        _product = 2;
   
        
    }
    
    NSInteger strmoney = [dicSouce[@"money"] integerValue];
    
    _money = [self SelectMoneyWithmoney:strmoney];
    
//    _timing =  [dicSouce[@"lefttime"] integerValue];
    
    _Executiveprice = dicSouce[@"price"];
    
    
    NSNumber *typeSelct = dicSouce[@"type"];
    
    
    if(typeSelct.integerValue == 1){
        
        _type = 0;
        
    }else if(typeSelct.integerValue == -1){
        
        _type =1;
    }
    
    _addTime = dicSouce[@"addtimestr"];
    
    _endTime = dicSouce[@"endtimestr"];
    
    _EndPrcie = dicSouce[@"endprice"];

    
}





-(NSInteger)SelectMoneyWithmoney:(NSInteger)money{
    
    if(money ==5000){
        
        return 0;
        
    }else if(money ==3000){
        
        return 1;
        
    }else if(money ==2000){
        
        return 2;
        
    }else if(money ==1000){
        
        return 3;
        
    }else if(money ==500){
        
        return 4;
        
    }else if(money ==300){
        
        return 5;
        
    }else if(money ==200){
        
        return 6;
        
    }else{
        
        return 7;
    }
}


@end
