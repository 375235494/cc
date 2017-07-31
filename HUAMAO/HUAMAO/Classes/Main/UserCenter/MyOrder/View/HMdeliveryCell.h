//
//  HMdeliveryCell.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/13.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMdeliveryCell : UITableViewCell

+(instancetype)deliveryCellWithTableView:(UITableView *)tableView;

@property(strong,nonatomic)NSDictionary * dicSouce;

@end
