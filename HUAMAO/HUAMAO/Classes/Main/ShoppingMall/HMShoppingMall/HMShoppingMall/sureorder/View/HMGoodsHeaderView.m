
//
//  HMGoodsHeaderView.m
//  HUAMAO
//
//  Created by karl_pei on 2017/7/3.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMGoodsHeaderView.h"

@interface HMGoodsHeaderView ()
//收件人姓名
@property (weak, nonatomic) IBOutlet UILabel *userName;
//收件人电话
@property (weak, nonatomic) IBOutlet UILabel *phone;
//收件人地址
@property (weak, nonatomic) IBOutlet UILabel *address;


@end

@implementation HMGoodsHeaderView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    
    
    
}


- (void)setAddressMode:(HMAddressModel *)addressMode
{
    _addressMode = addressMode;
    
    self.userName.text = addressMode.oname;
    
    self.phone.text = addressMode.phone;
    
    
    self.address.text = [NSString stringWithFormat:@"收货地址：%@",addressMode.address];

}

@end

