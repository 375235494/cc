//
//  HMJYCell.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/20.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMJYModel;

@interface HMJYCell : UITableViewCell

@property(strong,nonatomic)HMJYModel *model;

+(instancetype)JYCell;

@end
