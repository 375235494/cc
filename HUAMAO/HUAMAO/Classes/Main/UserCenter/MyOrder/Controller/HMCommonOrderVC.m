//
//  HMCommonOrderVC.m
//  HUAMAO
//  Created by imac-xdc on 2017/6/13.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMCommonOrderVC.h"

@interface HMCommonOrderVC ()
<UITableViewDelegate,
UITableViewDataSource>

@end

@implementation HMCommonOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColorFromHex(0x111111, 1);
    
     [self.view addSubview:self.tableView];
    
     
}


-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    self.tableView.frame = self.view.bounds;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableArray *) arySouce{
    
    if(_arySouce == nil){
        
        _arySouce = [[NSMutableArray alloc]init];
    }
    
    
    return _arySouce;
    
}

-(UITableView *)tableView{
    
    if(_tableView == nil){
        
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _tableView.backgroundColor = UIColorFromHex(0x111111, 1);
        
        _tableView.dataSource = self;
        
        _tableView.delegate =self;
    
        // 设置隐藏分割线
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        // 设置隐藏垂直的滚动条
        _tableView.showsVerticalScrollIndicator = NO;
        
    }
    
    return _tableView;
    
}


-(void)getMessageWithType:(NSInteger )type{
    
    NSMutableDictionary * dic =[[NSMutableDictionary alloc]init];
    
    dic[@"method"] = @"order_select";
    
    dic[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:HMSESSIONId];
    
    dic[@"openid"] = [[NSUserDefaults standardUserDefaults]objectForKey:OPENId];
    
    dic[@"status"] = @(type);

    
    [MBProgressHUD showMessage:@"正在加载..."];
    
    [HMServiceTool RequestWithDic:dic type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        NSLog(@"系统返回%@",responseObject);
        
        [MBProgressHUD hideHUD];
        
        if([responseObject[@"flag"] integerValue] == 0){
            
            [MBProgressHUD showError:@"服务器未连接"];
            
            return ;
        }
        
        [self.arySouce addObjectsFromArray:responseObject[@"resultStr"]];
        
 
        [self.tableView reloadData];
        
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        NSLog(@"%@",error);
        
        [MBProgressHUD hideHUD];
        
        [MBProgressHUD showError:@"服务器未连接"];
        
    }];
    
}


@end
