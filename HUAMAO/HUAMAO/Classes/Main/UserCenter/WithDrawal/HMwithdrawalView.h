//
//  HMwithdrawalView.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/7/26.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMwithdrawalView;


@protocol HMwithdrawalViewDelegeat <NSObject>

-(void)CardbindingDoing:(HMwithdrawalView *)withdrawalView;


-(void)Back:(HMwithdrawalView *)withdrawalView;

@end

@class HMwithdrawalModel;

@interface HMwithdrawalView : UIView

@property(strong,nonatomic) HMwithdrawalModel *withdrawalMessage;

+(instancetype)withdrawalView;

@property(weak,nonatomic)id<HMwithdrawalViewDelegeat> Delegeat;


@property(strong,nonatomic)NSNumber *mUid;

@end
