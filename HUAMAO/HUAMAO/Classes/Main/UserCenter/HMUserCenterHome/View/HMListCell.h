//
//  HMListCell.h
//  HUAMAO
//
//  Created by 孙密 on 17/5/18.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HMListCellDelegate <NSObject>

-(void)LinstActionIndex:(NSInteger)index;

@end

@interface HMListCell : UITableViewCell

+(CGFloat)HMCellHeigth;

@property(weak,nonatomic)id<HMListCellDelegate> Delegate;

@end
