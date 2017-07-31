//
//  HMwithdrawalView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/7/26.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMwithdrawalView.h"

#import "HMwithdrawalModel.h"

@interface HMwithdrawalView ()

@property (weak, nonatomic) IBOutlet UIView *moneyBordView;

@property (weak, nonatomic) IBOutlet UITextField *Upmoney;

@property (weak, nonatomic) IBOutlet UITextField *CodeNum;
@property (weak, nonatomic) IBOutlet UIButton *bankButton;
@property (weak, nonatomic) IBOutlet UIButton *SureButton;

@property (weak, nonatomic) IBOutlet UIButton *codeButton;
@property (weak, nonatomic) IBOutlet UILabel *money;

@property (weak, nonatomic) IBOutlet UILabel *textNmae;
@property (weak, nonatomic) IBOutlet UILabel *tecxtPeopelNum;
@property (weak, nonatomic) IBOutlet UILabel *bankName;
@property (weak, nonatomic) IBOutlet UILabel *textBankNum;
@property (weak, nonatomic) IBOutlet UIImageView *animImageV;


@end

@implementation HMwithdrawalView


-(void)awakeFromNib{
    
    [super awakeFromNib];

    self.bankButton.layer.cornerRadius = 15;
    self.bankButton.layer.masksToBounds = YES;
    //
    //    self.bankButton.layer.borderColor = HMUIColorFromRgbAlpha(0x9b0802, 1).CGColor;
    //    self.bankButton.layer.borderWidth = 1;
    //
    //
    //    self.bankButton.adjustsImageWhenHighlighted = NO;
    [self.CodeNum setValue:HMUIColorFromRgbAlpha(0x808181 , 1) forKeyPath:@"_placeholderLabel.textColor"];
    
    self.CodeNum.layer.cornerRadius = 5;
    
    self.CodeNum.layer.borderColor = HMUIColorFromRgbAlpha(0x808181, 1).CGColor;
    self.CodeNum.layer.borderWidth = 1;
    
    
    [self.Upmoney setValue:HMUIColorFromRgbAlpha(0x808181 , 1) forKeyPath:@"_placeholderLabel.textColor"];
    
    //    self.Upmoney.layer.cornerRadius = 20;
    
    //    self.Upmoney.layer.borderColor = HMUIColorFromRgbAlpha(0x808181, 1).CGColor;
    //    self.Upmoney.layer.borderWidth = 1;
    
    self.codeButton.layer.cornerRadius = HMCORNERRadius;
    self.codeButton.layer.masksToBounds = YES;
    
    //    self.codeButton.layer.borderColor = HMUIColorFromRgbAlpha(0x9b0802, 1).CGColor;
    //    self.codeButton.layer.borderWidth = 1;
    
    self.moneyBordView.layer.borderColor = HMUIColorFromRgbAlpha(0x808181, 1).CGColor;
    
    self.moneyBordView.layer.borderWidth = 1;
    
    self.moneyBordView.layer.cornerRadius = 20;
    
    self.codeButton.adjustsImageWhenHighlighted = NO;
    
    
    self.SureButton.layer.cornerRadius = 20;
    
    self.bankButton.layer.masksToBounds = YES;
    
    
    
    NSMutableArray * arayImg = [NSMutableArray array];
    
    [arayImg addObject:[UIImage imageNamed:@"喇叭"]];
    
    [arayImg addObject:[UIImage imageNamed:@"空白喇叭"]];
    
    //    [self.animImageV setAnimationRepeatCount:3];
    
    [self.animImageV setAnimationImages:arayImg];
    
    [self.animImageV setAnimationDuration:0.8];
    
    [self.animImageV startAnimating];
    
    self.Upmoney.keyboardType = UIKeyboardTypeNumberPad;

    
}


+(instancetype)withdrawalView{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"HMwithdrawalView" owner:self options:nil] lastObject];
    
    
}


-(void)setWithdrawalMessage:(HMwithdrawalModel *)withdrawalMessage{
    
    _withdrawalMessage = withdrawalMessage;
    
    self.money.text = [NSString stringWithFormat:@"%.f 豆", [self.withdrawalMessage.strMoney floatValue] ];
    self.money.textColor = HMUIColorFromRgbAlpha(0x9b0802, 1);
    
    if (self.withdrawalMessage.Name.length > 0) {
        self.textNmae.text = [NSString stringWithFormat:@"姓名:%@",self.withdrawalMessage.Name ];
        
        //        [self setUpTypeTextfiled:self.name];
    }
    
    if (self.withdrawalMessage.bank.length > 0) {
        self.bankName.text = [NSString stringWithFormat:@"开户行:%@",self.withdrawalMessage.bank ];
        
        //        [self setUpTypeTextfiled:self.bank];
    }
    
    if (self.withdrawalMessage.bankNumber.length > 0) {
        self.textBankNum.text = [NSString stringWithFormat:@"银行卡号:%@",self.withdrawalMessage.bankNumber];
        //        [self setUpTypeTextfiled:self.bankNum];
    }
    
    if (self.withdrawalMessage.peopelNum.length > 0) {
        self.tecxtPeopelNum.text = [NSString stringWithFormat:@"身份证号码:%@",self.withdrawalMessage.peopelNum];
        //        [self setUpTypeTextfiled:self.bankNum];
    }

    
}




- (IBAction)BackVC:(id)sender {
    
//    [self.navigationController popViewControllerAnimated:YES];
    
    if(self.Delegeat && [self.Delegeat respondsToSelector:@selector(Back:)]){
        
        [self.Delegeat Back:self];
        
    }
    
}



- (IBAction)codeActon:(UIButton *)sender {
    
    
    NSMutableDictionary *dicSouce = [[NSMutableDictionary alloc]init];
    
    
    dicSouce[@"method"] =  @"getSmsMesCode_tixian";
    
    dicSouce[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:HMSESSIONId];
    
    dicSouce[@"openid"] = [[NSUserDefaults standardUserDefaults]objectForKey:OPENId];
    
    dicSouce[@"uid"] = self.mUid;
    
    [MBProgressHUD showMessage:@"正在加载..."];
    
    [HMServiceTool RequestWithDic:dicSouce type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        
        NSLog(@"%@",responseObject);
        
        [MBProgressHUD hideHUD];
        
        if([responseObject[@"flag"] integerValue] == 1 ){
            
            [MBProgressHUD showSuccess:@"请查收短信，3分钟有效"];
            
            
        }else{
            
            //            [MBProgressHUD showError:responseObject[@"mess"]];
            
        }
        
        
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        
        [MBProgressHUD hideHUD];
        
        [MBProgressHUD showError:@"服务器未连接"];
        
        
    }];
    
    
    
}

- (IBAction)bankAction:(UIButton *)sender {
    
    if(self.Delegeat && [self.Delegeat respondsToSelector:@selector(CardbindingDoing:)]){
        
        
        [self.Delegeat CardbindingDoing:self];
    }

    
}
- (IBAction)sureAction:(UIButton *)sender {
    
    
    NSMutableDictionary *dicSouce = [[NSMutableDictionary alloc]init];
    
    
    dicSouce[@"method"] =  @"usercash";
    
    dicSouce[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:HMSESSIONId];
    
    dicSouce[@"openid"] = [[NSUserDefaults standardUserDefaults]objectForKey:OPENId];
    
    dicSouce[@"code"] = self.CodeNum.text;
    
    dicSouce[@"money"] = self.Upmoney.text;
    
    [MBProgressHUD showMessage:@"正在加载..."];
    
    [HMServiceTool RequestWithDic:dicSouce type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        
        NSLog(@"%@",responseObject);
        
        [MBProgressHUD hideHUD];
        
        
        if([responseObject[@"flag"] integerValue] == 1 ){
            
            [MBProgressHUD showSuccess:@"提现成功"];
            
            
            [self BackVC:nil];
            
//            [self.navigationController popViewControllerAnimated:YES];
            
            
        }else{
            
            [MBProgressHUD showError:responseObject[@"mess"]];
            
        }
        
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        
        [MBProgressHUD hideHUD];
        
        [MBProgressHUD showError:@"服务器未连接"];
        
        
    }];
    
    
}



@end
