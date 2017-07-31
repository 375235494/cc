//
//  HMDetailModel.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/7/3.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMDetailModel.h"

@implementation HMDetailModel

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

+(instancetype)DetailModelWithDic:(NSDictionary *)dic{
    
    return [[self alloc] initWithDic:dic];
    
}

-(instancetype)initWithDic:(NSDictionary *)dic{
    
    if(self == [super init]){
        
        _cimg = dic[@"cimg"];
        
        _addtime = dic[@"addtime"];
        
        _ProceId = dic[@"ProceId"];
        
        _cname = dic[@"cname"];
        
        _newprice = dic[@"newprice"];
        
        _csummary = dic[@"csummary"];
        
        _salenumber = dic[@"salenumber"];
        
        _xqImg = dic[@"xqImg"];
        
        _surplusnumber = dic[@"surplusnumber"];
        
    }
    
    return self;
    
}


@end
