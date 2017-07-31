//
//  HMUserCenterVC.m
//  HUAMAO
//  Created by  on 2017/5/21.
//  Copyright © 2017年 陈臣. All rights reserved.

#import "HMUserCenterVC.h"
#import "HMMoreArrowItem.h"
#import "HMGroupItem.h"
#import "HMBindingBank.h"
#import "HMMoreHeaderView.h"
#import "HMLoginRegisteredVC.h"
#import "HMServiceTool.h"
#import "HMLoginNavVC.h"
#import "HMChangePasswordVC.h"
#import "HMVoucherCenterVC.h"


@interface HMUserCenterVC ()

@end

@implementation HMUserCenterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"国翠商城";
    
    self.view.backgroundColor = HMColor(0, 0, 0);
    
    // 添加第0组
    [self setUpGroup1];
    // 添加第1组
//    [self setUpGroup2];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

- (void)viewWillDisappear:(BOOL)animated {

    
}

- (void)setUpGroup1
{
    HMMoreArrowItem *tellItem = [HMMoreArrowItem itemWithImage:[UIImage imageNamed:@"绑定银行卡"] title:@"绑定银行卡" detailTitle:@""];
    
    tellItem.operationBlock = ^{
        
        
        HMBindingBank *vc = [[HMBindingBank alloc] init];
        
        [self.navigationController pushViewController:vc animated:YES];
    };
    
    
    HMMoreArrowItem * VoucherItem= [HMMoreArrowItem itemWithImage:[UIImage imageNamed:@"充值提现"] title:@"充值转让记录" detailTitle:@""];
    
    VoucherItem.operationBlock = ^{
        
        
        HMVoucherCenterVC *vc = [[HMVoucherCenterVC alloc] init];
        
        [self.navigationController pushViewController:vc animated:YES];
    };

    
    //密码修改/找回
    HMMoreArrowItem *passwordeItem = [HMMoreArrowItem itemWithImage:[UIImage imageNamed:@"密码找回"] title:@"密码修改／找回" detailTitle:@""];
    
    passwordeItem.operationBlock = ^{
        
        HMChangePasswordVC * changePassword = [[HMChangePasswordVC alloc]init];
        
        [self.navigationController pushViewController:changePassword animated:YES];
        
    };
    
      //  退出
        HMMoreArrowItem *logOutItem = [HMMoreArrowItem itemWithImage:[UIImage imageNamed:@"退出图标"] title:@"退出" detailTitle:@""];
            logOutItem.operationBlock = ^{
    
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"是否退出登录" message:@"" delegate:self cancelButtonTitle:@"放弃" otherButtonTitles:@"退出", nil];
                [alert show];
    
            };

    
    NSArray *items = @[tellItem,passwordeItem,VoucherItem,logOutItem];
    
    // 创建组模型
    HMGroupItem *group = [HMGroupItem groupWithItems:items];
    // 添加到group总数组
    [self.groups addObject:group];
    
};


// 添加第2组
//- (void)setUpGroup2
//{

//        NSArray *items = @[logOut];
//        // 创建组模型
//        HMGroupItem *group = [HMGroupItem groupWithItems:items];
//        // 添加到group总数组
//        [self.groups addObject:group];
//    
//
//}


//退出登录
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {//确认退出
        NSMutableDictionary * parmas = [NSMutableDictionary dictionary];
        
        parmas[@"method"] = @"logout";
        parmas[@"openid"] = Kopenid;
        parmas[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:@"sessionid"];
        
        [HMServiceTool RequestWithDic:parmas type:URLtypeUSER RequestType:(RequesttypeGet) success:^(NSURLSessionDataTask *operation, id responseObject) {
            
            NSLog(@"%@",responseObject);
            
            if([responseObject[@"flag"] integerValue] == 1 ){
                
                //删除本地存储的设备令牌
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"openid"];
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"sessionid"];
                
                [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"RememberPassword"];
                
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"PassWord"];
                
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"PhoneNumber"];
 
                UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
                //push到登录控制器
                HMLoginRegisteredVC * rootloginVC = [[HMLoginRegisteredVC alloc]init];
                
                HMLoginNavVC *Navlogin = [[HMLoginNavVC alloc]initWithRootViewController:rootloginVC];
                
                 window.rootViewController = Navlogin;
                

            }else{
                
                [MBProgressHUD showSuccess:@"退出失败，请稍后重试"];
            }
            
        } failure:^(NSURLSessionDataTask *operation, NSError *error) {
            
            [MBProgressHUD showError:@"网络错误，请稍后重试"];
        }];
    
    }else{// 放弃
    
    }
}

@end
