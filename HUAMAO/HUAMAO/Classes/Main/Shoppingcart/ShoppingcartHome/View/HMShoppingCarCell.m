//
//  HMShoppingCarCell.m
//  HUAMAO
//
//  Created by karl_pei on 2017/7/5.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMShoppingCarCell.h"
#import "HMGoodsMessageModel.h"
#import "MJExtension.h"


@interface HMShoppingCarCell ()
//图片
@property (weak, nonatomic) IBOutlet UIImageView *goodImage;
//商品名称
@property (weak, nonatomic) IBOutlet UILabel *goodsName;
//商品价格
@property (weak, nonatomic) IBOutlet UILabel *goodsPrice;
//7天退货
@property (weak, nonatomic) IBOutlet UILabel *signTitle;
//购买数量
@property (weak, nonatomic) IBOutlet UILabel *buyNumber;
//配送方式
@property (weak, nonatomic) IBOutlet UILabel *methon;
//取消订单
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
//再看看
@property (weak, nonatomic) IBOutlet UIButton *continueBtn;

//是否选中
//@property (weak, nonatomic) IBOutlet UIImageView *isSure;
@property (weak, nonatomic) IBOutlet UIButton *isSureBtn;


@end


@implementation HMShoppingCarCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.signTitle.text = @"七天退换";
    self.signTitle.layer.borderWidth = 1;
    self.signTitle.layer.borderColor = [UIColor redColor].CGColor;
    self.signTitle.layer.cornerRadius = 3;
    self.signTitle.layer.masksToBounds = YES;
    
    self.methon.text = @"配送方式：快递全国包邮";
    

    
}


-(void)setShoppingCarModel:(HMShoppingCarModel *)shoppingCarModel
{
    _shoppingCarModel = shoppingCarModel;
    
    [self.goodImage sd_setImageWithURL:[NSURL URLWithString:shoppingCarModel.commodity.cimg] placeholderImage:[UIImage imageNamed:@"Zhanwei"]];
    
//    self.goodImage.layer.borderColor = HMColor(50, 50, 50).CGColor;
//    self.goodImage.layer.borderWidth = 1;
    
    self.goodsName.text = shoppingCarModel.commodity.cname;
    
    self.buyNumber.text = [NSString stringWithFormat:@"购买数量:%@ x%@",shoppingCarModel.commodity.cname,shoppingCarModel.orderReq.shopnumber ];

    self.goodsPrice.text = [NSString stringWithFormat:@"%@",shoppingCarModel.orderReq.shopprice];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}
//取消订单
- (IBAction)cancelBtnClick {

    if ([self.delegate respondsToSelector:@selector(deleteOrder_on:)]) {
        [self.delegate deleteOrder_on:_shoppingCarModel.orderReq.ID];
    }

}


@end
