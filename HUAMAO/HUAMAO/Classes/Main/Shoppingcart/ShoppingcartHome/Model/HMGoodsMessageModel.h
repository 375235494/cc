//
//  HMGoodsMessageModel.h
//  HUAMAO
//
//  Created by karl_pei on 2017/7/5.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <Foundation/Foundation.h>


//orderReq{}
@interface HMGoodsMessageModel : NSObject
//商品价格
@property(copy, nonatomic)NSString *shopprice;
//购买数量
@property(copy, nonatomic)NSString *shopnumber;
//商品总价
@property(copy, nonatomic)NSString *shopzonggong;
//订单Id
@property(copy, nonatomic)NSString *ID;


@end
