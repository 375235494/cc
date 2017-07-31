//
//  HMKlinemodel.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/31.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMKlinemodel.h"

@implementation HMKlinemodel

-(void)setDicSouce:(NSDictionary *)dicSouce{
    
    _dicSouce = dicSouce;
    
    [self.xSet removeAllObjects];
    
    [self.ySet removeAllObjects];
    
    if(dicSouce[@"xset"] == nil) return;

    if(dicSouce[@"yset"] == nil) return;
    
    
    if([dicSouce[@"yset"] isKindOfClass: [NSNull class]]) return;
    
    if([dicSouce[@"xset"] isKindOfClass: [NSNull class]]) return;
    
    
    NSArray *aryXsouce = (NSArray *)dicSouce[@"xset"];
    
    NSArray *aryYsouce = (NSArray *)dicSouce[@"yset"];
    
    if(aryXsouce.count <= 0) return;
    
    if(aryYsouce.count <= 0) return;
    

  
    

    if(aryXsouce.count > 40){
        
        for(int i = (int)(aryXsouce.count - 40) ; i < aryYsouce.count ; i ++ ){
            
            
            [self.xSet addObject:aryXsouce[i]];
        }
        
    }
    
    else{
        
        [self.xSet addObjectsFromArray:aryXsouce];
        
    }
    
    
    
    
    if(aryYsouce.count > 40){
        
        for(int i = (int)(aryYsouce.count - 40); i <aryYsouce.count ; i++ ){
        
            
            [self.ySet addObject:aryYsouce[i]];
        }
        
        
    }else{
        
        
        
        [self.ySet addObjectsFromArray:aryYsouce];
        
    }
    
    
    
    
    
    
}


-(NSMutableArray *)xSet{
    
    if(_xSet == nil){
        
        _xSet = [[NSMutableArray alloc]init];
    }
    
    return _xSet;
}

-(NSMutableArray *)ySet{
    
    if(_ySet ==nil){
        
        _ySet = [[NSMutableArray alloc]init];
    }
    
    return _ySet;
}

@end
