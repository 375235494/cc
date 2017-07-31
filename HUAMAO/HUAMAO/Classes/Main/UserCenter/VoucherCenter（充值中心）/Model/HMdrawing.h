//
//  HMdrawing.h
//  HUAMAO
//
//  Created by  on 2017/6/6.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMdrawing : NSObject

//时间
@property(copy, nonatomic)NSString *addtimestr;
//金额
@property(copy, nonatomic)NSString *money;
//状态 (0:未支付)
@property(copy, nonatomic)NSString *type;
//状态  status == 4 || status == 1)(审核通过)
//状态  status == 3 || status == -1)(审核未通过)
//状态  status == 2)(提现成功)
//状态  status == 其它状态码 (处理中)



@property(copy, nonatomic)NSString *status;

@end
