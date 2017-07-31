//
//  HMMoreCell.h
//  HUAMAO
//
//  Created by 裴小康 on 2017/5/21.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMMoreItem.h"

@interface HMMoreCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView cellStyle:(UITableViewCellStyle)cellStyle;
/** item行模型,描述cell的外观 */
@property (nonatomic, strong) HMMoreItem *item;

@end
