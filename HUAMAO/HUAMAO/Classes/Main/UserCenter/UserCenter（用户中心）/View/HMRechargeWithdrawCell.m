//
//  HMRechargeWithdrawCell.m
//  HUAMAO
//
//  Created by  on 2017/5/22.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMRechargeWithdrawCell.h"


@interface HMRechargeWithdrawCell ()
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *amountLab;
@property (weak, nonatomic) IBOutlet UILabel *typeLab;

@end

@implementation HMRechargeWithdrawCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
}

- (void)setRechargeWithdrawModel:(HMRechargeWithdrawModel *)rechargeWithdrawModel
{
    _rechargeWithdrawModel = rechargeWithdrawModel;
    
    self.timeLab.text = rechargeWithdrawModel.addtimeStr;
    
    self.amountLab.text = rechargeWithdrawModel.money;
    
    if ([rechargeWithdrawModel.type isEqualToString:@"0"]) {
        
        self.typeLab.text = @"未支付";
    }else{
    
        self.typeLab.text = @"已付款";
    }
    

}

- (void)setDrawinModel:(HMdrawing *)drawinModel
{

    _drawinModel = drawinModel;
    
    self.timeLab.text = drawinModel.addtimestr;
    
    self.amountLab.text = drawinModel.money;
    
    if (drawinModel.status.intValue == 1 || drawinModel.status.intValue == 4) {
        
        self.typeLab.text = @"审核通过";
        
    }else if(drawinModel.status.intValue == 3 || drawinModel.status.intValue == -1){
        
        self.typeLab.text = @"审核未通过";
        
    }else if(drawinModel.status.intValue == 2){
    
    self.typeLab.text = @"提现成功";
        
    }else{
    
        self.typeLab.text = @"处理中";
    
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}

@end
