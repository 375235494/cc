//
//  HMHeadCell.h
//  HUAMAO
//
//  Created by 孙密 on 17/5/18.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HMUserMessageModel.h"

@class HMUserMessageModel;

@interface HMHeadCell : UITableViewCell

+(instancetype)HeadCell;


+(CGFloat)HeadCellHeigth;

@property(strong,nonatomic) HMUserMessageModel *usermessageMol;

@end
