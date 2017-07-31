//
//  HMShoppingCartVC.m
//  HUAMAO
//  Created by imac-xdc on 2017/6/12.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMShoppingCartVC.h"
#import "HMShoppingCarCell.h"
#import "HMShoppingCarModel.h"
#import "HMShoppingDetailsModel.h"
#import "HMAddAddressVC.h"
#import "HMCommonNULLView.h"

#import "MJExtension.h"
#import "NSDictionary+ObjectForKey.h"

@interface HMShoppingCartVC ()<UITableViewDelegate,UITableViewDataSource,HMShoppingCarCellDelegate>

@property (weak, nonatomic) UITableView *tableView;
@property(nonatomic, strong)NSMutableArray *shoppingCarArr;
@property(nonatomic, strong) HMShoppingCarModel *shoppingCarModel;
@property(nonatomic, strong) HMShoppingDetailsModel *detailsModel;

@property(nonatomic, strong)NSMutableArray *shoppingDetailsArr;

@property(strong, nonatomic)UILabel *shoppingPrice;

//商品ID
@property(copy, nonatomic)NSString *shop_id;
//收货人电话
@property(copy, nonatomic)NSString *phone;
//收货人姓名
@property(copy, nonatomic)NSString *oname;
//收货人地址
@property(copy, nonatomic)NSString *address;
//商品总价
@property(copy, nonatomic)NSString *shopzonggong;

@property(copy, nonatomic)NSString *Order_on;


//tableview 无数据显示占位文字
@property (nonatomic, strong) UIView *littleView;

@property(nonatomic, strong)UIView *shoppingPriceView;

@property (assign,  nonatomic) bool isPop;

@end



@implementation HMShoppingCartVC

static NSString *cellID = @"HMShoppingCarCell";

long long WhichOne = 10000000000000;

- (NSMutableArray *)shoppingCarArr
{
    if (!_shoppingCarArr) {
        
        _shoppingCarArr = [NSMutableArray array];
    }
    return _shoppingCarArr;
}

- (NSMutableArray *)shoppingDetailsArr
{
    if (!_shoppingDetailsArr) {
        
        _shoppingDetailsArr = [NSMutableArray array];
    }
    return _shoppingDetailsArr;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"购物车";
    
    self.view.backgroundColor = HMUIColorFromRgbAlpha(0x11111, 1);
    //设置TableView
    [self setUpTableView];
    
    //设置tableView无数据时占位文字    
    [self setUpLittleView];
    
    [self setUpBottomview];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self refreshData];
    
    [self qureyShopoingCarMessage];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshData) name:@"refreshData" object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

- (void)refreshData
{
    self.shoppingPrice.text = @" 0";
    self.shoppingPrice.textColor = [UIColor redColor];
    
    self.shop_id = nil;
    
    WhichOne = 10000000000000;
    
    [self.tableView reloadData];

}


-(void)setUpLittleView
{
    
    self.littleView = [HMCommonNULLView setupLittleViewString:@"空空如也，快去挑选吧...."];
    self.littleView.hidden = YES;
    [self.tableView addSubview:self.littleView];
    
}

- (void)setUpBottomview
{
    //购物车结算
    UIView *shoppingView = [[UIView alloc] init];

    shoppingView.frame = CGRectMake(0, HMLXScreenHeight - (49+ 45), HMLXScreenHeight, 45);
    shoppingView.backgroundColor = HMUIColorFromRgbAlpha(0x1e1e1e , 1);
    [self.view addSubview:shoppingView];
    
    //结算按钮
    UIButton *settlementBtn = [[UIButton alloc] init];
    settlementBtn.frame = CGRectMake(HMLXScreenWidth - 100, HMLXScreenHeight - (49+45), 100, 45);
    
    [settlementBtn setTitle:@"结 算" forState:UIControlStateNormal];
    
    [settlementBtn setBackgroundImage:[UIImage imageNamed:@"结算"] forState:UIControlStateNormal];
    
     [self.view insertSubview:settlementBtn aboveSubview:shoppingView];
    
    //触发点击事件
    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(settlementBtnClick)];
    [settlementBtn addGestureRecognizer:tapGesturRecognizer];
    
    //结算金额标题
     UILabel *titlePrice = [[UILabel alloc] init];
     titlePrice.frame = CGRectMake(10, HMLXScreenHeight - 94, 45, 45);
    titlePrice.text = @"合计:";
    
    titlePrice.font = [UIFont systemFontOfSize:17.0f];
    titlePrice.textColor = [UIColor whiteColor];
    
    [self.view insertSubview:titlePrice aboveSubview:shoppingView];

    UIImageView *priceImg = [[UIImageView alloc] initWithFrame:CGRectMake(titlePrice.maxX, HMLXScreenHeight - 84, 19, 16)];
    
    priceImg.centerY = titlePrice.centerY;
    
    priceImg.image = [UIImage imageNamed:@"金豆文字"];
    
    [self.view insertSubview:priceImg aboveSubview:shoppingView];

    
    //结算金额
    UILabel *price = [[UILabel alloc] init];
    
    price.frame = CGRectMake(priceImg.maxX, HMLXScreenHeight - (49+45), 200, 45);
    price.text = @"：";
    price.font = [UIFont systemFontOfSize:17.0f];
    price.textColor = [UIColor whiteColor];
    self.shoppingPrice = price;
    
    [self.view insertSubview:price aboveSubview:shoppingView];
    
}


- (void)setUpTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    tableView.backgroundColor = [UIColor clearColor];
    
    tableView.frame = CGRectMake(0,  0, HMLXScreenWidth, HMLXScreenHeight- 94);
    
    tableView.showsVerticalScrollIndicator = NO;
    
    tableView.rowHeight = 180;
    
    self.tableView = tableView;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HMShoppingCarCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    
    [self.view addSubview:tableView];
}


#pragma  UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.shoppingCarArr.count;
   
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    HMShoppingCarCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.shoppingCarModel = self.shoppingCarArr[indexPath.row];
    cell.delegate = self;
    
    if (indexPath.row == WhichOne) {
        
        cell.isSure.image = [UIImage imageNamed:@"选中"];
        
    }else{
        
       cell.isSure.image = [UIImage imageNamed:@"未选中"];
        
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WhichOne = indexPath.row;
    
    [self.tableView reloadData];

    HMShoppingCarModel *shoppingCarModel = self.shoppingCarArr[indexPath.row];
    
    self.shop_id = shoppingCarModel.orderReq.ID;
    
    self.phone = shoppingCarModel.phone;
    
    self.oname = shoppingCarModel.oname;
    
    self.address = shoppingCarModel.address;
    
    self.shopzonggong = shoppingCarModel.orderReq.shopzonggong;

    self.shoppingPrice.text = [NSString stringWithFormat:@" %@",shoppingCarModel.orderReq.shopzonggong];
    self.shoppingPrice.textColor = [UIColor redColor];
    
    
    
}

//进入页面获取购物车列表
- (void)qureyShopoingCarMessage
{
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    dic[@"method"] = @"order_select";
    dic[@"openid"] = Kopenid;
    dic[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:@"sessionid"];
    
    dic[@"status"] = @"1";
    
    __weak typeof(self) weakSelf = self;
    [HMServiceTool RequestWithDic:dic type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        NSLog(@"详询：%@",responseObject);
        if ([responseObject[@"flag"] integerValue] == 1) {
            
        
            weakSelf.shoppingCarArr  = [HMShoppingCarModel mj_objectArrayWithKeyValuesArray:responseObject[@"resultStr"]];
            
            self.shoppingCarModel  = [HMShoppingCarModel mj_objectWithKeyValues:responseObject[@"resultStr"]];
          
            if (weakSelf.shoppingCarArr.count < 1) {
                
                self.littleView.hidden = NO;
                
            } else {
                self.littleView.hidden = YES;
                [self.tableView setBackgroundColor:[UIColor clearColor]];
            }

        [self.tableView reloadData];
        
        }else{
            
            [MBProgressHUD showError:@"加载失败"];
        }
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        [MBProgressHUD showError:@"加载失败，请检查网络重试"];
    }];

}

#pragma cellDelegate(订单删除)
- (void)deleteOrder_on:(NSString *)Order_on
{
    
    self.Order_on = Order_on;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"确定删除订单" message:@"" delegate:self cancelButtonTitle:@"放弃" otherButtonTitles:@"确定", nil];
    [alert show];
    
}

#pragma UIAlertViewDetegate（订单删除)

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        
        [MBProgressHUD showMessage:@"正在加载..."];
        
        NSMutableDictionary * dic = [NSMutableDictionary dictionary];
        dic[@"method"] = @"order_del";
        dic[@"openid"] = Kopenid;
        dic[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:@"sessionid"];
        dic[@"id"] = self.Order_on;
        
        [HMServiceTool RequestWithDic:dic type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
            
            if ([responseObject[@"flag"] integerValue] == 1) {
                
                [MBProgressHUD hideHUD];
                
                [MBProgressHUD showSuccess:responseObject[@"mess"]];
                
                [self qureyShopoingCarMessage];
                
                [self refreshData];
                
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


//结算
-(void)settlementBtnClick
{
    NSLog(@"shop_id:%@",self.shop_id);
    
    if (self.shop_id.length > 0) {
        
        HMAddAddressVC * VC = [[HMAddAddressVC alloc]init];
        
        VC.order_id = self.shop_id;
        
        VC.cname = self.oname;
        
        VC.phone = self.phone;
        
        VC.adderss = self.address;
        
        [self.navigationController pushViewController:VC animated:YES];

    }else{
    
        [MBProgressHUD showError:@"请选择一件商品"];

    }

}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
