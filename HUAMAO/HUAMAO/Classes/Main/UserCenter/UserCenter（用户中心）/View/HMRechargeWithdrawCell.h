//
//  HMRechargeWithdrawCell.h
//  HUAMAO
//
//  Created by 裴小康 on 2017/5/22.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMRechargeWithdrawModel.h"
#import "HMRWithdrawModel.h"
#import "HMdrawing.h"

@interface HMRechargeWithdrawCell : UITableViewCell

@property(nonatomic, strong) HMRechargeWithdrawModel *rechargeWithdrawModel;

@property(nonatomic, strong) HMdrawing *drawinModel;
@end
