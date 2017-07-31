//
//  HMInvitationHomeVC.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMInvitationHomeVC.h"

#import "HMRecruitingShowView.h"

#import "HMServiceTool.h"

@interface HMInvitationHomeVC ()

@property(weak,nonatomic)IBOutlet UIButton *recruitingButton;

@property (weak, nonatomic) IBOutlet UILabel *labelText;
@end

@implementation HMInvitationHomeVC


//-(void)viewWillAppear:(BOOL)animated{
//    
//    [super viewWillAppear:animated];
//    
//    self.navigationController.navigationBar.hidden = NO;
//}
//
//-(void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    
//    self.navigationController.navigationBar.hidden = YES;
//    
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = HMUIColorFromRgb(0x171717);
    
    self.view.clipsToBounds = YES;
    
    NSMutableAttributedString *textstr = [[NSMutableAttributedString alloc]initWithString:@"邀请一名新用户注册，新用户点击【超过不超过】并充值成功后，新用户即可进行竞猜"];
    
    [textstr addAttribute:NSForegroundColorAttributeName  value:HMUIColorFromRgb(0xa7a7a7) range:NSMakeRange(0, 37)];
    
    [textstr addAttribute:NSForegroundColorAttributeName  value:HMUIColorFromRgb(0xfdbe19) range:NSMakeRange(10, 12)];
    
//    [textstr addAttribute:NSFontAttributeName  value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, 11)];
//    
    
    _labelText.attributedText = textstr;
    
    self.navigationController.navigationBar.hidden = YES;
    
//    self.recruitingButton.backgroundColor= HMUIColorFromRgbAlpha(0xfdbe19 , 1);
    
    self.recruitingButton.layer.cornerRadius = self.recruitingButton.height/2;
    
    
//    self.recruitingButton.layer.masksToBounds = YES;
    
    [self.recruitingButton setBackgroundImage:[UIImage imageNamed:@"按钮邀请"] forState:UIControlStateNormal];
    
    
    [self.recruitingButton addTarget:self action:@selector(recruitingButton:) forControlEvents:UIControlEventTouchUpInside];
    
}
- (IBAction)back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}



-(void)recruitingButton:(UIButton *)button{
    
  
    NSMutableDictionary *dicsouce = [[NSMutableDictionary alloc]init];
    
    dicsouce[@"method"] = @"getmyqrcode";
    
    dicsouce[@"openid"] = [[NSUserDefaults standardUserDefaults]objectForKey:OPENId];
    
//    dicsouce[@"url_yqm"] = @"ynj.nxing.cn";
    
    [MBProgressHUD showMessage:@"正在加载..."];
    
    [HMServiceTool RequestWithDic:dicsouce type:URLtypeAPP RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        
        [MBProgressHUD hideHUD];
        
        NSLog(@"%@",responseObject);
        
        if([responseObject[@"flag"] integerValue] == 0){
            
            [MBProgressHUD showError:responseObject[@"mess"]]; return ;

            
        }
        
        
        
        HMRecruitingShowView * RecruitingShowView = [[HMRecruitingShowView alloc]init];

        [RecruitingShowView ShowRiskwarningView];
        
        RecruitingShowView.qrcode = responseObject [@"resultStr"][@"yqm_url"];
        
        RecruitingShowView.yqmcode = responseObject [@"resultStr"][@"qrcode"];
        
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        
        [MBProgressHUD hideHUD];
        
        [MBProgressHUD showError:@"服务器未连接"];
        
        
    }];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
