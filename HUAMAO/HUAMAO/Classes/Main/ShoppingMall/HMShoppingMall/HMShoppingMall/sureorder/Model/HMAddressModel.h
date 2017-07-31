
//
//  HMAddressModel.h
//  HUAMAO
//
//  Created by karl_pei on 2017/7/3.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMAddressModel : NSObject
//收件人姓名
@property(copy, nonatomic)NSString *oname;

//收件人地址
@property(copy, nonatomic)NSString *address;

//收件人电话
@property(copy, nonatomic)NSString *phone;

////购买数量
@property(nonatomic, copy)NSString *shopnumber;

//订单编号
@property(nonatomic, copy)NSString *ID;

//单个商品价格
@property(nonatomic, copy)NSString *shopprice;



//总价
@property(nonatomic, copy)NSString *shopzonggong;


@end

