//
//  HMShoppingPrice.m
//  HUAMAO
//
//  Created by karl_pei on 2017/7/7.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMShoppingPrice.h"

@implementation HMShoppingPrice

+(UIView *)setupLittleViewString:(NSString *)stringText
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, HMLXScreenHeight - 86, 150, 30)];
    
    //无数据显示的占位文字
    UILabel *title = [[UILabel alloc] init];
    title.frame = view.bounds;
    
    title.backgroundColor = [UIColor clearColor];
    title.textColor = HMColor(200, 200, 200);
    title.textAlignment = NSTextAlignmentCenter;
    title.text = stringText;
    title.font = [UIFont systemFontOfSize:17];
    
    [view addSubview:title];
    
    return view;
    
}

@end
