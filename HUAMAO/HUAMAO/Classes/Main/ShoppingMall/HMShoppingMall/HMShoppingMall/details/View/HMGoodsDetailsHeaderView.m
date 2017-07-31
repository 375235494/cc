//
//  HMGoodsDetailsHeaderView.m
//  HUAMAO
//
//  Created by karl_pei on 2017/7/3.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMGoodsDetailsHeaderView.h"


@interface HMGoodsDetailsHeaderView ()
//商品图片
@property (weak, nonatomic) IBOutlet UIImageView *goodsImage;
//商品名称
@property (weak, nonatomic) IBOutlet UILabel *goodsName;
//商品价格
@property (weak, nonatomic) IBOutlet UILabel *goodsPrice;
//特惠商品图标
@property (weak, nonatomic) IBOutlet UILabel *preferentialGoodsLab;
//商品属性
@property (weak, nonatomic) IBOutlet UILabel *goodsAttribute;
//商品上市时间
@property (weak, nonatomic) IBOutlet UILabel *goodsListingTime;
//商品购买量
@property (weak, nonatomic) IBOutlet UILabel *payNumber;
//商品购买量加
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
//商品购买量减
@property (weak, nonatomic) IBOutlet UIButton *downBtn;

@property(assign, nonatomic )NSInteger number;

@end




@implementation HMGoodsDetailsHeaderView


- (void)awakeFromNib
{
    [super awakeFromNib];
    self.number = 1;
    
    self.preferentialGoodsLab.layer.borderWidth = 1;
    self.preferentialGoodsLab.layer.borderColor = [UIColor redColor].CGColor;
    self.preferentialGoodsLab.layer.masksToBounds = YES;
    self.preferentialGoodsLab.layer.cornerRadius = 3;
}


- (IBAction)goodsAddBtnClick {
    

   NSInteger result = self.number += 1;
    
    NSLog(@"%ld",(long)result);
    
    self.payNumber.text = [NSString stringWithFormat:@"%ld", (long)result];

    [self sendPayNumberCont];
}

- (IBAction)goodsDownBtnClick {
    
    NSInteger result = self.number -= 1;
    
    NSLog(@"%ld",(long)result);
    
    if (result < 1 ) {
        
        self.payNumber.text = @"1";
        self.number = 1;
        
    } else {
        
        self.payNumber.text = [NSString stringWithFormat:@"%ld", (long)result];
    }

    [self sendPayNumberCont];
}

-(void)sendPayNumberCont
{
    NSString *cont =[NSString stringWithFormat:@"%ld",(long)self.number];
    
    NSDictionary *userInfoDict = @{@"cont":cont};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"sendPayNumberCont" object:self userInfo:userInfoDict];

}




- (void)setDetailsModel:(HMGoodsDetailsModel *)detailsModel
{
    _detailsModel = detailsModel;
    
    [self.goodsImage sd_setImageWithURL:[NSURL URLWithString:detailsModel.cimg] placeholderImage:[UIImage imageNamed:@"Zhanwei"]];
    
    self.goodsName.text = detailsModel.cname;
    
    self.goodsPrice.text = [NSString stringWithFormat:@"%@",detailsModel.newprice];

    self.goodsAttribute.text = [NSString stringWithFormat:@"属性：%@",detailsModel.csummary];
    
     self.goodsListingTime.text = [NSString stringWithFormat:@"上市时间：%@",detailsModel.addtime];
    

    self.preferentialGoodsLab.layer.borderWidth = 1;
    self.preferentialGoodsLab.layer.borderColor = [UIColor redColor].CGColor;
    self.preferentialGoodsLab.layer.masksToBounds = YES;
    self.preferentialGoodsLab.layer.cornerRadius = 5;
    
}


@end
