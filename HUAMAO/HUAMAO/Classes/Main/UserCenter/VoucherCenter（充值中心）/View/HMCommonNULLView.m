
//  HMCommonNULLView.m
//  HUAMAO
//  Created by karl_pei on 2017/6/26.
//  Copyright © 2017年 陈臣. All rights reserved.


#import "HMCommonNULLView.h"

@implementation HMCommonNULLView

+(UIView *)setupLittleViewString:(NSString *)stringText 
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HMLXScreenWidth, HMLXScreenHeight - 184)];

     //无数据显示的占位图片
    UIImageView *imageView = [[UIImageView alloc] init];
    
    imageView.width = 110;
    imageView.height = 110;
    imageView.centerX = HMLXScreenWidth * 0.5;
    imageView.centerY = view.height * 0.1;
    
    imageView.image = [UIImage  imageNamed:@""];
    [view addSubview:imageView];
    
    
    //无数据显示的占位文字
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(imageView.frame) + 10, HMLXScreenWidth, 28)];
    title.backgroundColor = [UIColor clearColor];
    title.textColor = HMColor(200, 200, 200);
    title.textAlignment = NSTextAlignmentCenter;
    title.text = stringText;
    title.font = [UIFont systemFontOfSize:17];
    [view addSubview:title];
    
    return view;
    
}

@end
