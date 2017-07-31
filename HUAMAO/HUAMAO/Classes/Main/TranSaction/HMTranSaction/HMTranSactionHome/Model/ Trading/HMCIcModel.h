//
//  HMCIcModel.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/20.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMCIcModel : NSObject

@property(copy,nonatomic)NSString * name;

@property(strong,nonatomic)NSNumber *cycle;

@property(copy,nonatomic)NSString *startDate;

@property(copy,nonatomic)NSString *startPrice;

@property(copy,nonatomic)NSString *money;


@property(strong,nonatomic)NSNumber * leftTime;


@property(assign,nonatomic)NSInteger typeJY;

+(instancetype)CIcModelWithDic:(NSDictionary *)dic;


@property(copy,nonatomic)NSString * currPrice;


@property(strong,nonatomic)NSNumber *orderId;

@end
