
//
//  HMGoodsMessageCell.h
//  HUAMAO
//
//  Created by karl_pei on 2017/7/3.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMSureOtherModel.h"
#import "HMAddressModel.h"

@interface HMGoodsMessageCell : UITableViewCell

@property(nonatomic, strong)HMSureOtherModel *otherDetailsModel;
@property(nonatomic, strong)HMAddressModel *addressMode;

@property(nonatomic, copy)NSString *shopnumber;

@end
