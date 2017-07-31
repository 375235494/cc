//
//  HMcurveLineModel.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/30.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMcurveLineModel.h"

@implementation HMcurveLineModel


-(NSMutableArray *)aryVal{
    if(_aryVal == nil){
        
        _aryVal = [[NSMutableArray alloc]init];
    }
    
    return _aryVal;
    
}

-(NSMutableArray *)arytime {
    
    if(_arytime ==nil){
        
        _arytime = [[NSMutableArray alloc]init];
    }
    
    return _arytime;
}


-(void)setCurverLineAry:(NSArray *)curverLineAry{

    _curverLineAry = curverLineAry;
    
    if(curverLineAry == nil) return;
    
    if(curverLineAry.count == 0) return;
    
    
    if([curverLineAry isKindOfClass:[NSNull class]]) return;
    
    [self.arytime removeAllObjects];
    
    [self.aryVal removeAllObjects];
    
    
    if(!(curverLineAry.count > 40)){
        
        for(int i = 0 ; i< curverLineAry.count ; i++){
            
            NSDictionary *dicSouce = (NSDictionary * )curverLineAry[i];
            
            NSLog(@"%@", dicSouce[@"val"]);
            
            [self.arytime addObject:dicSouce[@"time"]];
            
            [self.aryVal addObject:dicSouce[@"val"] ];
            
            
        }
        
    }else{
        
        
        for(int i = (int )(curverLineAry.count - 40) ; i< curverLineAry.count ; i++){
            
            NSDictionary *dicSouce = (NSDictionary * )curverLineAry[i];
            
            NSLog(@"%@", dicSouce[@"val"]);
            
            [self.arytime addObject:dicSouce[@"time"]];
            
            [self.aryVal addObject:dicSouce[@"val"] ];
            
            
        }
        
        
    }

 

    
}


@end
