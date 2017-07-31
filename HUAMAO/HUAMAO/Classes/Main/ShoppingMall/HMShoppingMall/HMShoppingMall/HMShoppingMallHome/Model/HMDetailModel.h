//
//  HMDetailModel.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/7/3.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMDetailModel : NSObject

//cimg = http://hmyhimg.autopiao.com/shop_img/cyq_mph.png,
//addtime = 2017-06-28 11:03:15,
//id = 2,
//oldprice = 8888.879999999999,
//cname = 名片盒,
//newprice = 7888.66,
//csummary = 名片盒名片座名片架摆件名片夹酸枝创意实木收纳红木大红办公桌面,
//salenumber = 852,
//xqImg = http://hmyhimg.autopiao.com/shop_img/cyq_mph_xq.png,
//surplusnumber = 9611


@property(copy,nonatomic)NSString *cimg;

@property(copy,nonatomic)NSString * addtime;

@property(strong,nonatomic)NSNumber * ProceId;

@property(strong,nonatomic)NSNumber * oldprice;

@property(copy,nonatomic)NSString * cname;

@property(strong,nonatomic)NSNumber * newprice;

@property(copy,nonatomic)NSNumber * csummary;

@property(strong,nonatomic)NSString * salenumber;

@property(copy,nonatomic)NSString * xqImg;

@property(strong,nonatomic)NSNumber *surplusnumber;


+(instancetype)DetailModelWithDic:(NSDictionary *)dic;

@end
