//
//  HMLine.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/26.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HMcurveLineModel;

@class HMKlinemodel;

@interface HMLine : NSObject

@property(strong,nonatomic)HMcurveLineModel *curveLineModel1;

@property(strong,nonatomic)HMcurveLineModel *curveLineModel2;

@property(strong,nonatomic)HMcurveLineModel *curveLineModel3;

@property(strong,nonatomic)HMcurveLineModel *curveLineModel4;


@property(strong,nonatomic)HMKlinemodel *Klinemodelmol1_1;

@property(strong,nonatomic)HMKlinemodel *Klinemodelmol1_3;

@property(strong,nonatomic)HMKlinemodel *Klinemodelmol1_5;

@property(strong,nonatomic)HMKlinemodel *Klinemodelmol1_15;

@property(strong,nonatomic)HMKlinemodel *Klinemodelmol2_1;

@property(strong,nonatomic)HMKlinemodel *Klinemodelmol2_3;

@property(strong,nonatomic)HMKlinemodel *Klinemodelmol2_5;

@property(strong,nonatomic)HMKlinemodel *Klinemodelmol2_15;

@property(strong,nonatomic)HMKlinemodel *Klinemodelmol3_1;

@property(strong,nonatomic)HMKlinemodel *Klinemodelmol3_3;

@property(strong,nonatomic)HMKlinemodel *Klinemodelmol3_5;

@property(strong,nonatomic)HMKlinemodel *Klinemodelmol3_15;

@property(strong,nonatomic)HMKlinemodel *Klinemodelmol4_1;

@property(strong,nonatomic)HMKlinemodel *Klinemodelmol4_3;

@property(strong,nonatomic)HMKlinemodel *Klinemodelmol4_5;

@property(strong,nonatomic)HMKlinemodel *Klinemodelmol4_15;

@property(strong,nonatomic)NSDictionary *dicmarket;

@property(strong,nonatomic)NSDictionary *Klinemodel;


@end
