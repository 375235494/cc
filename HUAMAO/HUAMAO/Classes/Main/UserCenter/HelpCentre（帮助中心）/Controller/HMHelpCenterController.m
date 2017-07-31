
//  HMHelpCenterController.m
//  HUAMAO
//  Created by karl_pei on 2017/6/19.
//  Copyright © 2017年 陈臣. All rights reserved.

#import "HMHelpCenterController.h"
#import "Node.h"
#import "TreeTableView.h"
#import "HMHelpCenterHeaderView.h"

@interface HMHelpCenterController ()<TreeTableCellDelegate>

@property (nonatomic, weak) HMHelpCenterHeaderView *headerView;

@property (weak, nonatomic) TreeTableView *tableview;

@end

#define CellHeihgt  47

@implementation HMHelpCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"国翠商城";
    [self initData];
    self.view.backgroundColor = HMColor(0, 0, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    }

-(void)initData{
    
    //第一组
    Node *country1 = [[Node alloc] initWithParentId:-1 nodeId:0 name:@"产品介绍" depth:0 expand:YES Image:nil ColorCont:0];
    Node *province1 = [[Node alloc] initWithParentId:0 nodeId:1 name:@"国翠商城是以金乌木、黑檀木、红楠木等三大产品系列为主，是稀有和罕见的热带树木，被誉为“天材地宝“，其家具饰品摆件做工精湛、品质卓越，蕴含了东西文化的艺术精髓，彰显沉稳高贵的气质。" depth:1 expand:NO Image:nil ColorCont:4];
//    //第三组
//    Node *country3 = [[Node alloc] initWithParentId:-1 nodeId:11 name:@"常见问题" depth:0 expand:YES Image:nil ColorCont:0];
//    
//    Node *province8 = [[Node alloc] initWithParentId:11 nodeId:12 name:@"国翠商城的竞猜门槛？" depth:1 expand:NO Image:nil ColorCont:0];
//    Node *city5 = [[Node alloc] initWithParentId:12 nodeId:13 name:@"答:没有门槛，想猜就猜" depth:2 expand:NO Image:nil ColorCont:1];
    
    //    Node *province9 = [[Node alloc] initWithParentId:11 nodeId:14 name:@"交易手续费是怎样的？" depth:1 expand:NO Image:nil ColorCont:0];
    //    Node *city6 = [[Node alloc] initWithParentId:14 nodeId:15 name:@"只有您赚钱了才有手续费，若交易时，赚钱了！只收取10%的平台维护费用" depth:2 expand:NO Image:nil ColorCont:1];
    //
    //    Node *province10 = [[Node alloc] initWithParentId:11 nodeId:16 name:@"单品最大持仓数是多少？" depth:1 expand:NO Image:nil ColorCont:0];
    //    Node *city7 = [[Node alloc] initWithParentId:16 nodeId:17 name:@"没有限制，不过每下一单会有30秒的冷却时间" depth:2 expand:NO Image:nil ColorCont:1];
    
//    Node *province11 = [[Node alloc] initWithParentId:11 nodeId:18 name:@"国翠商城竞猜项目开放时间？" depth:1 expand:NO Image:nil ColorCont:0];
//    Node *city8 = [[Node alloc] initWithParentId:18 nodeId:19 name:@"答:分两个时间段;周一至周六08:00～次日03:00所有项目都可以竞猜,周日08:00～次日3:00只有某个项目可以竞猜，其它休市" depth:2 expand:NO Image:nil ColorCont:1];
    
    //    Node *province12 = [[Node alloc] initWithParentId:11 nodeId:20 name:@"客户如何建仓？" depth:1 expand:NO Image:nil ColorCont:0];
    //    Node *city9 = [[Node alloc] initWithParentId:20 nodeId:21 name:@"跟着向导页做，简单易懂易上手" depth:2 expand:NO Image:nil ColorCont:1];
    //
    //    Node *province13 = [[Node alloc] initWithParentId:11 nodeId:22 name:@"如何计算交易盈亏？" depth:1 expand:NO Image:nil ColorCont:0];
    //    Node *city10 = [[Node alloc] initWithParentId:22 nodeId:23 name:@"不用您计算，系统平台自动帮你计算盈亏，您自己也可以算" depth:2 expand:NO Image:nil ColorCont:1];
    //
    //    Node *province14 = [[Node alloc] initWithParentId:11 nodeId:24 name:@"交易下单能否过夜？" depth:1 expand:NO Image:nil ColorCont:0];
    //    Node *city11 = [[Node alloc] initWithParentId:24 nodeId:25 name:@"只要在交易时间内，自行交易。到了凌晨03:00时，平台系统自动帮您平仓" depth:2 expand:NO Image:nil ColorCont:1];
    //
    //    Node *province15 = [[Node alloc] initWithParentId:11 nodeId:26 name:@"交易是否存在爆仓？" depth:1 expand:NO Image:nil ColorCont:0];
    //    Node *city12 = [[Node alloc] initWithParentId:26 nodeId:27 name:@"不存在" depth:2 expand:NO Image:nil ColorCont:1];
    //
    //    Node *province16 = [[Node alloc] initWithParentId:11 nodeId:28 name:@"交易结算时间" depth:1 expand:NO Image:nil ColorCont:0];
    //    Node *city13 = [[Node alloc] initWithParentId:28 nodeId:29 name:@"交易结束，实时结算" depth:2 expand:NO Image:nil ColorCont:1];
    //
    //    Node *province17 = [[Node alloc] initWithParentId:11 nodeId:30 name:@"充值，转让多久能到账？收取手续费吗？" depth:1 expand:NO Image:nil ColorCont:0];
    //    Node *city14 = [[Node alloc] initWithParentId:30 nodeId:31 name:@"充值规则：入金单笔上限1W，当日最高5W（根据个发卡行银行卡限制又不同限额），入金不收取手续费。入金时间：周一至周日全天出金规则：单笔最低转让金额20豆，上无上限。单笔每笔50豆以下收取手续费5豆，5哦豆以上每笔收取手续费2豆。出金时间：周一至周五9:00～17:00？" depth:2 expand:NO Image:nil ColorCont:1];
    
    //第二组
    Node *country2 = [[Node alloc] initWithParentId:-1 nodeId:2 name:@"充值流程" depth:0 expand:YES Image:nil ColorCont:0];
    
    Node *province3 = [[Node alloc] initWithParentId:2 nodeId:3 name:@"银联支付" depth:1 expand:NO Image:nil ColorCont:0];
    Node *city1 = [[Node alloc] initWithParentId:3 nodeId:4 name:@"①点击充值按钮，跳转到充值界面，选择金额和银联支付，点击确认。\n②界面跳转到支付页面，点击认证支付，进入手机支付界面，输入卡号点击提交即可。" depth:2 expand:NO Image:[UIImage imageNamed:@""] ColorCont:4];
    
//    Node *province4 = [[Node alloc] initWithParentId:2 nodeId:5 name:@"快捷支付" depth:1 expand:NO Image:nil ColorCont:0];
//    Node *city2 = [[Node alloc] initWithParentId:5 nodeId:6 name:@"①点击充值按钮，选择充值金额和快捷支付。跳转到用户登录界面，新用户初次登陆需点击最下方立即注册。\n②点击用户注册跳转至新用户注册页面，注意区分用户名和平台用户名。\n③注册完成登录后绑定银行卡，即可充值。" depth:2 expand:NO Image:nil ColorCont:4];
    
    Node *province5 = [[Node alloc] initWithParentId:2 nodeId:7 name:@"支付宝支付" depth:1 expand:NO Image:nil ColorCont:0];
    Node *city3 = [[Node alloc] initWithParentId:7 nodeId:8 name:@"①点击充值按钮，进入充值界面。选择充值金额和支付宝支付，点击确认按钮。\n②点击确认后，弹出支付宝二维码支付界面，点击立即充值按钮。\n③点击充值按钮后，系统自动进入支付宝支付页面，输入支付密码，即可完成支付。" depth:2 expand:NO Image:nil ColorCont:4];
    
    Node *province6 = [[Node alloc] initWithParentId:2 nodeId:9 name:@"微信支付" depth:1 expand:NO Image:nil ColorCont:0];
    Node *city4 = [[Node alloc] initWithParentId:9 nodeId:10 name:@"①点击充值按钮，进入充值界面，选择充值金额和微信支付。\n②点击确认后，弹出微信二维码支付界面，手机截屏并保存图片二维码。\n③打开微信，点击右上角“+”选择扫一扫，选择从相册选取二维码。\n④选择图片二维码之后，系统自动跳转到付款页面，点击立即支付，即可完成付款。" depth:2 expand:NO Image:nil ColorCont:4];
    
    
    //    NSArray *data = [NSArray arrayWithObjects:country1,province1,country2,province6,city4,province5,city2,province4,city3,province3,city1,country3,province8,city5,province9,city6,province10,city7,province11,city8,province12,city9,province13,city10,province14,city11,province15,city12, province16,city13,province17,city14,nil];
    
    NSArray *data = [NSArray arrayWithObjects:country1,province1,country2,province3,city1,province5,city3,province6,city4,nil];
    
    //
    
    self.headerView =[[[NSBundle mainBundle] loadNibNamed:@"HMHelpCenterHeaderView" owner:nil options:nil] lastObject];
    
    self.tableview = (TreeTableView *)[[TreeTableView alloc] initWithFrame:CGRectMake(0,0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) withData:data];
    self.tableview.backgroundColor = HMColor(21, 21, 21);
    [self.tableview setSeparatorColor:HMColor(50, 50, 50)];
    self.tableview.treeTableCellDelegate = self;
    self.tableview.tableHeaderView = self.headerView;
    [self.view addSubview:self.tableview];
}

#pragma mark - TreeTableCellDelegate
-(void)cellClick:(Node *)node Code:(NSInteger)code{
    NSLog(@"%@",node.name);
    
//    if (node.name.length > 0 && code == 1 ) {
//        
//       if ([node.name isEqualToString:@"银联支付"] && (code == 1)) {
//            [self Code:2];
//            
//        }else if([node.name isEqualToString:@"快捷支付"] && (code == 1)){
//            
//            [self Code:3];
//            
//        }else if([node.name isEqualToString:@"支付宝支付"] && (code == 1)){
//            
//            [self Code:4];
//        
//        }else if([node.name isEqualToString:@"微信支付"] && (code == 1)){
//           [self Code:5];
//        }
//        
//    }else{
//        
//        [self endFream];
//        
//    }
//    
}

//- (void)Code:(NSInteger)code
//{
//
//  self.tableview.frame = CGRectMake(0, -(self.headerView.height + (code * CellHeihgt)), HMLXScreenWidth, HMLXScreenHeight+(self.headerView.height + (code * CellHeihgt)));
//    
//    self.tableview.contentInset = UIEdgeInsetsMake(-(code *CellHeihgt), 0, 0 , 0);
//}
//
//-(void)endFream
//{
//    self.tableview.frame = CGRectMake(0,0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
//    
//     self.tableview.contentInset = UIEdgeInsetsMake(self.headerView.height, 0, 0 , 0);
//   
//}

@end
