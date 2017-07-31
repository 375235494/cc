//
//  HMHistoryDetailsModel.h
//  HUAMAO
//
//  Created by 裴小康 on 2017/5/24.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMHistoryDetailsModel : NSObject

//木头类型
@property (nonatomic, copy)NSString *name;
//开始时间明细
@property (nonatomic, copy)NSString *addtimestr;
//结束时间明细
@property (nonatomic, copy)NSString *endtimestr;
//点位明细（开始点位）
@property (nonatomic, copy)NSString *price;
//结束点位
@property (nonatomic, copy)NSString *endprice;
//winmoney
@property (nonatomic, copy)NSString *winmoney;
//下单金额
@property (nonatomic, copy)NSString *money;
//周期（返回分钟，需要转换秒）
@property (nonatomic, copy)NSString *tzq;
//购卖图标（方向）
@property (nonatomic, copy)NSString *type;

//盈亏计算方法
// endprice > price ---> resultLab 显示红色 80%
//// endprice < price ---> resultLab 显示绿色 0


@end
