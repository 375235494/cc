//
//  HMShoppingCarModel.h
//  HUAMAO
//
//  Created by karl_pei on 2017/7/5.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HMGoodsMessageModel.h"
#import "HMShoppingDetailsModel.h"

@interface HMShoppingCarModel : NSObject

//商品价格
@property (strong, nonatomic) HMGoodsMessageModel *orderReq;

@property (strong, nonatomic) HMShoppingDetailsModel *commodity;

//配送方式
@property (copy, nonatomic) NSString *methon;
//7天退货
@property (copy, nonatomic) NSString *signTitle;
//收件人电话
@property (copy, nonatomic) NSString *phone;
//收货人姓名
@property (copy, nonatomic) NSString *oname;
//收货地址
@property (copy, nonatomic) NSString *address;

@end




