//
//  HMSelectTimeCell.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMSelectTimeCell;

@protocol HMSelectTimeCellDelegate <NSObject>

-(void)SelectTimeCell:(HMSelectTimeCell*)SelectTimeCell SelectIndex:(NSInteger)index;

@end

@interface HMSelectTimeCell : UIView

+(instancetype)initSelectTimeCell;

+(CGFloat )SelectTimeCellHeight;

@property(weak,nonatomic)id<HMSelectTimeCellDelegate>Delegate;

@end
