//
//  HMpiceFluctuationsDataSouce.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/26.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HMSingleton.h"

@class HMproductPrice;

@class HMLine;

@class HMTimeChangeModel;

@interface HMpiceFluctuationsDataSouce : NSObject


HMSingletonH(piceFluctuationsDataSouce)

@property(strong,nonatomic)HMproductPrice * productPriceMol;

@property(strong,nonatomic)HMLine *lineMol;

@property(assign,nonatomic)BOOL status_1;

@property(assign,nonatomic)BOOL status_2;

@property(assign,nonatomic)BOOL status_3;

@property(assign,nonatomic)BOOL status_4;

@property(copy,nonatomic)NSString *time;

@property(strong,nonatomic)NSDictionary *dicSouce;

@property(strong,nonatomic)HMTimeChangeModel *timeChangeModel;

@end
