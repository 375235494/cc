//
//  HMBindingBank.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/18.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMBindingBank.h"

#import "HMwithdrawalModel.h"

#import "HMServiceTool.h"

@interface HMBindingBank ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *pepeol;

@property (weak, nonatomic) IBOutlet UITextField *bank;

@property (weak, nonatomic) IBOutlet UITextField *bankNumber;

@property (weak, nonatomic) IBOutlet UITextField *provinces;

@property (weak, nonatomic) IBOutlet UITextField *city;

@property (weak, nonatomic) IBOutlet UIButton *Surebutton;
//省份证ID
@property (weak, nonatomic) IBOutlet UITextField *sfzID;

@end

@implementation HMBindingBank

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    [self setRadiusWithTextField:self.pepeol];
    
     [self setRadiusWithTextField:self.bank];
    
     [self setRadiusWithTextField:self.bankNumber];
    
     [self setRadiusWithTextField:self.provinces];
    
     [self setRadiusWithTextField:self.city];
    
     [self setRadiusWithTextField:self.sfzID];
    
     self.Surebutton.layer.cornerRadius = HMCORNERRadius;
    
}

-(void)setRadiusWithTextField :(UITextField *)textfield{
    
    [textfield setValue:HMUIColorFromRgbAlpha(0xaeadad , 1) forKeyPath:@"_placeholderLabel.textColor"];
    
    textfield.layer.cornerRadius = HMCORNERRadius;
    
    textfield.layer.borderColor = HMUIColorFromRgbAlpha(0x444444, 1).CGColor;
    textfield.layer.borderWidth = 1;
    
    textfield.delegate = self;
    
}


-(void)textFieldDidBeginEditing:(UITextField *)textField

{
    textField.textColor = HMUIColorFromRgbAlpha(0x9b0802, 1);
    textField.layer.cornerRadius = HMCORNERRadius;
    textField.layer.masksToBounds =YES;
    textField.layer.borderColor=[[UIColor redColor]CGColor];
    textField.layer.borderWidth= 1.0f;
    [textField setValue:HMUIColorFromRgbAlpha(0x9b0802, 1) forKeyPath:@"_placeholderLabel.textColor"];

}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    textField.textColor = HMUIColorFromRgbAlpha(0xaeadad, 1);
    
    textField.layer.cornerRadius = HMCORNERRadius;
    textField.layer.masksToBounds =YES;
    
    textField.layer.borderColor = HMUIColorFromRgbAlpha(0x444444, 1).CGColor;
    textField.layer.borderWidth = 1;
    
    [textField setValue:HMUIColorFromRgbAlpha(0xaeadad , 1) forKeyPath:@"_placeholderLabel.textColor"];
}



- (IBAction)bankButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)sureButton:(id)sender {
    
    NSLog(@"确认");
    
    NSMutableDictionary *dicSouce = [[NSMutableDictionary alloc]init];
    
    dicSouce[@"method"] =  @"saveBank";
    
    dicSouce[@"openid"] = [[NSUserDefaults standardUserDefaults]objectForKey:OPENId];
    
    
    if (self.pepeol.text.length > 0) {
        dicSouce[@"username"] = self.pepeol.text;
    }else{
        
        dicSouce[@"username"] = self.withdrawalMessage.PhoneNumber;
    }
    
    dicSouce[@"bankno"] = self.bankNumber.text;
    
    dicSouce[@"bankprov"] = self.provinces.text;
    
    dicSouce[@"bankcity"] = self.city.text;
    
    dicSouce[@"bankflag"] = @"0";
    
    if (self.bank.text.length > 0) {
        
        dicSouce[@"bankname"] = self.bank.text;
        
    } else {
        
        dicSouce[@"bankname"] = self.withdrawalMessage.bank;
    }
    
    dicSouce[@"sfzid"] = self.sfzID.text;
    
    dicSouce[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:HMSESSIONId];
    
    [MBProgressHUD showMessage:@"正在加载..."];
    
    [HMServiceTool RequestWithDic:dicSouce type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        NSLog(@"%@",responseObject);
        
        [MBProgressHUD hideHUD];
        
        if([responseObject[@"flag"] integerValue] == 1 ){
            
            [MBProgressHUD showSuccess:@"绑定成功"];
            
            [self.navigationController popViewControllerAnimated:YES];
            
        }else{
            
            [MBProgressHUD showError:responseObject[@"mess"]];
        }
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        [MBProgressHUD hideHUD];
        
        [MBProgressHUD showError:@"服务器未连接"];
        
    }];
    

}


@end
