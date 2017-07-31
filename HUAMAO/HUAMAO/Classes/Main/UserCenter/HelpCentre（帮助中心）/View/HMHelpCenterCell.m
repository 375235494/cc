//
//  HMHelpCenterCell.m
//  HUAMAO
//
//  Created by  on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMHelpCenterCell.h"

@interface HMHelpCenterCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@property (weak, nonatomic) IBOutlet UILabel *detaLab;


@end

@implementation HMHelpCenterCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setHelpCenteModel:(HMHelpCenteModel *)helpCenteModel
{
    _helpCenteModel = helpCenteModel;
    self.titleLab.text = helpCenteModel.title;
    self.detaLab.hidden = YES;

}



@end
