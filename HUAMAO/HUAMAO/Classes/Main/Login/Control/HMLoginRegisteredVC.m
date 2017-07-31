//
//  HMLoginRegisteredVC.m
//  HUAMAO
//
//  Created by 孙密 on 17/5/17.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMLoginRegisteredVC.h"

#import "HMSwitchSelectView.h"

#import "HMLoginTextView.h"

#import "HMRegisteredTextView.h"

#import "HMChangePasswordVC.h"

#import "HMServiceTool.h"

#import "HMMainTabBarVC.h"


#import "HMServiceTool.h"

@interface HMLoginRegisteredVC ()
<HMLoginTextViewDelegeat,
HMRegisteredTextDelegeat,

UIScrollViewDelegate>

@property(strong,nonatomic)HMLoginTextView *loginV;

@property(strong,nonatomic)HMRegisteredTextView *RegisteredV;

@property(strong,nonatomic)UIScrollView *ScrollV;


@end


@implementation HMLoginRegisteredVC



-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{

     [self.view endEditing:YES];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *imageback = [[UIImageView alloc]initWithFrame:self.view.bounds];
    
    imageback.contentMode = UIViewContentModeCenter;
    
    imageback.image = [UIImage imageNamed:@"背景"];
    
    [self.view addSubview:imageback];
    
    
    [self.view addSubview:self.ScrollV];
 
    [self creatUI];
    
    [self versionChange];
    
    
}


-(UIScrollView *)ScrollV{
    
    if(_ScrollV ==nil){
        
        _ScrollV = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        
        _ScrollV.delegate =self;
        
    }
    
    return _ScrollV;
    
}


-(void)RegisteredTextViewRegisSuccesDo:(HMRegisteredTextView *)view{
    
     [self.loginV removeFromSuperview];
    
     [self.ScrollV addSubview:self.RegisteredV];
}


-(void)LoginTextViewForgetNumAction:(HMLoginTextView *)LoginTextView{
    
    HMChangePasswordVC * changePassword = [[HMChangePasswordVC alloc]init];
    
    [self.navigationController pushViewController:changePassword animated:YES];
    
}


-(void)loginSureAction:(HMLoginTextView *)LoginTextView WithSouceDic:(NSDictionary *)dic{
    
    NSString *strUrl = [NSString convertToJSONData:dic];

    NSString *HMUrl = [NSString stringWithFormat:@"%@?json=%@",HMPATUrl,strUrl];
    
    HMUrl = [HMUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",HMUrl);
    
    [MBProgressHUD showMessage:@"正在登录"];

    [HMServiceTool HMGETPath:HMUrl parameters:nil success:^(NSURLSessionDataTask *operation, id responseObject) {

        [MBProgressHUD hideHUD];
        NSLog(@"%@",responseObject);
        
        NSLog(@"%@",responseObject[@"mess"]);
        

        if([responseObject[@"flag"] integerValue] == 0){
            
            [MBProgressHUD showError:responseObject[@"mess"]];
            
        }else{
            
             [MBProgressHUD showSuccess:@"登陆成功"];
            
            NSString *headerStr = responseObject[@"resultStr"][@"head"];

            [[NSUserDefaults standardUserDefaults]setObject:headerStr forKey:@"headerUrl"];
            
            NSString *iphone = responseObject[@"resultStr"][@"phone"];
            [[NSUserDefaults standardUserDefaults]setObject:iphone forKey:@"iphone"];
            
            
            NSLog(@"%@",responseObject[@"resultStr"][@"sessionid"]);
            
            NSString *sessionid = responseObject[@"resultStr"][@"sessionid"];
            
            NSString *openid = responseObject[@"resultStr"][@"openid"];
            
            
            NSString *DongJie = responseObject[@"resultStr"][@"dongjie"];
            
            [[NSUserDefaults standardUserDefaults]setObject:sessionid forKey:HMSESSIONId];
            
            
            [[NSUserDefaults standardUserDefaults]setObject:openid forKey:OPENId];

//#warning DongJie
            
            [[NSUserDefaults standardUserDefaults]setObject:DongJie forKey:@"DongJie"];
            
//            [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"DongJie"];
            
            
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            
                UITabBarController *MainVC = [[HMMainTabBarVC alloc]init];
            
                HMWindow.rootViewController = MainVC;
            
        }

        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        [MBProgressHUD hideHUD];
        
         [MBProgressHUD showError:@"服务器未连接"];
        NSLog(@"%@",error);
        
    }];

    
}

-(HMLoginTextView*)loginV{
    if(_loginV ==nil){
        
        _loginV = [HMLoginTextView LoginTextView];
        
        _loginV.Delegeat = self;
    }
    
    return _loginV;
    
}

-(HMRegisteredTextView*)RegisteredV{
    
    if(_RegisteredV == nil){
        
        _RegisteredV = [HMRegisteredTextView RegisteredTextView];
        
        _RegisteredV.Delegeat = self;
    }
    
    return _RegisteredV;
}


-(void)creatUI{
    
 
    float leftSpace = 40 * kHMScreenWidth_Case *2 ;
    
    UIImageView *iconImg = [[UIImageView alloc]init];
    
    iconImg.contentMode = UIViewContentModeCenter;
    
    iconImg.image = [UIImage imageNamed:@"logoGuocui"];
    
    iconImg.height = 160;
    
    iconImg.width = self.view.width;
    
    iconImg.x =  0;
    
    iconImg.y = 40 *kHMScreenHeight_Case *2;
    
    [self.ScrollV addSubview:iconImg];
    
    HMSwitchSelectView * SwitchSelectView = [HMSwitchSelectView SwitchSelectV];
    
    SwitchSelectView.x  = leftSpace ;
    
    SwitchSelectView.y  = iconImg.maxY;
    
    SwitchSelectView.height =  44 ;
    
    SwitchSelectView.width = self.view.width - 2*SwitchSelectView.x;
    
    __weak typeof(self) weekSelf = self;
    
     float yHeigth = SwitchSelectView.maxY + 10;
    
     float ywidth = SwitchSelectView.width;
    
    [SwitchSelectView setLiftbuttontitle:@"登陆" Rightbuttontitle:@"注册" liftbuttonAction:^{
        
        NSLog(@"denglu");
        
        [weekSelf.RegisteredV removeFromSuperview];
        
        weekSelf.loginV.x = leftSpace;
        
        weekSelf.loginV.height = 1000;
        
        weekSelf.loginV.y = yHeigth;
        
        weekSelf.loginV.width = ywidth;
        
        [weekSelf.ScrollV addSubview:weekSelf.loginV];
        
        weekSelf.ScrollV.contentSize = CGSizeMake(0, weekSelf.view.height);
          
    } rightButtonAction:^{
        
        NSLog(@"zhuce");
        
        [weekSelf.loginV removeFromSuperview];
        
        weekSelf.RegisteredV.x = leftSpace;
        
        weekSelf.RegisteredV.height = 1000;
        
        weekSelf.RegisteredV.y = yHeigth;
        
        weekSelf.RegisteredV.width = ywidth;
        
        [weekSelf.ScrollV addSubview:weekSelf.RegisteredV];
        
        weekSelf.ScrollV.contentSize = CGSizeMake(0, 700);

    }];
    

    [self.ScrollV addSubview:SwitchSelectView];
    
    
    [SwitchSelectView loginButtonAction];
    

 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)versionChange{
    
    
    NSMutableDictionary *dicSouce = [[NSMutableDictionary alloc]init];
    
    
    dicSouce[@"method"] = @"android_version";
    
    dicSouce[@"ios"] = @"ios";
    
    [HMServiceTool RequestWithDic:dicSouce type:URLtypeAPP RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {

        NSLog(@"版本检测%@",responseObject);
    
      
    
        NSString *curVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
        float integerApp_build = [curVersion floatValue];
     
        
        NSLog(@"%f",integerApp_build);
        
        if([responseObject[@"resultStr"][@"version"]floatValue] > integerApp_build){
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"有新版本需要更新" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            
            [alert show];
            
        }
 
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        
   
        
        
    }];
    
}


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    [self openWeb];
}



-(void)openWeb{
    
    NSString *urlText =  [NSString stringWithFormat:@"http://gc.autopiao.com/app/ios.html"];
                         
    [[ UIApplication sharedApplication] openURL:[NSURL URLWithString:urlText]];
    

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
