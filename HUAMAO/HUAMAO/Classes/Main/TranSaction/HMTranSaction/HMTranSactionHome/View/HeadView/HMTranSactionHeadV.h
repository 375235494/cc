//
//  HMTranSactionHeadV.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  HMTranSactionHeadVDelegate <NSObject>

-(void)withdrawalButtonAction;

-(void)topUUpButtonAction;

-(void)announcementAction;


-(void)InvitationShow;


-(void)jumpUserCenter;//（跳到个人中心界面）

@end

@interface HMTranSactionHeadV : UIView


@property(weak,nonatomic)id<HMTranSactionHeadVDelegate> delegate;

+(instancetype)TranSactionHeadV;

@property(copy,nonatomic)NSString *strIcon;

@property(copy,nonatomic)NSString *strmoney;

@property (weak, nonatomic) IBOutlet UILabel *money;

@end
