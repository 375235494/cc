//
//  HMdetailsVC.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/7/2.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMdetailsVC.h"
#import "HMAddAddressVC.h"
#import "HMGoodsShowCell.h"
#import "HMGoodsDetailsHeaderView.h"
#import "NSDictionary+ObjectForKey.h"
#import "MJExtension.h"
#import "HMGoodsShowModel.h"


@interface HMdetailsVC ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *BuyNowBtn;
@property (weak, nonatomic) IBOutlet UIButton *shoppingCar;
@property (weak, nonatomic) IBOutlet UIView *bottomiew;
@property (weak, nonatomic) IBOutlet UIImageView *carImage;


@property (weak, nonatomic) UITableView *tableView;
@property (nonatomic, weak) HMGoodsDetailsHeaderView *headerView;
@property (nonatomic, strong) HMGoodsShowModel *goodsShowModel;
@property(nonatomic, strong) NSMutableArray *goodsShowArr;

@property(nonatomic, copy)NSString *shopnumber;




@property (weak, nonatomic) IBOutlet UIImageView *headImageV;


@end


#define heightForRow 3200

@implementation HMdetailsVC

static NSString * cellID = @"HMGoodsShowCell";

- (NSMutableArray *)goodsShowArr
{
    if (!_goodsShowArr ) {
        _goodsShowArr = [NSMutableArray array];
    }
    return _goodsShowArr;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];

    
    self.title = @"商品详情";
    
    [self setUpTableViewHeader];
    
    [self setUpTableView];
    
//    [self setUpShoppingCar];
    
    self.view.backgroundColor = HMColor(21, 21, 21);
    
    //获取单个商品信息
    [self qureyGoodsDetailsMessage];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(qureyPayNumberCont:) name:@"sendPayNumberCont" object:nil];
    
}



- (void)qureyPayNumberCont:(NSNotification *)cont
{

   NSDictionary *userDict = cont.userInfo;
    
    self.shopnumber = userDict[@"cont"];

}


//顶部


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void)setUpShoppingCar
{
    [self.shoppingCar setTitle:@"  加入购物车" forState:UIControlStateNormal];

    [self.shoppingCar addTarget:self action:@selector(button1BackGroundHighlighted:) forControlEvents:UIControlEventTouchDown];
    [self.shoppingCar addTarget:self action:@selector(button1BackGroundNormal:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)button1BackGroundNormal:(UIButton *)sender
{
    [self.shoppingCar setBackgroundImage:[UIImage imageNamed:@"结算"] forState:UIControlStateNormal];
    sender.imageView.image = [UIImage imageNamed:@"加入购物车"];
}


- (void)button1BackGroundHighlighted:(UIButton *)sender
{
    [self.shoppingCar setBackgroundImage:[UIImage imageNamed:@"结算"] forState:UIControlStateSelected];
    sender.imageView.image = [UIImage imageNamed:@"选中加入购物车"];

}



//设置tableview
-(void)setUpTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;

//    [self detailListSouce];

    

    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    NSLog(@"%@",self.dicDetails);

    tableView.backgroundColor = [UIColor clearColor];

    [self.headImageV sd_setImageWithURL:[NSURL URLWithString:self.dicDetails[@"cimg"]] placeholderImage:[UIImage imageNamed:HMPlaceHolderImage]];

    tableView.frame = CGRectMake(0, 64, HMLXScreenWidth,  HMLXScreenHeight - 64 - 45);
    


    tableView.tableHeaderView = self.headerView;
    
     tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.estimatedRowHeight = 10;
    self.tableView  = tableView;
    
    
    
  //  注册cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HMGoodsShowCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    
    [self.view addSubview:tableView];
}


//设置tableView的头部视图
-(void)setUpTableViewHeader
{
    self.headerView = [[[NSBundle mainBundle] loadNibNamed:@"HMGoodsDetailsHeaderView" owner:nil options:nil] lastObject];
    
}
#pragma UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.goodsShowArr.count;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HMGoodsShowCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    
    cell.goodsShowModel = self.goodsShowArr[indexPath.row];
    
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return heightForRow;
    
}



- (IBAction)buyNowBtnClick {
    
    [MBProgressHUD showMessage:@"正在加载..."];
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    dic[@"method"] = @"order_xia";
    dic[@"openid"] = Kopenid;
    dic[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:@"sessionid"];
    
    dic[@"shopid"] = [NSString stringWithFormat:@"%@",self.DetailsId];
    
    if (self.shopnumber.length > 0) {
        
        dic[@"shopnumber"] = self.shopnumber;
        
    }else{
    
        dic[@"shopnumber"] = @"1";
    
    }
  
    [HMServiceTool RequestWithDic:dic type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
         NSLog(@"下单：%@",responseObject);
        
        if ([responseObject[@"flag"] integerValue] == 1) {
            
            [MBProgressHUD hideHUD];

            HMAddAddressVC * VC = [[HMAddAddressVC alloc]init];
            
            NSString * cname = responseObject[@"resultStr"][@"cname"];
            if (![cname isKindOfClass:[NSNull class]]) {
                 VC.cname = responseObject[@"resultStr"][@"cname"];
            }
            
            NSString * phone = responseObject[@"resultStr"][@"phone"];
            
            if (![phone isKindOfClass:[NSNull class]]) {
                
                VC.phone = responseObject[@"resultStr"][@"phone"];
            }

            NSString * adderss = responseObject[@"resultStr"][@"adderss"];
            if (![adderss isKindOfClass:[NSNull class]]) {
                
                VC.adderss = responseObject[@"resultStr"][@"adderss"];
            }
            
            NSString * postman = responseObject[@"resultStr"][@"postman"];
            if (![postman isKindOfClass:[NSNull class]]) {
                
                VC.postman = responseObject[@"resultStr"][@"postman"];
            }
            
            NSString * order_id = responseObject[@"resultStr"][@"id"];
            if (![order_id isKindOfClass:[NSNull class]]) {
                
                 VC.order_id = responseObject[@"resultStr"][@"id"];
            }
            
            
            
            [self.navigationController pushViewController:VC animated:YES];
            
            [MBProgressHUD showSuccess:responseObject[@"resultStr"][@"mess"]];
            
        }else{
          [MBProgressHUD hideHUD];
          [MBProgressHUD showError:@"加载失败"];
            
        }
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        
        [MBProgressHUD hideHUD];
        
        [MBProgressHUD showError:@"服务器未连接"];
        
        
    }];

    
}
//添加到购物车
- (IBAction)shoppingCarClick {
 
    [MBProgressHUD showMessage:@"正在加载..."];
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    dic[@"method"] = @"order_gwc";
    dic[@"openid"] = Kopenid;
    dic[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:@"sessionid"];
    
    dic[@"shopid"] = [NSString stringWithFormat:@"%@",self.DetailsId];
    if (self.shopnumber.length > 0) {
        
        dic[@"shopnumber"] = self.shopnumber;
        
    }else{
        
        dic[@"shopnumber"] = @"1";
        
    }
    
    [HMServiceTool RequestWithDic:dic type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        NSLog(@"购物车：%@",responseObject);
        
        if ([responseObject[@"flag"] integerValue] == 1) {
            
            [MBProgressHUD hideHUD];
            
            
            [MBProgressHUD showSuccess:responseObject[@"resultStr"]];
            
        }else{
            [MBProgressHUD hideHUD];
            [MBProgressHUD showError:@"加载失败"];
            
        }
        
        
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        
        [MBProgressHUD hideHUD];
        
        [MBProgressHUD showError:@"服务器未连接"];
        
        
    }];
    

    
    NSLog(@"购物车");
}


- (void)qureyGoodsDetailsMessage{
    
    [MBProgressHUD showMessage:@"正在加载..."];
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    dic[@"method"] = @"selectshop";
    dic[@"id"] = [NSString stringWithFormat:@"%@",self.DetailsId];
   
    __weak typeof(self) weakSelf = self;
    [HMServiceTool RequestWithDic:dic type:URLtypeAPP RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        NSLog(@"单个商品%@",responseObject);
        
        if ([responseObject[@"flag"] integerValue] == 1) {
            
            [MBProgressHUD hideHUD];
            
            self.headerView.detailsModel = [HMGoodsDetailsModel mj_objectWithKeyValues:responseObject[@"resultStr"][0]];
            
             weakSelf.goodsShowArr  = [HMGoodsShowModel mj_objectArrayWithKeyValuesArray:responseObject[@"resultStr"]];
            
            [self.tableView reloadData];
     
        }else{
            
            [MBProgressHUD hideHUD];
            [MBProgressHUD showError:@"加载失败"];
        }
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        [MBProgressHUD hideHUD];
        [MBProgressHUD showError:@"加载失败，请检查网络重试"];
    }];

}

- (void)dealloc
{

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
