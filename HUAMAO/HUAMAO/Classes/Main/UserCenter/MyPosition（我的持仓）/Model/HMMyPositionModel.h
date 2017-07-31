
//  HMMyPositionModel.h
//  HUAMAO
//  Created by  on 2017/5/23.
//  Copyright © 2017年 陈臣. All rights reserved.


#import <Foundation/Foundation.h>
#import "HMMyPositionModel.h"

@interface HMMyPositionModel : NSObject

//木头类型
@property (nonatomic, copy)NSString *name;
//开始时间明细
@property (nonatomic, copy)NSString *addtimestr;
//点位明细（开始点位）
@property (nonatomic, copy)NSString *price;
//结束点位
@property (nonatomic, copy)NSString *endprice;

//盈亏
@property (nonatomic, copy)NSString *resultLab;

//周期（返回分钟，需要转换秒）
@property (nonatomic, copy)NSString *tzq;
//购卖图标
@property (nonatomic, copy)NSString *type;
//下单金额
@property (nonatomic, copy)NSString *money;

//盈亏计算方法
// endprice > price ---> resultLab 显示红色 80%
//// endprice < price ---> resultLab 显示绿色 0


@end
