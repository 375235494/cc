//
//  HMproductPrice.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/26.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMproductPrice : NSObject

@property(strong,nonatomic)NSNumber * curr_1;

@property(strong,nonatomic)NSNumber * max_1;

@property(strong,nonatomic)NSNumber * min_1;

@property(strong,nonatomic)NSNumber * day_1;

@property(strong,nonatomic)NSNumber * curr_2;

@property(strong,nonatomic)NSNumber * max_2;

@property(strong,nonatomic)NSNumber * min_2;

@property(strong,nonatomic)NSNumber * yes_2;

@property(strong,nonatomic)NSNumber * day_2;

@property(strong,nonatomic)NSNumber * curr_3;

@property(strong,nonatomic)NSNumber * max_3;

@property(strong,nonatomic)NSNumber * min_3;



@property(strong,nonatomic)NSNumber * yes_3;

@property(strong,nonatomic)NSNumber * day_3;

@property(strong,nonatomic)NSNumber * curr_4;

@property(strong,nonatomic)NSNumber * max_4;

@property(strong,nonatomic)NSNumber * min_4;


@property(strong,nonatomic)NSNumber * yes_4;

@property(strong,nonatomic)NSNumber * day_4;


@property(assign,nonatomic)BOOL typeUpOrDown1;

@property(assign,nonatomic)BOOL typeUpOrDown2;

@property(assign,nonatomic)BOOL typeUpOrDown3;

@property(assign,nonatomic)BOOL typeUpOrDown4;

@property(strong,nonatomic)NSDictionary *dicSouce;
@end



