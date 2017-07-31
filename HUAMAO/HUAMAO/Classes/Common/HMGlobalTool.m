//
//  HMGlobalTool.m
//  HUAMAO
//
//  Created by 裴小康 on 2017/5/25.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMGlobalTool.h"

static  UIWindow *hud = nil;
static  HMLoadingView *loadingView  = nil;
static  HMLoadingErrorVeiw *errorView = nil;

@implementation HMGlobalTool

/**
 *  获取网络加载进度loadingView
 */

+(HMLoadingView *)showLoadingView
{
    if (!loadingView) {
        
        HMLoadingView *lView  =  [[HMLoadingView alloc] init];
        lView.backgroundColor = HMColor(31, 31, 31);
        
        lView.frame = [UIScreen mainScreen].bounds;
        
        loadingView = lView;
    }else{
        
        [loadingView loadingAnimation];
        
    }
    
    return loadingView;
    
}

+(void)dismissLoadingVeiw
{
    if (loadingView) {
        
        [loadingView removeFromSuperview];
        
    }
    
}

//懒加载
+(HMLoadingErrorVeiw *)showLoadingErrorView
{

    
   HMLoadingErrorVeiw *eView = [[HMLoadingErrorVeiw alloc] init];
    eView.frame = [UIScreen mainScreen].bounds;
    errorView = eView;
    
    return errorView;
}


+(void)dismissLoadingErrorView
{
    if (errorView) {
        
        [errorView removeFromSuperview];
    }
    
    
}

+(void)showStatuesBar
{    // 创建hud
    hud = [[UIWindow alloc] init];
    hud.backgroundColor = [UIColor blackColor];
    
    // 要想让时间 不挡住当前文件，设置窗口级别属性
    hud.windowLevel = UIWindowLevelNormal ;
    
    // 设置尺寸
    hud.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20);
    
    // 显示hud
    hud.hidden = NO;
    
}



@end
