//
//  HMJYModel.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/20.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMJYModel : NSObject

@property(assign,nonatomic)NSInteger typeJY;

@property(copy,nonatomic) NSString *name;

@property(strong,nonatomic)NSNumber *cycle;

@property(copy,nonatomic) NSString *Buyingpoints;

@property(copy,nonatomic) NSString *money;

@property(copy,nonatomic) NSString *Profit;

@property(copy,nonatomic) NSString *endTime;

@property(assign,nonatomic)BOOL ProfitIs;
+(instancetype)JYModelWithDic:(NSDictionary *)dic;

@end
