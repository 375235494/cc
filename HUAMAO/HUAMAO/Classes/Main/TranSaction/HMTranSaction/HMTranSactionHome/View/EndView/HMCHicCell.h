//
//  HMCHicCell.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/20.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>



@class HMCIcModel;

@class HMCHicCell;

@protocol HMCHicCellDelegate <NSObject>

-(void)lossrefreshMoney :(HMCHicCell *)CHicCell;

@end

@interface HMCHicCell : UITableViewCell

@property(strong,nonatomic)HMCIcModel *model;

@property(copy,nonatomic)void(^MessageShow)();

+(instancetype)CHicCell;


@property(weak,nonatomic)UIViewController * controller;

@property(weak,nonatomic)id<HMCHicCellDelegate>Delegeat;

@end

