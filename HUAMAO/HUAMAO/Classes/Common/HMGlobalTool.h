//
//  HMGlobalTool.h
//  HUAMAO
//
//  Created by 裴小康 on 2017/5/25.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HMLoadingErrorVeiw.h"
#import "HMLoadingView.h"

@interface HMGlobalTool : NSObject

/**
 *  获取网络加载进度loadingView
 */

+(HMLoadingView *)showLoadingView;

+(void)dismissLoadingVeiw;


/**
 *  获取网络加载错误的LoadingErrorView
 */

+(HMLoadingErrorVeiw *)showLoadingErrorView;

+(void)dismissLoadingErrorView;


/**
 *  获取自定义状态栏
 */
+(void)showStatuesBar;

@end
