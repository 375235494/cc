//
//  HMproductPrice.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/26.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMproductPrice.h"

@implementation HMproductPrice

-(void)setDicSouce:(NSDictionary *)dicSouce{
    
    _dicSouce = dicSouce;
    
    NSLog(@"%@",dicSouce);
    

    if([dicSouce[@"curr_1"] floatValue] >= [_curr_1 floatValue] ){
        
        _typeUpOrDown1 = YES;
    }else{
        
        _typeUpOrDown1 =  NO;
    }
    
    if([dicSouce[@"curr_2"] floatValue] >= [_curr_2 floatValue] ){
        
        _typeUpOrDown2 = YES;
    }else{
        
        _typeUpOrDown2 =  NO;
    }
    
    if([dicSouce[@"curr_3"] floatValue] >= [_curr_3 floatValue] ){
        
        _typeUpOrDown3 = YES;
    }else{
        
        _typeUpOrDown3 =  NO;
    }
    
    if([dicSouce[@"curr_4"] floatValue] >= [_curr_4 floatValue] ){
        
        _typeUpOrDown4 = YES;
    }else{
        
        _typeUpOrDown4 =  NO;
    }
    
    
    _curr_1 = dicSouce[@"curr_1"];
    
    _max_1 = dicSouce[@"max_1"];
    
    _min_1 = dicSouce[@"min_1"];
    
    _day_1 = dicSouce[@"day_1"];
    
    _curr_2 = dicSouce[@"curr_2"];
    
    _max_2 = dicSouce[@"max_2"];
    
    _min_2 = dicSouce[@"min_2"];
    
    _yes_2 =dicSouce[@"yes_2"];
    
    _day_2 = dicSouce[@"day_2"];
    
    _curr_3 = dicSouce[@"curr_3"];
    
    _max_3 = dicSouce[@"max_3"];
    
    _min_3 = dicSouce[@"min_3"];
    
    _yes_3 = dicSouce[@"yes_3"];
    
    _day_3 = dicSouce[@"day_3"];
    
    CGFloat Curr4 = [dicSouce[@"curr_4"] floatValue];
    
    NSString * strCurr4 = [NSString stringWithFormat:@"%.1f",Curr4 ];
    
    _curr_4 = [NSNumber numberWithFloat: [strCurr4 floatValue]]; //dicSouce[@"curr_4"];
    
    
    
    
//    _max_4 = dicSouce[@"max_4"];
    
    CGFloat max4 = [dicSouce[@"max_4"] floatValue];
    
    NSString * strmax4 = [NSString stringWithFormat:@"%.1f",max4 ];
    
    _max_4 = [NSNumber numberWithFloat: [strmax4 floatValue]]; //dicSouce[@"curr_4"];
    
    
    
//    _min_4 = dicSouce[@"min_4"];
    
    
    CGFloat min4 = [dicSouce[@"min_4"] floatValue];
    
    NSString * strmin4 = [NSString stringWithFormat:@"%.1f",min4 ];
    
    _min_4 = [NSNumber numberWithFloat: [strmin4 floatValue]];
    
    
    
    
//    _yes_4 = dicSouce[@"yes_4"];
    
    CGFloat yes4 = [dicSouce[@"yes_4"] floatValue];
    
    NSString * stryes4 = [NSString stringWithFormat:@"%.1f",yes4 ];
    
    _yes_4 = [NSNumber numberWithFloat: [stryes4 floatValue]];
    
    
    
    
    CGFloat day4 = [dicSouce[@"day_4"] floatValue];
    
    NSString * strday4 = [NSString stringWithFormat:@"%.1f",day4 ];
    
    _day_4 = [NSNumber numberWithFloat: [strday4 floatValue]];
    
//    _day_4 = dicSouce[@"day_4"];
    
    
}

@end
