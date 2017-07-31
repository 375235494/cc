//
//  HMsureorderVC.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/7/2.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMSureOtherModel.h"
#import "HMAddressModel.h"

@interface HMsureorderVC : UIViewController

@property (copy, nonatomic)NSString *order_id;

@property (nonatomic, strong) HMSureOtherModel *goodsShowModel;

@property (nonatomic, strong) HMAddressModel *addressModel;

@end
