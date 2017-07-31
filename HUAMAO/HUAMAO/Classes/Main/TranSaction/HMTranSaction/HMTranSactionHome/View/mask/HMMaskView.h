//
//  HMMaskView.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMMaskView;

@class HMorderMessageMol;

@protocol HMMaskViewDelegate <NSObject>

-(void)MaskView:(HMMaskView *)MaskView moneySelectIndex:(NSInteger)index;

-(void)MaskViewCancel:(HMMaskView *)MaskView;

-(void)MaskViewSure:(HMMaskView *)MaskView;

@end

@interface HMMaskView : UIView

-(void)ShowMaskView;

@property(weak,nonatomic)id <HMMaskViewDelegate> Delegate;

-(void)setHY:(NSInteger)HYselect cycleTime:(NSInteger)Timeselect orderType:(NSInteger)Typeselect;

-(void)SureEnd;


@property(strong,nonatomic)HMorderMessageMol *molmessage;


@end
