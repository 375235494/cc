//
//  HMHelpCenterController.m
//  HUAMAO
//  Created by karl_pei on 2017/6/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Node;

@protocol TreeTableCellDelegate <NSObject>

-(void)cellClick:(Node *)node Code:(NSInteger)code;

@end

@interface TreeTableView : UITableView

@property (nonatomic , weak) id<TreeTableCellDelegate> treeTableCellDelegate;

-(instancetype)initWithFrame:(CGRect)frame withData : (NSArray *)data;

@end
