//
//  HMRWithdrawModel.h
//  HUAMAO
//
//  Created by 裴小康 on 2017/6/2.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMRWithdrawModel : NSObject
//时间
@property(copy, nonatomic)NSString *addtimeStr;
//金额
@property(copy, nonatomic)NSString *money;
//状态 (0:未支付)
@property(copy, nonatomic)NSString *type;
@end
