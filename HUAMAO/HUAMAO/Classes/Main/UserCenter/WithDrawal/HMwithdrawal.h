//
//  HMwithdrawal.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/18.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMwithdrawalModel;

@interface HMwithdrawal : UIViewController

@property(strong,nonatomic) HMwithdrawalModel *withdrawalMessage;

@property(strong,nonatomic)NSNumber *mUid;
@end
