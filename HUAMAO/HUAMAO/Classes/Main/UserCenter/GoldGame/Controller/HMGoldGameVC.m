//
//  HMGoldGameVC.m
//  HUAMAO
//
//  Created by karl_pei on 2017/7/7.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMGoldGameVC.h"
#import "HMGoldGameCell.h"
#import "HMGoldGameHeaderView.h"
#import "HMMyPositionVC.h"
#import "HMhistoryDetailsVC.h"
#import "HMActivityRulesVC.h"
#import "HMPayIntroduceVC.h"
#import "HMPlayDetailsVC.h"
#import "HMplayVC.h"


@interface HMGoldGameVC ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) UITableView *tableView;
@property(weak, nonatomic)HMGoldGameHeaderView *headerView;

@end

@implementation HMGoldGameVC

static NSString *cellID = @"HMGoldGameCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"国翠商城";
    
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
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"HMGoldGameHeaderView" owner:nil options:nil] lastObject];
}

-(void)setUpTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    self.tableView.estimatedRowHeight = 60;
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    tableView.backgroundColor = [UIColor clearColor];
    
     tableView.tableHeaderView = self.headerView;
    
    tableView.frame = CGRectMake(0, 0, HMLXScreenWidth, HMLXScreenHeight - 64);
    
    tableView.rowHeight = 49;
    
    tableView.showsVerticalScrollIndicator = NO;
    
    self.tableView = tableView;
    
    self.headerView.frame = CGRectMake(0, 0, HMLXScreenWidth, 76);
    [self.tableView setTableHeaderView:self.headerView];
    

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HMGoldGameCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    
    
    [self.view addSubview:tableView];
    
}

#pragma  UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HMGoldGameCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    cell.backgroundColor = HMUIColorFromRgbAlpha(0x131313, 1);
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    if (indexPath.row == 0) {
        
        cell.titleLab.text = @"当前竞猜";
        
    }else if (indexPath.row == 1){
    
        cell.titleLab.text = @"竞猜记录";
    
    }else if (indexPath.row == 2){
        
        cell.titleLab.text = @"活动规则";

    }else if (indexPath.row == 3){
        
        cell.titleLab.text = @"玩法介绍";

    }
    
   
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
        HMMyPositionVC *myPositionVC = [[HMMyPositionVC alloc]init];
        [self.navigationController pushViewController:myPositionVC animated:YES];
        
    }else if(indexPath.row == 1){
    
        HMhistoryDetailsVC *historyDetailsVC = [[HMhistoryDetailsVC alloc]init];
        [self.navigationController pushViewController:historyDetailsVC animated:YES];
    
    }else if(indexPath.row == 2){
        
       
        HMPlayDetailsVC *activityRulesVC = [[HMPlayDetailsVC alloc]init];
        [self.navigationController pushViewController:activityRulesVC animated:YES];
        
    }else if(indexPath.row == 3){
        
        HMplayVC *payVC = [[HMplayVC alloc] init];
        
        [self.navigationController pushViewController:payVC animated:YES];
        
    }

}
@end
