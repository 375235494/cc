//
//  HMGoodsShowCell.m
//  HUAMAO
//
//  Created by karl_pei on 2017/7/3.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMGoodsShowCell.h"
#import "MJExtension.h"

@interface HMGoodsShowCell ()

@property (weak, nonatomic) IBOutlet UIImageView *detailsImage;

/** 比例约束 */
@property (weak, nonatomic) NSLayoutConstraint *ratioLC;
/** 赋值比例 */
@property (nonatomic, assign) CGFloat ratio;


@end


@implementation HMGoodsShowCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   
}

- (void)setGoodsShowModel:(HMGoodsShowModel *)goodsShowModel
{
    _goodsShowModel = goodsShowModel;

     [self.detailsImage sd_setImageWithURL:[NSURL URLWithString:goodsShowModel.xqImg] placeholderImage:[UIImage imageNamed:@"Zhanwei"]];
    
    
}



@end
