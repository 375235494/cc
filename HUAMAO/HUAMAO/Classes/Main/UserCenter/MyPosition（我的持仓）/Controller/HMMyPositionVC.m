
//  HMMyPositionVC.m
//  HUAMAO
//  Created by on 2017/5/22.
//  Copyright © 2017年 陈臣. All rights reserved.


#import "HMMyPositionVC.h"
#import "HMMyPositionCell.h"
#import "MJRefresh.h"
#import "HMMyPositionModel.h"
#import "MJExtension.h"
#import "HMCommonNULLView.h"

#import "NSDictionary+ObjectForKey.h"


#define KCurrentPage 0
#define EPage 10

@interface HMMyPositionVC ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) UITableView *tableView;

@property(nonatomic, strong) HMMyPositionModel *positionModel;

//刷新是显示的当前页
@property (nonatomic, assign) int page;

@property(nonatomic, strong) NSMutableArray *detailArray;

@property (weak, nonatomic) IBOutlet UILabel *titleLab;

//tableview 无数据显示占位文字
@property (nonatomic, strong) UIView *littleView;

@end

static NSString *cellID = @"HMMyPositionCell";

@implementation HMMyPositionVC

-(NSMutableArray *)detailArray
{
    if (!_detailArray) {
        _detailArray = [NSMutableArray array];
    }
    return _detailArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"国翠商城";
    
    //设置tableView
    [self setUpTableView];
    
    //设置下拉刷新，上啦加载
    [self setUpRefresh];
    
    self.view.backgroundColor = HMColor(0, 0, 0);
    
    self.titleLab.hidden = YES;
    
    [self setUpLittleView];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView.mj_header beginRefreshing];
    
}

-(void)setUpLittleView
{
    
    self.littleView = [HMCommonNULLView setupLittleViewString:@"暂无竞猜订单"];
    self.littleView.hidden = YES;
    [self.tableView addSubview:self.littleView];
    
}



-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

-(void)setUpTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    tableView.backgroundColor = [UIColor clearColor];
    
    tableView.frame = CGRectMake(0, 154, HMLXScreenWidth, HMLXScreenHeight - 154);
    
    tableView.showsVerticalScrollIndicator = NO;
    
    self.tableView = tableView;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HMMyPositionCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    
    [self.view addSubview:tableView];
    
    
}
#pragma  UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.detailArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HMMyPositionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.positionModel = self.detailArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


-(void)setUpRefresh
{
//    //添加底部的刷新控件
//    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreRecode)];
//    
//    self.tableView.mj_footer.tintColor = HMColor(155, 151, 180);
    
    //添加头部的下拉刷行的控件
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewRecode)];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    self.tableView.mj_header.tintColor = HMColor(155, 151, 180);
}


-(void)loadNewRecode
{
    self.page = 0;
    
   NSMutableDictionary * dic = [NSMutableDictionary dictionary];
     dic[@"method"] = @"usertradeing";
     dic[@"openid"] = Kopenid;
     dic[@"pageNo"] = @"0";
     dic[@"pageSize"] = @"1000";
     dic[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:@"sessionid"];
    
    __weak typeof(self) weakSelf = self;
    [HMServiceTool  RequestWithDic:dic type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
            
        if ([responseObject[@"flag"] integerValue] == 1) {
            
             NSLog(@"我的持仓下拉：%@", responseObject[@"resultStr"]);
          
            weakSelf.detailArray  = [HMMyPositionModel mj_objectArrayWithKeyValuesArray:responseObject[@"resultStr"]];
            
            if ( weakSelf.detailArray.count < 1) {
            
                self.littleView.hidden = NO;
                
            } else {
                self.littleView.hidden = YES;
                [self.tableView setBackgroundColor:[UIColor clearColor]];
            }
            
            //刷新数据
            [weakSelf.tableView reloadData];
            //结束刷新
            [weakSelf.tableView.mj_header endRefreshing];
            
        } else {
            
            [weakSelf.tableView.mj_header endRefreshing];
            [MBProgressHUD showError:@""];
        }
     
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
       [MBProgressHUD showError:@"网络错误，请稍后重试"];
        [weakSelf.tableView.mj_header endRefreshing];
        
    }];
}



-(void)loadMoreRecode
{
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    dic[@"method"] = @"usertradeing";
    dic[@"openid"] = Kopenid;
    self.page = self.page + 1;
    
    [dic setObject:[NSString stringWithFormat:@"%d",self.page] forKey:@"pageNo"];
    
    [dic setObject:[NSString stringWithFormat:@"%d",EPage] forKey:@"pageSize"];
    
    dic[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:@"sessionid"];

     __weak typeof(self) weakSelf = self;
    [HMServiceTool RequestWithDic:dic type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        NSLog(@"我的持仓%@", responseObject);
        
        if ([responseObject[@"flag"] integerValue] == 1) {
            
            //将返回的数据转换成模型
            NSArray *dictArray = [responseObject DWArrayForKey:@"resultStr"];
           
             NSArray *recodeArray  = [HMMyPositionModel  mj_objectArrayWithKeyValuesArray:dictArray];
            
            [weakSelf.detailArray addObjectsFromArray:recodeArray];
            
            if (dictArray.count < 1) {
                
                [MBProgressHUD showSuccess:@"到底啦"];
                
                self.page --;
            }
            //刷新数据
            [weakSelf.tableView reloadData];
            
            [weakSelf.tableView.mj_footer endRefreshing];
           
        }else{
            
            [weakSelf.tableView.mj_footer endRefreshing];
            [MBProgressHUD showError:@"加载失败"];
        }
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        [weakSelf.tableView.mj_footer endRefreshing];
        [MBProgressHUD showError:@"加载失败，请检查网络重试"];
    }];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}
@end
