//
//  HMCommonOrderVC.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/13.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMCommonOrderVC : UIViewController

@property(strong,nonatomic)UITableView * tableView;


@property(strong,nonatomic)NSMutableArray * arySouce;


-(void)getMessageWithType:(NSInteger )type;
@end
