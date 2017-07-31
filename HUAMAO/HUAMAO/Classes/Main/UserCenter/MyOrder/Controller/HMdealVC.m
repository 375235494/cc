//
//  HMdealVC.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/13.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMdealVC.h"

#import "HMdealCell.h"

#import "HMNoMesageV.h"

@interface HMdealVC ()

@property(strong,nonatomic)HMNoMesageV *nomessageV;

@end

@implementation HMdealVC

-(HMNoMesageV *)nomessageV{
    
    if(_nomessageV == nil){
        
        _nomessageV = [HMNoMesageV NomessageV];
    
    }

    return _nomessageV;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    [self getMessageWithType:5];
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
    
    HMdealCell * cell = [HMdealCell dealCellWithTableView:tableView];
    
    cell.dicSouce = self.arySouce[indexPath.row];
    
    __weak typeof(self)WeakSelf = self;
    
    cell.DeleatOrder =  ^(NSDictionary * dicSouce){
        
        [WeakSelf DeleatWithOrder:dicSouce];
        
    };
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 250;
}


-(void)DeleatWithOrder:(NSDictionary *)dicsouce{
    
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


@end
