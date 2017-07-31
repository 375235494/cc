//
//  HMbiddingCell.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMbiddingCell;

@protocol HMbiddingCellDelegate <NSObject>

-(void)biddingCellwithbidding:(HMbiddingCell *)cell;


-(void)biddingCellwithBuy :(HMbiddingCell *)cell;

@end

@interface HMbiddingCell : UITableViewCell

+(instancetype)biddingCell;


@property(weak,nonatomic) id<HMbiddingCellDelegate>Delegate;

+(CGFloat)biddingCellHeigth;

-(void)setStartTimer;


@end
