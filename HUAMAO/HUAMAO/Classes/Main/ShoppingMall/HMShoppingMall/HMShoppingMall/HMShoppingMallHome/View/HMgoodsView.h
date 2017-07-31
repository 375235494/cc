//
//  HMgoodsView.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/7/3.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMgoodsView;

@protocol goodsViewDelegeat <NSObject>

-(void)goodsView:(HMgoodsView *)goodsView SelectIndex:(NSInteger)index;

@end

@interface HMgoodsView : UIView

+(instancetype)goodsView;

@property(weak,nonatomic)id<goodsViewDelegeat>Delegeat;

@end
