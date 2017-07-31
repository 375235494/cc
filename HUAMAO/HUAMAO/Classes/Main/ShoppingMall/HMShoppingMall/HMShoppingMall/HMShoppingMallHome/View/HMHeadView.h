//
//  HMHeadView.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/7/2.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HeadViewDelegeat <NSObject>

-(void)willcouponsAction;

-(void)willtopUpAction;

-(void)willwithdrawalAction;

-(void)jumpUserCenter;

@end

@interface HMHeadView : UIView

+(instancetype)HeadView;


@property(weak,nonatomic)id<HeadViewDelegeat>Delegeat;


@property(copy,nonatomic)NSString *strIcon;

@property(copy,nonatomic)NSString *strmoney;

@end
