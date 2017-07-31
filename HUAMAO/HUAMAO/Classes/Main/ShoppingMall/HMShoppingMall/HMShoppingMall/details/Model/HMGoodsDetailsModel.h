//
//  HMGoodsDetailsModel.h
//  HUAMAO
//
//  Created by karl_pei on 2017/7/3.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMGoodsDetailsModel : NSObject
//商品图片
@property (copy, nonatomic)NSString *cimg;
//商品名称
@property (copy, nonatomic) NSString *cname;
//商品价格
@property (copy, nonatomic) NSString *newprice;
//特惠商品图标
@property (copy, nonatomic) NSString *preferentialGoodsImage;
//商品属性
@property (copy, nonatomic) NSString *csummary;
//商品上市时间
@property (copy, nonatomic) NSString *addtime;
//商品购买量
@property (copy, nonatomic) NSString *payNumber;
//商品购买量加
@property (copy, nonatomic) NSString *addBtn;
//商品购买量减
@property (copy, nonatomic) NSString *downBtn;

@end
