//
//  HMMainTabBarVC.m
//  HUAMAO
//
//  Created by 孙密 on 17/5/17.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMMainTabBarVC.h"

#import "HMInvitationHomeVC.h"

#import "HMShoppingMallHomeVC.h"

#import "HMTranSactionHomeVC.h"

#import "HMUserCenterHomeVC.h"

#import "HMMainNavVC.h"

#import "HMInvitationHomePlusVC.h"

#import "HMInvitationHomeIphone5VC.h"

#import "HMShoppingCartVC.h"

//#import "HMShoppingCarVC.h"

@interface HMMainTabBarVC ()

@end

@implementation HMMainTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [UITabBar appearance].translucent = NO;
    [[UITabBar appearance] setBarTintColor:[UIColor blackColor]];
    [self creatControl];
    
    if([[[NSUserDefaults standardUserDefaults] objectForKey:@"DongJie"] integerValue] == 1){
        
        UIImageView * imageV = [[UIImageView alloc]initWithFrame: CGRectMake(HMLXScreenWidth/4, 4, HMLXScreenWidth/4, 44)];
        
        imageV.image = [UIImage imageNamed:@"金豆"];
        
        imageV.contentMode = UIViewContentModeCenter;
        
        [self.tabBar addSubview:imageV];
        
    }
    
  
    
//    self.selectedIndex = 1;
}

-(void)creatControl
{
    
    if([[[NSUserDefaults standardUserDefaults] objectForKey:@"DongJie"] integerValue] == 1){
        
        NSArray *images =@[@"商城未选中",@"",@"购物车",@"用户中心未选中"];
        
        NSArray *Selectimages =@[@"商城选中",@"",@"购物车选中",@"用户中心选中"];
        
        NSArray *titles =@[@"商城",@"",@"购物车",@"用户中心"];
        
        HMShoppingMallHomeVC *ShoppingMallHomeVC =[[HMShoppingMallHomeVC alloc]init];
        
        HMTranSactionHomeVC*TranSactionHomeVC =[[HMTranSactionHomeVC alloc]init];
        
        
        
        HMShoppingCartVC * ShoppingCartVC = [[HMShoppingCartVC  alloc]init];
        
        
        HMUserCenterHomeVC *UserCenterHomeVC =[[HMUserCenterHomeVC alloc]init];
        
        NSArray *controls =@[ShoppingMallHomeVC,TranSactionHomeVC,ShoppingCartVC,UserCenterHomeVC];
        
        for(int i =0 ;i<titles.count;i++)
        {
            [self addChildVc:controls[i] title:titles[i] image:images[i] selectedImage:Selectimages[i]];
            
            
        }
        
    }else{
        
        NSArray *images =@[@"商城未选中",@"购物车",@"用户中心未选中"];
        
        NSArray *Selectimages =@[@"商城选中",@"购物车选中",@"用户中心选中"];
        
        NSArray *titles =@[@"商城",@"购物车",@"用户中心"];
        
        HMShoppingMallHomeVC *ShoppingMallHomeVC =[[HMShoppingMallHomeVC alloc]init];
        

        HMShoppingCartVC * ShoppingCartVC = [[HMShoppingCartVC  alloc]init];
        
        
        HMUserCenterHomeVC *UserCenterHomeVC =[[HMUserCenterHomeVC alloc]init];
        
        NSArray *controls =@[ShoppingMallHomeVC,ShoppingCartVC,UserCenterHomeVC];
        
        for(int i =0 ;i<titles.count;i++)
        {
            [self addChildVc:controls[i] title:titles[i] image:images[i] selectedImage:Selectimages[i]];
            
            
        }
        
        
    }
    

    
    
    
    
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] =[UIColor whiteColor] ;//HMUIColorFromRgb(0x333333);
    
    
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] =HMUIColorFromRgb(0xDD0B14);
    
    
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    
    
    NSMutableDictionary *attrnor = [NSMutableDictionary dictionary];
    // 设置字体
    attrnor[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    [childVc.tabBarItem setTitleTextAttributes:attrnor forState:UIControlStateNormal];
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
    HMMainNavVC *nav = [[HMMainNavVC alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
