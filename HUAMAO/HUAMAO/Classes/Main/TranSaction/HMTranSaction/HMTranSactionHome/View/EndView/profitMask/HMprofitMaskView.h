//
//  HMprofitMaskView.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/24.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>


@class HMprofitMaskView;

@class HMorderMessageMol;

@protocol HMprofitMaskViewDelegeat <NSObject>

@optional
-(UIView *)profitMaskViewWithToFrame:(HMprofitMaskView *)profitMaskView ;


-(void)profitMaskViewRloatMoney:(HMprofitMaskView *)profitMaskView;


@end

@interface HMprofitMaskView : UIView


-(void)ShowMaskView;

@property(weak,nonatomic)id<HMprofitMaskViewDelegeat>Delegeat;

@property(copy,nonatomic)NSString *strMoney;


@property(assign,nonatomic)BOOL profitIs;


@property(strong,nonatomic)HMorderMessageMol *molmessage;


@property(assign,nonatomic)NSInteger TagMask;

@end
