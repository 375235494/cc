//
//  HMUserHeadView.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/22.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMUserMessageModel;

@protocol UserHeadViewDelegeat <NSObject>

-(void)withdrawalButtonAction;
    

-(void)topUUpButtonAction;

@end

@interface HMUserHeadView : UIView

+(instancetype)UserHeadView;

+(CGFloat)UserHeadViewHeigth;

@property(copy,nonatomic)NSString *money;

@property(copy,nonatomic)NSString *personname;

@property(copy,nonatomic)NSString *personIcon;

@property(strong,nonatomic)HMUserMessageModel * usermessageMol;

@property(weak, nonatomic)id<UserHeadViewDelegeat> Delegeat;

@end
