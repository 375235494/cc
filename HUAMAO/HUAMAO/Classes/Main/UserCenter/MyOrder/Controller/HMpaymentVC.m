//
//  HMpaymentVC.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/13.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMpaymentVC.h"

#import "HMpaymentCell.h"

#import "HMNoMesageV.h"

@interface HMpaymentVC ()

@property(strong,nonatomic)HMNoMesageV *nomessageV;

@end

@implementation HMpaymentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self getMessageWithType:2];
    
}

-(HMNoMesageV *)nomessageV{
    
    if(_nomessageV == nil){
        
        _nomessageV = [HMNoMesageV NomessageV];
        
    }
    
    return _nomessageV;
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(self.arySouce.count == 0){
        
        [tableView addSubview:self.nomessageV];
        
        self.nomessageV.frame = tableView.bounds ;
        
        self.nomessageV.height = tableView.height /2 + 50;
        
        
    }else{
        
        [self.nomessageV removeFromSuperview];
    }
    
    return self.arySouce.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    HMpaymentCell * cell = [HMpaymentCell paymentCellWithTableView:tableView];
    
    __weak typeof(self) weakSelf = self;
    
    [cell cancelActionBlock:^(NSDictionary *dicsouce) {
        
        [weakSelf DeleatOrderWithOrder:dicsouce];
        
    } andPayActionBlock:^(NSDictionary *dicsouce) {
        
        [weakSelf PayWithOrder:dicsouce];
        
    }];
    
    cell.dicSouce = self.arySouce[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 270;
}

-(void)DeleatOrderWithOrder :(NSDictionary *) dicsouce{
    
    NSMutableDictionary * dic =[[NSMutableDictionary alloc]init];
    
    dic[@"method"] = @"order_del";
    
    dic[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:HMSESSIONId];
    
    dic[@"openid"] = [[NSUserDefaults standardUserDefaults]objectForKey:OPENId];
    
    dic[@"id"] = dicsouce[@"orderReq"][@"id"];
    
    
    [MBProgressHUD showMessage:@"正在加载..."];
    
    [HMServiceTool RequestWithDic:dic type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        NSLog(@"系统返回%@",responseObject);
        
        [MBProgressHUD hideHUD];
        
        if([responseObject[@"flag"] integerValue] != 1){
            
            [MBProgressHUD showError:@"服务器未连接"];
            
            return ;
        }
        
        [MBProgressHUD showSuccess:@"订单取消"];
        
        [self.arySouce removeObject:dicsouce];
        
        [self.tableView reloadData];
        
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        NSLog(@"%@",error);
        
        [MBProgressHUD hideHUD];
        
        [MBProgressHUD showError:@"服务器未连接"];
        
    }];
    
}


-(void)PayWithOrder:(NSDictionary *) dicsouce{
    
    NSMutableDictionary * dic =[[NSMutableDictionary alloc]init];
    
    dic[@"method"] = @"order_zf";
    
    dic[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:HMSESSIONId];
    
    dic[@"openid"] = [[NSUserDefaults standardUserDefaults]objectForKey:OPENId];
    
    dic[@"id"] = dicsouce[@"orderReq"][@"id"];
    
    dic[@"content"] = @"买家留言";

    [MBProgressHUD showMessage:@"正在加载..."];
    
    [HMServiceTool RequestWithDic:dic type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        NSLog(@"系统返回%@",responseObject);
        
        [MBProgressHUD hideHUD];
        
        if([responseObject[@"flag"] integerValue] != 1){
            
            [MBProgressHUD showError:@"服务器未连接"];
            
            return ;
        }

        
        [MBProgressHUD showSuccess:@"订单已付款"];
        
        [self.arySouce removeObject:dicsouce];
        
        [self.tableView reloadData];
        
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        NSLog(@"%@",error);
        
        [MBProgressHUD hideHUD];
        
        [MBProgressHUD showError:@"服务器未连接"];
        
    }];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
