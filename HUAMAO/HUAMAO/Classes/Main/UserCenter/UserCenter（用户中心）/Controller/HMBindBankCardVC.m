
//  HMBindBankCardVC.m
//  HUAMAO
//  Created by  on 2017/5/20.
//  Copyright © 2017年 陈臣. All rights reserved.

#import "HMBindBankCardVC.h"
#import "HMServiceTool.h"

@interface HMBindBankCardVC ()
//持卡人
@property (weak, nonatomic) IBOutlet UITextField *serNameTextField;
//银行
@property (weak, nonatomic) IBOutlet UITextField *bankTextField;
//卡号
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTF;
//省份
@property (weak, nonatomic) IBOutlet UITextField *provinceTF;
//城市
@property (weak, nonatomic) IBOutlet UITextField *cityTF;
//提交按钮
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

@end

@implementation HMBindBankCardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"绑定银行卡";
    
    self.view.backgroundColor = HMColor(0, 0, 0);
    
    [self setUpTextField];
    
    [self qureyBankMessage];
}


-(void)qureyBankMessage
{
    self.serNameTextField.text = Kusername;
    [[NSUserDefaults standardUserDefaults] setObject:self.serNameTextField.text forKey:@"username"];
    
    self.bankTextField.text = Kbankname;
     [[NSUserDefaults standardUserDefaults] setObject:self.bankTextField.text forKey:@"bankname"];
    
    self.provinceTF.text = Kbankprov;
     [[NSUserDefaults standardUserDefaults] setObject:self.provinceTF.text forKey:@"bankprov"];
    
    self.cityTF.text = Kbankcity;
    [[NSUserDefaults standardUserDefaults] setObject:self.cityTF.text forKey:@"bankcity"];
    
    self.phoneNumberTF.text = Kbankno;
    [[NSUserDefaults standardUserDefaults] setObject:self.phoneNumberTF.text forKey:@"bankno"];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}

- (void)setUpTextField
{
    [self setUpRadiusWithTextField:self.serNameTextField];
    [self setUpRadiusWithTextField:self.bankTextField];
    [self setUpRadiusWithTextField:self.phoneNumberTF];
    [self setUpRadiusWithTextField:self.provinceTF];
    [self setUpRadiusWithTextField:self.cityTF];

    self.submitBtn.layer.cornerRadius = 5;
    self.submitBtn.layer.masksToBounds = YES;
//    self.submitBtn.backgroundColor = D3AB2F;
    
}

- (void)setUpRadiusWithTextField:(UITextField *)textField {
    //占位文字颜色
    [textField setValue:HMUIColorFromRgbAlpha(0x6a6a6a , 1) forKeyPath:@"_placeholderLabel.textColor"];
    //设置圆角
    textField.layer.cornerRadius = 5;
    textField.layer.borderColor = HMColor(50, 50, 50).CGColor;
    textField.layer.borderWidth = 1;
    textField.backgroundColor = HMColor(30, 30, 30);
    
    [textField setTextColor:HMColor(150, 150, 150)];
}

//提交按钮的点击事件
- (IBAction)submitBtnClick {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"method"] = @"saveBank";
    dic[@"openid"] = Kopenid;
    dic[@"username"] = self.serNameTextField.text;
    dic[@"bankprov"] = self.provinceTF.text;
    dic[@"bankcity"] = self.cityTF.text;
    dic[@"bankflag"] = @"0";
    dic[@"bankname"] = self.bankTextField.text;
    dic[@"bankno"] = self.phoneNumberTF.text;
    dic[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:@"sessionid"];
    
    [HMServiceTool RequestWithDic:dic type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        if([responseObject[@"flag"] integerValue] == 1 ){
            
            [MBProgressHUD showSuccess:@"绑定成功"];
            [self.navigationController popViewControllerAnimated:YES];
            
        }else{
            
            [MBProgressHUD showError:responseObject[@"mess"]];
        }
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
         [MBProgressHUD showError:@"网络错误，请稍后重试"];
    
    }];
}

@end
