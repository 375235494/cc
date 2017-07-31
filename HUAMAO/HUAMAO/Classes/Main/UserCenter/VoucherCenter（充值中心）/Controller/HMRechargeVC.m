
//  HMRechargeVC.m
//  HUAMAO
//  Created by  on 2017/5/20.
//  Copyright © 2017年 陈臣. All rights reserved.

#import "HMRechargeVC.h"
#import "HMRechargeWithdrawCell.h"
#import "MJRefresh.h"
#import "MJExtension.h"
#import "HMRechargeWithdrawModel.h"
#import "HMReDrHederView.h"
#import "HMServiceTool.h"
#import "NSDictionary+ObjectForKey.h"
#import "HMCommonNULLView.h"


@interface HMRechargeVC ()<UITableViewDataSource,UITableViewDelegate>//,HMVoucherCenterVCDelegate

@property (weak, nonatomic) UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIButton *rechargeBtn;
@property (weak, nonatomic) IBOutlet UIButton *withdrawBtn;

@property(nonatomic, strong) NSMutableArray *rechargeArray;

@property(nonatomic, strong) HMRechargeWithdrawModel *rechargeWithdrawModel;

//@property(weak, nonatomic) HMReDrHederView *headerView;

//tableview 无数据显示占位文字
@property (nonatomic, strong) UIView *littleView;

//刷新是显示的当前页
@property (nonatomic, assign) int page;

@end

#define KCurrentPage 0
#define EPage 10

static NSString *cellID = @"HMRechargeWithdrawCell";

@implementation HMRechargeVC

//懒加载
-(NSMutableArray *)rechargeArray
{
    if (!_rechargeArray) {
        
        _rechargeArray = [NSMutableArray array];
    }
    return _rechargeArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = HMColor(24, 24, 24);

    //设置tableView
    [self setUpTableView];
    
    
    [self setUpLittleView];
    
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toRefreshDate:) name:@"quretNewDate" object:nil];
    
    

}

- (void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
    #pragma mark 进入刷新状态
    //获取充值数据
    [self setUpRefresh];
    [self.tableView.mj_header beginRefreshing];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


-(void)setUpLittleView
{
  
    self.littleView = [HMCommonNULLView setupLittleViewString:@"暂无充值记录"];
    self.littleView.hidden = YES;
    [self.tableView addSubview:self.littleView];
    
}

-(void)setUpTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = NO;
    
    tableView.backgroundColor = [UIColor clearColor];

    tableView.frame = CGRectMake(0, 124, HMLXScreenWidth, HMLXScreenHeight - 188);
    
    self.tableView = tableView;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HMRechargeWithdrawCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    
    [self.view addSubview:tableView];
    
   
    
}
#pragma  UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rechargeArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HMRechargeWithdrawCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.rechargeWithdrawModel = self.rechargeArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)setUpRefresh
{
    //添加底部的刷新控件
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreRecode)];
    
    self.tableView.mj_footer.tintColor = HMColor(155, 151, 180);
    
    //添加头部的下拉刷行的控件
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewRecode)];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    
    self.tableView.mj_header.tintColor = HMColor(155, 151, 180);
    
}


//获得当前日期
- (void)toRefreshDate:(NSNotification *)date
{
    NSDictionary *userDict = date.userInfo;
    
    self.date = userDict[@"data"];
    
    [self setUpRefresh];
    
    [self.tableView.mj_header beginRefreshing];

}
//顶部刷新
-(void)loadNewRecode
{
    self.page = 0;
    
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    dic[@"method"] = @"userpaypage";
    dic[@"openid"] = Kopenid;
//    dic[@"pageNo"] = @"0";
//    dic[@"pageSize"] = @"5";
    dic[@"rq"] = self.date;
    
    NSLog(@"%@",self.date);
    
    dic[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:@"sessionid"];
    
    __weak typeof(self) weakSelf = self;

    [HMServiceTool RequestWithDic:dic type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
     NSLog(@"系统返回：%@",responseObject);
        if([responseObject[@"flag"] integerValue] == 1 ){
            //转模型
            weakSelf.rechargeArray  = [HMRechargeWithdrawModel mj_objectArrayWithKeyValuesArray:responseObject[@"resultStr"]];
            
            if (weakSelf.rechargeArray.count < 1) {
                
                  self.littleView.hidden = NO;
                
            } else {
                self.littleView.hidden = YES;
                [self.tableView setBackgroundColor:[UIColor clearColor]];
                
            }
           
            //刷新数据
            [weakSelf.tableView reloadData];
            //结束刷新
            [weakSelf.tableView.mj_header endRefreshing];
            
        }else{
            
            [weakSelf.tableView.mj_header endRefreshing];
            [MBProgressHUD showError:responseObject[@"mess"]];
        }
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        [weakSelf.tableView.mj_header endRefreshing];
        [MBProgressHUD showError:@"网络错误，请稍后重试"];
        
    }];
    
}

//添加底部的刷新
-(void)loadMoreRecode
{
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    dic[@"method"] = @"userpaypage";
    dic[@"openid"] = Kopenid;
    
    self.page = self.page +1;
    
    [dic setObject:[NSString stringWithFormat:@"%d",self.page] forKey:@"pageNo"];
    
    [dic setObject:[NSString stringWithFormat:@"%d",EPage] forKey:@"pageSize"];
    
    dic[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:@"sessionid"];
    
    __weak typeof(self) weakSelf = self;
    [HMServiceTool RequestWithDic:dic type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        NSLog(@"系统返回：%@",responseObject);
        
        if([responseObject[@"flag"] integerValue] == 1 ){
            
            NSArray *dictArray = [responseObject DWArrayForKey:@"resultStr"];

            NSArray *recodeArray  = [HMRechargeWithdrawModel mj_objectArrayWithKeyValuesArray:dictArray];

            [weakSelf.rechargeArray addObjectsFromArray:recodeArray];

        
            if (dictArray.count < 1) {
                [MBProgressHUD showSuccess:@"到底啦"];
                self.page --;
            }
            
            //刷新数据
            [weakSelf.tableView reloadData];
            //结束刷新
            [weakSelf.tableView.mj_footer endRefreshing];
            
        }else{
            
            [weakSelf.tableView.mj_footer endRefreshing];
            [MBProgressHUD showError:responseObject[@"mess"]];
        }
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        [weakSelf.tableView.mj_footer endRefreshing];
        [MBProgressHUD showError:@"网络错误，请稍后重试"];
        
    }];
}

-(void)dealloc{

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

