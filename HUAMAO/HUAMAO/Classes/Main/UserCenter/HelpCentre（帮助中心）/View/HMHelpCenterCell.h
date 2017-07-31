//
//  HMHelpCenterCell.h
//  HUAMAO
//
//  Created by  on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMHelpCenteModel.h"
#import "HMContModel.h"

@interface HMHelpCenterCell : UITableViewCell

@property (nonatomic, strong) HMHelpCenteModel *helpCenteModel;

@property(nonatomic,strong)HMContModel *contModel;

@end
