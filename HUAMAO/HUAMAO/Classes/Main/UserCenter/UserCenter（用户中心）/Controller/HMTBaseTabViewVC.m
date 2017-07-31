//
//  HMTBaseTabViewVC.m
//  HUAMAO
//  Created by 裴小康 on 2017/5/21.
//  Copyright © 2017年 陈臣. All rights reserved.

#import "HMTBaseTabViewVC.h"
#import "HMMoreCell.h"
#import "HMMoreArrowItem.h"
#import "HMMoreItem.h"
#import "HMMoreHeaderView.h"

@interface HMTBaseTabViewVC ()
//头部视图
@property (nonatomic, weak) HMMoreHeaderView *headerView;

@end

@implementation HMTBaseTabViewVC

- (instancetype)init
{
    return [self initWithStyle:UITableViewStyleGrouped];
}

//懒加载
- (NSMutableArray *)groups
{
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpMoreHeaderView];
    
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



- (void)setUpMoreHeaderView
{
    //
    self.headerView =[[[NSBundle mainBundle] loadNibNamed:@"HMMoreHeaderView" owner:nil options:nil] lastObject];
    
    self.headerView.frame = CGRectMake(0, 0, HMLXScreenWidth, 120);
    
    self.tableView.frame = CGRectMake(0, 0, HMLXScreenWidth, HMLXScreenHeight - 64);
    
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0 , 0);
    
    [self.tableView setTableHeaderView:self.headerView];
    
    self.tableView.backgroundColor = HMColor(30, 30, 30);
    
    [self.tableView setSeparatorColor:HMColor(50, 50, 50)];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    HMGroupItem * group = self.groups[section];
    return group.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    // 1.创建cell
    HMMoreCell *cell =  [HMMoreCell cellWithTableView:tableView cellStyle:UITableViewCellStyleValue1];
    
    cell.backgroundColor = HMColor(21, 21, 21);
    
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //设置cell分割线起始位置
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    // 取模型
    // 哪一组的模型
    HMGroupItem *group = self.groups[indexPath.section];
    // 从模型数组数组中取出对应的模型
    HMMoreItem *item = group.items[indexPath.row];
    // 2.给cell传递模型，给cell的子控件赋值
    cell.item = item;
    
    return cell;
}


#pragma mark - 监听cell点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 取出模型
    HMGroupItem *group = self.groups[indexPath.section];
    
    HMMoreItem *item = group.items[indexPath.row];
    
    // 判断下有木有事情，就判断下block有没有值
    if (item.operationBlock) {
        // 执行保存的代码
        item.operationBlock(indexPath);
        return;
    }
    
    if ([item isKindOfClass:[HMMoreArrowItem class]]) {
        HMMoreArrowItem *arrowItem = (HMMoreArrowItem *)item;
        if (arrowItem.descVc) {
            // 创建目的控制器
            UIViewController *vc = [[arrowItem.descVc alloc] init];
            vc.navigationItem.title = item.title;
            // 跳转界面
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.1;
}
@end
