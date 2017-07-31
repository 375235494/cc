
//  HMHelpCenterVC.m
//  HUAMAO
//  Created by on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
#import "HMHelpCenterVC.h"
#import "HMHelpCenterCell.h"
#import "HMhelpDetailsVC.h"
#import "HMHelpCenteModel.h"
#import "MJExtension.h"
#import "HMServiceTool.h"
#import "NSDictionary+ObjectForKey.h"

@interface HMHelpCenterVC ()

@property (nonatomic, strong) HMHelpCenteModel *helpCenteMode;
@property(nonatomic, strong) NSMutableArray *orderListArray;

@end

static NSString * cellID = @"HMHelpCenterCell";

@implementation HMHelpCenterVC

- (instancetype)init
{
    return [self initWithStyle:UITableViewStyleGrouped];
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
    
    self.title = @"帮助中心";
    self.view.backgroundColor = HMColor(0, 0, 0);
    //设置TableView
    [self setUpTableView];
    //进入页面请求数据
    [self qureyHelpCenterDetails];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (void)viewWillAppear:(BOOL)animated
{
//    [self.tableView setFrame:CGRectMake(0, 0, HMLXScreenWidth, HMLXScreenHeight -200)];
    
//    [[[UIApplication sharedApplication] keyWindow] setBackgroundColor:[UIColor whiteColor]];
}


//设置setUpTableView
-(void)setUpTableView
{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.frame = CGRectMake(0, 0, HMLXScreenWidth, HMLXScreenHeight - 64);

    self.tableView.contentInset = UIEdgeInsetsMake(-34, 0, 0 , 0);
    
    self.tableView.showsVerticalScrollIndicator = NO;
    
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HMHelpCenterCell class]) bundle:nil] forCellReuseIdentifier:cellID];

}

#pragma mark - Tableview datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.orderListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    HMHelpCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    cell.backgroundColor = HMColor(24, 24, 24);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.helpCenteMode =self.orderListArray[indexPath.row];
    cell.helpCenteModel = self.orderListArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HMhelpDetailsVC *helpDetails = [[HMhelpDetailsVC alloc] init];
    helpDetails.helpCenteMode = self.orderListArray[indexPath.row];
    [self.navigationController pushViewController:helpDetails animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}


- (void)qureyHelpCenterDetails
{
    [MBProgressHUD showMessage:@"正在加载..."];

    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"method"] = @"getAnnouncePage";
    dic[@"type"] = @"helpcenter";
    dic[@"pageNo"] = @"0";
    dic[@"pageSize"] = @"10";
    
      __weak typeof(self) weakSelf = self;
    [HMServiceTool RequestWithDic:dic type:URLtypeAPP RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        [MBProgressHUD hideHUD];
        
        NSLog(@"responseObject:%@",responseObject);
        
         NSArray *dictArray = [responseObject DWArrayForKey:@"resultStr"];
    
        NSArray *recodeArray  = [HMHelpCenteModel mj_objectArrayWithKeyValuesArray:dictArray];
        
        [weakSelf.orderListArray addObjectsFromArray:recodeArray];
        
        [weakSelf.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
    }];
}
@end
