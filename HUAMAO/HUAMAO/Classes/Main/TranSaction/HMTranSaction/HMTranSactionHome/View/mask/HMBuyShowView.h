//
//  HMBuyShowView.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HMBuyShowViewDelegate <NSObject>

-(void)moneySelectAction:(NSInteger)index;

-(void)cancelAction;

-(void)SureAction;

@end

@interface HMBuyShowView : UIView


+(instancetype)ShowView;

@property(weak,nonatomic) id<HMBuyShowViewDelegate>Delegate;

-(void)setHY:(NSInteger)HYselect cycleTime:(NSInteger)Timeselect orderType:(NSInteger)Typeselect;

@end
