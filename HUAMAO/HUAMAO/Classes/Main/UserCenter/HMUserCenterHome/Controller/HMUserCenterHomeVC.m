//
//  HMUserCenterHomeVC.m
//  HUAMAO
//
//  Created by 孙密 on 17/5/17.
//  Copyright © 2017年 陈臣. All rights reserved.

#import "HMUserCenterHomeVC.h"
#import "HMButtonListView.h"
#import "HMABoutUsVC.h"
#import "HMFeedBackVC.h"


#import "HMServiceTool.h"
#import "HMMonyCell.h"
#import "HMHeadCell.h"
#import "HMUserMessageModel.h"
#import "HMwithdrawal.h"
#import "HMTopUp.h"
#import "HMwithdrawalModel.h"
#import "HMUserCenterVC.h"
#import "HMMyPositionVC.h"
#import "HMhistoryDetailsVC.h"
#import "HMHelpCenterVC.h"
#import "HMInvitationHomeVC.h"
#import "HMProtocolVC.h"
#import "HMVoucherCenterVC.h"
#import "HMHelpCenterController.h"
#import "HMUserCenterVController.h"


#import "HMUserHeadView.h"

#import "HMOrderCell.h"

#import "HMMyOrderVC.h"

#import "HMGoldGameVC.h"

@interface HMUserCenterHomeVC ()
<UserHeadViewDelegeat,
UITableViewDelegate,
UITableViewDataSource,
HMOrderCellDelegeat>


@property(strong,nonatomic)UITableView *tableview;

@property(strong,nonatomic)NSNumber * strmony;

@property(strong,nonatomic)HMUserMessageModel * userMessageMol;

@property(strong,nonatomic)NSNumber *mUid;


@property(strong,nonatomic)HMwithdrawalModel *withdrawal;


@property(strong,nonatomic)NSArray *aryTitle;

@property(strong,nonatomic)NSArray *aryICon;


@property(weak,nonatomic)HMUserHeadView *headView;


@property(strong,nonatomic)NSArray * sectionAry;

@end

@implementation HMUserCenterHomeVC



-(void)cellAction:(HMOrderCell *) OrderCell SelectIndex:(NSInteger)index{
    
    HMMyOrderVC * MyorderVC = [[HMMyOrderVC alloc]init];
    
    MyorderVC.SelectIndex = index;
    
    [self.navigationController pushViewController:MyorderVC animated:YES];
    
}

-(HMwithdrawalModel*)withdrawal {
    
    if(_withdrawal == nil){
        
        _withdrawal = [[HMwithdrawalModel alloc]init];
    }
    
    return _withdrawal;
    
}

-(void)withdrawalButtonAction{
    NSLog(@"tixian")
    
    HMwithdrawal * withdrawal = [[HMwithdrawal alloc]init];
    
    withdrawal.withdrawalMessage = self.withdrawal;
    
    withdrawal.mUid = self.mUid;

    withdrawal.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:withdrawal animated:YES];
}

-(void)topUUpButtonAction{
    NSLog(@"chongzhi")
    
    HMTopUp * TopUp = [[HMTopUp alloc]init];
    
    TopUp.mUid = self.mUid;
    
    
    TopUp.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:TopUp animated:YES];
}


-(HMUserMessageModel *)userMessageMol {
    
    if(_userMessageMol == nil){
        
        _userMessageMol = [[HMUserMessageModel alloc]init];

    }
    
    return _userMessageMol;

}

-(void)LinstActionIndex:(NSInteger)index{
        switch (index) {
            case 100:{
                HMUserCenterVController *userCenterVC = [[HMUserCenterVController alloc]init];
                
                [self.navigationController pushViewController:userCenterVC animated:YES];
            }
                break;
            case 101:{
                HMMyPositionVC *myPositionVC = [[HMMyPositionVC alloc]init];
                [self.navigationController pushViewController:myPositionVC animated:YES];
            }

                break;
            case 102:{

                HMhistoryDetailsVC *historyDetailsVC = [[HMhistoryDetailsVC alloc]init];
                [self.navigationController pushViewController:historyDetailsVC animated:YES];
            }
                
                break;
            case 103:{
                
                self.tabBarController.selectedIndex = 2;
            }
                
                break;
            case 104:{
                HMProtocolVC *protocolVC = [[HMProtocolVC alloc]init];
    
                [self.navigationController pushViewController:protocolVC animated:YES];
            }
                
                break;
            case 105:{

                HMHelpCenterController *helpCenterVC = [[HMHelpCenterController alloc]init];
                [self.navigationController pushViewController:helpCenterVC animated:YES];
            }
                
                break;
            case 106:{
                
                HMVoucherCenterVC *voucherCenterVC = [[HMVoucherCenterVC alloc]init];
                [self.navigationController pushViewController:voucherCenterVC animated:YES];
            }
                
                break;
            case 107:{
                HMFeedBackVC *FeedBackVC = [[HMFeedBackVC alloc]init];
                
                [self.navigationController pushViewController:FeedBackVC animated:YES];
            }
                
                break;
            case 108:{
                HMABoutUsVC *AboutUsVC = [[HMABoutUsVC alloc]init];
                [self.navigationController pushViewController:AboutUsVC animated:YES];
            }
                break;

            default:
                break;
        }
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.view.backgroundColor = HMUIColorFromRgbAlpha(0x0b0b0b , 1);
    
    _aryICon = @[@[@"账户中心",@"商品收藏"],@[@"金豆活动"],@[@"客服",@"帮助中心",@"投诉建议",@"关于"]];
    

    _aryTitle = @[@[@"账号管理",@"商品收藏"],@[@"金豆活动"],@[@"客服中心",@"帮助中心",@"投诉和反馈",@"关于国翠"]];;

    
    _sectionAry = @[@"我的订单",@"个人管理",@"热门活动",@"用户服务"];
    
    self.navigationController.navigationBar.hidden = YES;
    
    [self.view addSubview:self.tableview];
    
    
    HMUserHeadView *headView = [HMUserHeadView UserHeadView];
    
    
    headView.Delegeat =self;
    
    headView.height = [HMUserHeadView UserHeadViewHeigth];
    
    
    _headView = headView;
    
    self.tableview.tableHeaderView = headView;
    
    self.tableview.y  = -20;
    
    self.tableview.height = self.tableview.height - 44 +20;
    
   
    

}
//view即将显示时隐藏nav
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = YES;
  
    [self GetsouceAndRefresh];
}
//view即将显示时显示nav
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;

}


-(void)GetsouceAndRefresh{
    
    NSMutableDictionary *getuserinfoDic = [[NSMutableDictionary alloc]init];

    getuserinfoDic[@"method"] = @"getuserinfo";

    getuserinfoDic[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:HMSESSIONId];

    getuserinfoDic[@"openid"] = [[NSUserDefaults standardUserDefaults]objectForKey:OPENId];

    
    
    NSMutableDictionary *dicusertradeing = [[NSMutableDictionary alloc]init];

    dicusertradeing[@"method"] = @"usertradeing";

    dicusertradeing[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:HMSESSIONId];

    dicusertradeing[@"openid"] = [[NSUserDefaults standardUserDefaults]objectForKey:OPENId];

    dicusertradeing[@"pageNo"] = @0;

    dicusertradeing[@"pageSize"] = @100;
    
    
    
    [self getMessagedFormURLWithgetuserinfo:getuserinfoDic AndusertradeingDic:dicusertradeing];

}


-(void)getMessagedFormURLWithgetuserinfo:(NSDictionary *)getuserinfoDic AndusertradeingDic:(NSDictionary *)dicusertradeing{
    
//    [MBProgressHUD showMessage:@"正在加载..."];

    [HMServiceTool RequestWithDic:getuserinfoDic type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        NSLog(@"系统返回%@",responseObject);

        
        self.withdrawal.dicsouce = responseObject[@"resultStr"];
        
        self.userMessageMol.messageSouce = responseObject[@"resultStr"];
        
        self.strmony = responseObject[@"resultStr"][@"account"];
        
        self.mUid = responseObject[@"resultStr"][@"id"];
        

        
        self.headView.usermessageMol = self.userMessageMol;
//        [HMServiceTool RequestWithDic:dicusertradeing type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
//            
//            NSLog(@"%@",responseObject);
//
//            self.userMessageMol.tradingSouce = responseObject;
//    
//            
//        } failure:^(NSURLSessionDataTask *operation, NSError *error) {
//            
////            [MBProgressHUD hideHUD];
//            
//            [MBProgressHUD showError:@"服务器未连接"];
//            
//        }];
        
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
         NSLog(@"%@",error);
        
//        [MBProgressHUD hideHUD];

        [MBProgressHUD showError:@"服务器未连接"];
        
    }];

}

-(void)setStrmony:(NSNumber *)strmony{
    
    _strmony = strmony;
    
    self.headView.money = [NSString stringWithFormat:@"%.f",strmony.floatValue];
}

-(UITableView *)tableview {
    
    if(_tableview ==nil){
        
        _tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _tableview.backgroundColor = HMUIColorFromRgb(0x0b0b0b);
        
        _tableview.dataSource = self;
        
        _tableview.delegate = self;
        
        // 设置隐藏分割线
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        // 设置隐藏垂直的滚动条
        _tableview.showsVerticalScrollIndicator = NO;
        
        _tableview.backgroundColor = [UIColor clearColor];
        
        _tableview.bounces = NO;

    }
    return _tableview;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.aryTitle.count + 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    
    if(section == 0) return 1;
    
    else  return [self.aryTitle[section - 1] count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 0) {
        
        HMOrderCell * OrderCell = [[[NSBundle mainBundle] loadNibNamed:@"HMOrderCell" owner:self options:nil] lastObject];
        
        OrderCell.Delegeat = self;
        
        return OrderCell;
        }

    else{
    
        UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"PeppelCell"];

        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.backgroundColor = HMUIColorFromRgbAlpha(0x1e1e1e,1);
        
        cell.textLabel.text = self.aryTitle[indexPath.section - 1 ][indexPath.row];
        
        cell.textLabel.font = [UIFont systemFontOfSize:12];
        
        cell.textLabel.textColor = HMUIColorFromRgbAlpha(0xadaeae,1);
        
        cell.imageView.image = [UIImage imageNamed:self.aryICon[indexPath.section - 1][indexPath.row]];

        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        
        UIView *viewLine = [[UIView alloc]initWithFrame:CGRectMake(8, 40-1, self.view.width - 16, 1)];
        
        viewLine.backgroundColor = HMUIColorFromRgbAlpha(0x0b0b0b,1);//0b0b0b[UIColor blackColor];
        
        [cell addSubview:viewLine];
     
        return cell;
        
    }
 
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 0) return 60;
    
    return 40;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 1){
        
        switch (indexPath.row) {
            case 0:{
                
                HMUserCenterVController *userCenterVC = [[HMUserCenterVController alloc]init];
                
                [self.navigationController pushViewController:userCenterVC animated:YES];
            }
                break;
            case 1:{
                
               
            }
                
                break;
//            case 2:{
//                
//                HMVoucherCenterVC *voucherCenterVC = [[HMVoucherCenterVC alloc]init];
//                [self.navigationController pushViewController:voucherCenterVC animated:YES];
//                
//
//            }
//                break;
//
//            case 3:{
//                
//                HMhistoryDetailsVC *historyDetailsVC = [[HMhistoryDetailsVC alloc]init];
//                [self.navigationController pushViewController:historyDetailsVC animated:YES];
//            }
//                
//                break;
//       
                
            default:
                break;
        }
        
    }
    
        
        
        if(indexPath.section == 2){
            
            HMGoldGameVC *goldGameVC = [[HMGoldGameVC alloc] init];
            [self.navigationController pushViewController:goldGameVC animated:YES];
            
        }
        
        if(indexPath.section == 3){
            
            
            switch (indexPath.row) {
                    
                case 0:{
                    HMProtocolVC *protocolVC = [[HMProtocolVC alloc]init];
                    
                    [self.navigationController pushViewController:protocolVC animated:YES];
                }
                    break;
                case 1:{
                    HMHelpCenterController *helpCenterVC = [[HMHelpCenterController alloc]init];
                    [self.navigationController pushViewController:helpCenterVC animated:YES];
                }
                    
                    break;
                case 2:{
                    
                    HMFeedBackVC *FeedBackVC = [[HMFeedBackVC alloc]init];
                    
                    [self.navigationController pushViewController:FeedBackVC animated:YES];
                }
                     break;
                    
                case 3:{
                    
                    HMABoutUsVC *AboutUsVC = [[HMABoutUsVC alloc]init];
                    [self.navigationController pushViewController:AboutUsVC animated:YES];
                }
                    
                    break;
                    
                default:
                    break;
            }
    
        }

}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 13;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]init];
    
    view.backgroundColor = [UIColor blackColor];
  
        
        
    UILabel *lable = [[UILabel alloc]init];
    
//    lable.text = _sectionAry[section];
    
    lable.textColor = HMUIColorFromRgbAlpha(0xadaeae,1);
    
    
    lable.font = [UIFont systemFontOfSize:12];
    
    
    lable.frame = CGRectMake(5, 0, 200, 13);
    
    [view addSubview:lable];

    return view;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}



@end
