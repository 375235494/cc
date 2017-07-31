//
//  HMOrderCell.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/29.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMOrderCell;

@protocol HMOrderCellDelegeat <NSObject>

-(void)cellAction:(HMOrderCell *) OrderCell SelectIndex:(NSInteger)index;

@end

@interface HMOrderCell : UITableViewCell

@property(weak,nonatomic) id<HMOrderCellDelegeat>  Delegeat;

@end
