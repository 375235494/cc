//
//  HMPriceChange.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/20.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMPriceChange;

@protocol HMPriceChangeDelegate <NSObject>

-(NSInteger)PriceChangeSelceted:(HMPriceChange *)PriceChange;

@end

@interface HMPriceChange : UIView

+(instancetype)PriceChange;

+(CGFloat)PriceChangeHeigth;

@property(weak,nonatomic)id<HMPriceChangeDelegate>Delegate;

@end
