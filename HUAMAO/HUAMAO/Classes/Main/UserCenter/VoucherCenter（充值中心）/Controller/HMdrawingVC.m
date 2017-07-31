//
//  HMdrawingVC.m
//  HUAMAO
//  Created by  on 2017/5/20.
//  Copyright © 2017年 陈臣. All rights reserved.

#import "HMdrawingVC.h"
#import "HMRechargeWithdrawCell.h"
#import "MJRefresh.h"
#import "MJExtension.h"
#import "HMRechargeWithdrawModel.h"
#import "HMReDrHederView.h"
#import "HMdrawing.h"
#import "HMServiceTool.h"
#import "NSDictionary+ObjectForKey.h"
#import "HMCommonNULLView.h"

@interface HMdrawingVC ()
<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIButton *rechargeBtn;
@property (weak, nonatomic) IBOutlet UIButton *withdrawBtn;

@property(nonatomic, strong) NSMutableArray *orderListArray;
@property(nonatomic, strong) NSMutableArray *withdrawArray;

@property(nonatomic, strong) HMRechargeWithdrawModel *rechargeWithdrawModel;
@property(nonatomic, strong) HMdrawing *drawinModel;

//@property(weak, nonatomic) HMReDrHederView *headerView;

//刷新是显示的当前页
@property (nonatomic, assign) int page;

//tableview 无数据显示占位文字
@property (nonatomic, strong) UIView *littleView;
@end

//每页显示的个数
#define EPage 10

static NSString *cellID = @"HMRechargeWithdrawCell";

@implementation HMdrawingVC

- (NSMutableArray *)withdrawArray
{
    if (!_withdrawArray) {
        _withdrawArray = [NSMutableArray array];
    }
    return _withdrawArray;
}

//懒加载
-(NSMutableArray *)orderListArray
{
    if (!_orderListArray) {
        
        _orderListArray = [NSMutableArray array];
    }
    
    return _orderListArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"充值转让记录";
    
    self.view.backgroundColor = HMColor(24, 24, 24);
    //设置hederview
//    [self setUpHeaderView];
    //设置tableView
    [self setUpTableView];
    
    //获取转让数据
    //[self setUpRefresh];
    
    [self setUpLittleView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(toRefreshDate:) name:@"quretNewDate" object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //获取转让数据
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
    
    self.littleView = [HMCommonNULLView setupLittleViewString:@"暂无转让记录"];
    self.littleView.hidden = YES;
    [self.tableView addSubview:self.littleView];
    
}

//- (void)setUpHeaderView
//{
//    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"HMReDrHederView" owner:nil options:nil] lastObject];
//    
//    self.headerView.frame = CGRectMake(0, 0, HMLXScreenWidth, 20);
//    self.headerView.backgroundColor = [UIColor clearColor];
//}

- (void)setUpTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = NO;
    
    tableView.backgroundColor = [UIColor clearColor];
    
    tableView.frame = CGRectMake(0, 124, HMLXScreenWidth, HMLXScreenHeight - 188);
    
//    tableView.tableHeaderView = self.headerView;
    
    self.tableView = tableView;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HMRechargeWithdrawCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    
    [self.view addSubview:tableView];

}


#pragma  UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.withdrawArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HMRechargeWithdrawCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    cell.drawinModel = self.withdrawArray[indexPath.row];
    
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
    dic[@"method"] = @"usercashpage";
    dic[@"openid"] = Kopenid;
    dic[@"rq"] = self.date;
    NSLog(@"%@",self.date);
    
    
    dic[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:@"sessionid"];
    
    __weak typeof(self) weakSelf = self;
    
    [HMServiceTool RequestWithDic:dic type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        NSLog(@"服务器返回数据：%@",responseObject);
        
        if([responseObject[@"flag"] integerValue] == 1 ){
            
            weakSelf.withdrawArray  = [HMdrawing mj_objectArrayWithKeyValuesArray:responseObject[@"resultStr"]];
            
            if (weakSelf.withdrawArray.count < 1) {
                
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
    dic[@"method"] = @"usercashpage";
    dic[@"openid"] = Kopenid;
    
    self.page = self.page +1;
    [dic setObject:[NSString stringWithFormat:@"%d",self.page] forKey:@"pageNo"];
    [dic setObject:[NSString stringWithFormat:@"%d",EPage] forKey:@"pageSize"];
    dic[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:@"sessionid"];
    
    __weak typeof(self) weakSelf = self;
    [HMServiceTool RequestWithDic:dic type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        if([responseObject[@"flag"] integerValue] == 1 ){
            
             NSArray *dictArray = [responseObject DWArrayForKey:@"resultStr"];
            
            NSArray *recodeArray  = [HMRechargeWithdrawModel mj_objectArrayWithKeyValuesArray:dictArray];
         
            [weakSelf.withdrawArray addObjectsFromArray:recodeArray];
            
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
- (void)dealloc
{

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
