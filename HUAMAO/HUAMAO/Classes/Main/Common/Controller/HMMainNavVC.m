//
//  HMMainNavVC.m
//  HUAMAO
//
//  Created by 孙密 on 17/5/17.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMMainNavVC.h"

@interface HMMainNavVC ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation HMMainNavVC

+ (void)initialize
{
    // 设置导航栏背景
    UINavigationBar *bar = [UINavigationBar appearance];
    //设置导航栏的颜色
    [UINavigationBar appearance].barTintColor = HMColor(0,0,0);
    //隐藏系统自带的返回按钮
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    //设置导航栏内容的颜色
    bar.tintColor = [UIColor whiteColor];
    //用自定义的图片设置返回按钮
    bar.backIndicatorImage = [UIImage imageNamed:@"icon_qd_tab_back"];
    bar.backIndicatorTransitionMaskImage =[UIImage imageNamed:@"icon_qd_tab_back"];
    
    // 设置导航栏中间的标题属性
    NSMutableDictionary *barAttrs = [NSMutableDictionary dictionary];
    barAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:17];
    barAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [bar setTitleTextAttributes:barAttrs];
    
    
    // 设置item的属性
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    NSMutableDictionary *itemNormalAttrs = [NSMutableDictionary dictionary];
    itemNormalAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    itemNormalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    [item setTitleTextAttributes:itemNormalAttrs forState:UIControlStateNormal];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 清空手势代理, 然后就会重新出现手势移除控制器的功能
    self.interactivePopGestureRecognizer.delegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count >0) { // 如果push进来的不是第一个控制器隐藏tabble
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

//状态栏高亮状态
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


#pragma mark - <UIGestureRecognizerDelegate>
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 如果只有一个子控制器, 就禁止掉pop手势
    if (self.childViewControllers.count == 1) return NO;
    return YES;
    return self.childViewControllers.count > 1;
}


@end
