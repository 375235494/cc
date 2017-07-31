//
//  HMUserCenterVController.m
//  HUAMAO
//
//  Created by karl_pei on 2017/7/25.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMUserCenterVController.h"
#import "HMMoreHeaderView.h"
#import "HMHeaderCell.h"
#import "HMBindingBank.h"
#import "HMChangePasswordVC.h"
#import "HMVoucherCenterVC.h"
#import "HMLoginRegisteredVC.h"
#import "HMLoginNavVC.h"

@interface HMUserCenterVController ()<UITableViewDelegate,UITableViewDataSource>


@property (weak, nonatomic) UITableView *tableView;

@property(weak, nonatomic)HMMoreHeaderView *headerView;

@end



@implementation HMUserCenterVController

static NSString *cellID = @"HMHeaderCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"用户中心";
    
    [self setUpTableViewHeader];
    
    [self setUpTableView];
    
    self.view.backgroundColor = HMUIColorFromRgbAlpha(0x0a0a0a, 1);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


//重新布局分割线开始的位置
-(void)viewDidLayoutSubviews

{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

//设置tableView的头部视图
-(void)setUpTableViewHeader
{
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"HMMoreHeaderView" owner:nil options:nil] lastObject];
}

-(void)setUpTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    tableView.backgroundColor = [UIColor clearColor];
    
    tableView.tableHeaderView = self.headerView;
    
    tableView.frame = CGRectMake(0, 0, HMLXScreenWidth, HMLXScreenHeight - 64);
    
    tableView.rowHeight = 49;
    
    tableView.showsVerticalScrollIndicator = NO;
    
    self.headerView.frame = CGRectMake(0, 0, HMLXScreenWidth, 158);
    
    [self.tableView setTableHeaderView:self.headerView];
    
    self.tableView = tableView;
    
    [self.tableView setSeparatorColor:HMColor(50, 50, 50)];

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HMHeaderCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    
    
    [self.view addSubview:tableView];
    
}

#pragma  UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HMHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    cell.backgroundColor = HMUIColorFromRgbAlpha(0x131313, 1);
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.titleLab.textColor = [UIColor whiteColor];
    
    
    if (indexPath.row == 0) {
        
        cell.imageV.image = [UIImage imageNamed:@"绑定银行卡"];
        cell.titleLab.text = @"绑定银行卡";
        
        
        
    }else if (indexPath.row == 1){
        
        
        cell.imageV.image = [UIImage imageNamed:@"密码找回"];
        cell.titleLab.text = @"密码修改／找回";

        
    }else if (indexPath.row == 2){
        
        

        cell.imageV.image = [UIImage imageNamed:@"充值提现"];
        cell.titleLab.text = @"充值转让记录";
        
        
    }else if (indexPath.row == 3){
        
        cell.imageV.image = [UIImage imageNamed:@"退出图标"];
        cell.titleLab.text = @"退出";
        

    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
        HMBindingBank *vc = [[HMBindingBank alloc] init];
        
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if(indexPath.row == 1){
        
        HMChangePasswordVC * changePassword = [[HMChangePasswordVC alloc]init];
        
        [self.navigationController pushViewController:changePassword animated:YES];
        
        
        
    }else if(indexPath.row == 2){
        
        HMVoucherCenterVC *vc = [[HMVoucherCenterVC alloc] init];
        
        [self.navigationController pushViewController:vc animated:YES];


    
    }else if(indexPath.row == 3){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"是否退出登录" message:@"" delegate:self cancelButtonTitle:@"放弃" otherButtonTitles:@"退出", nil];
        [alert show];

    }
    
}


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
