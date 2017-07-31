//
//  HMdealCell.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/13.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef  void (^ActionBlock)(NSDictionary * dicsouce);

@interface HMdealCell : UITableViewCell

+(instancetype)dealCellWithTableView:(UITableView *)tableView;

@property(strong,nonatomic)NSDictionary * dicSouce;

@property(copy,nonatomic)ActionBlock DeleatOrder;

@end
