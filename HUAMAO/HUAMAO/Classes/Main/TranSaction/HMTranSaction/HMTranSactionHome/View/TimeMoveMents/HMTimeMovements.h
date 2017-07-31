//
//  HMTimeMovements.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMTimeMovements;

@protocol HMTimeMovementsDelegate <NSObject>

-(void)TimeMovementsSelect:(HMTimeMovements *)TimeMovements withTag:(NSInteger)index;

@end

@interface HMTimeMovements : UITableViewCell

+(instancetype )TimeMovements;


+(CGFloat )TimeMovementsHeigth;

@property(weak,nonatomic)id <HMTimeMovementsDelegate> Delegate;

@end
