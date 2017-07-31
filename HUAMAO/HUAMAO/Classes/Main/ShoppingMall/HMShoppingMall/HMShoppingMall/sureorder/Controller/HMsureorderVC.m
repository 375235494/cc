//
//  HMsureorderVC.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/7/2.
//  Copyright © 2017年 陈臣. All rights reserved.

#import "HMsureorderVC.h"
#import "HMAddAddressVC.h"
#import "HMPayforsuccessVC.h"
#import "HMGoodsMessageCell.h"
#import "HMGoodsHeaderView.h"
#import "HMSureOtherModel.h"

#import "NSDictionary+ObjectForKey.h"
#import "MJExtension.h"

@interface HMsureorderVC ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) UITableView *tableView;

@property (nonatomic, weak) HMGoodsHeaderView *headerView;
@property (weak, nonatomic) IBOutlet UIButton *payMentBtn;

@property (weak, nonatomic) IBOutlet UILabel *totleMoneyLab;

@property(nonatomic, copy)NSString *shopnumber;

@property(nonatomic, copy)NSString *messageStr;

@end


@implementation HMsureorderVC

static NSString * cellID = @"HMGoodsMessageCell";

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"确认订单";
    
    [self setUpTableViewHeader];
    
    [self setUpTableView];
    
    self.view.backgroundColor = HMColor(21, 21, 21);
    
   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sendMessageStrt:) name:@"sendMessageStrt" object:nil];
    
    self.totleMoneyLab.text =[NSString stringWithFormat:@"%@",self.addressModel.shopzonggong ];
    self.totleMoneyLab.textColor = [UIColor redColor];
    
    
}

- (void)sendMessageStrt:(NSNotification *)messageStr
{
    
    NSDictionary *userDict = messageStr.userInfo;
    
    self.messageStr = userDict[@"messageStr"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


//设置tableView的头部视图
-(void)setUpTableViewHeader
{
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"HMGoodsHeaderView" owner:nil options:nil] lastObject];
    
    self.headerView.addressMode = self.addressModel;
    
}


//设置tableview
-(void)setUpTableView
{
   
    UITableView *tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
        
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    tableView.backgroundColor = [UIColor clearColor];
    
    tableView.frame = CGRectMake(0, 64, HMLXScreenWidth,  HMLXScreenHeight - 64 - 45);
        
    tableView.tableHeaderView = self.headerView;
        
    self.tableView  = tableView;
    
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HMGoodsMessageCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    
    [self.view addSubview:tableView];
}

- (IBAction)payMentBtnClick {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"确定支付后金豆将从账户中直接扣除" message:@"" delegate:self cancelButtonTitle:@"放弃" otherButtonTitles:@"确定", nil];
    [alert show];

}

#pragma UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;

}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HMGoodsMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    cell.shopnumber = self.addressModel.shopnumber;
    cell.otherDetailsModel = self.goodsShowModel;
    cell.addressMode = self.addressModel;
    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 320;
    
}

#pragma UIAlertViewDetegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        
        [MBProgressHUD showMessage:@"正在加载..."];
        NSMutableDictionary * dic = [NSMutableDictionary dictionary];
        dic[@"method"] = @"order_zf";
        dic[@"openid"] = Kopenid;
        dic[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:@"sessionid"];
        dic[@"id"] = self.addressModel.ID;
        dic[@"content"] = self.messageStr;
        
        [HMServiceTool RequestWithDic:dic type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
            
            NSLog(@"支付：%@",responseObject);
            
            if ([responseObject[@"flag"] integerValue] == 1) {
                
                [MBProgressHUD hideHUD];
                
                
                
                HMPayforsuccessVC *VC = [[HMPayforsuccessVC alloc] init];
                
                [self.navigationController pushViewController:VC animated:YES];

                
                [MBProgressHUD showSuccess:@"支付成功"];
                
                
            }else{
                
                [MBProgressHUD hideHUD];
                [MBProgressHUD showError:responseObject[@"mess"]];
            }
            
        } failure:^(NSURLSessionDataTask *operation, NSError *error) {
            
            [MBProgressHUD hideHUD];
            [MBProgressHUD showError:@"加载失败，请检查网络重试"];
        }];
    
    }else{// 放弃
        
    }
}

-(void)dealloc
{

    [[NSNotificationCenter defaultCenter] removeObserver:self];

}
@end
