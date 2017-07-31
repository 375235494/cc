//
//  HMRegisteredTextView.m
//  HUAMAO
//
//  Created by 孙密 on 17/5/17.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMRegisteredTextView.h"

#import "HMRiskwarningMask.h"

#import "HMServiceTool.h"

@interface HMRegisteredTextView()
@property (weak, nonatomic) IBOutlet UITextField *imageCode;

@property(weak,nonatomic)IBOutlet UITextField * number;

@property(weak,nonatomic)IBOutlet UITextField *passWord;

@property(weak,nonatomic)IBOutlet UITextField *YQnumber;

@property(weak,nonatomic)IBOutlet UITextField *codeNumber;

@property(weak,nonatomic)IBOutlet UIButton *SureButton;

@property(weak,nonatomic)IBOutlet UIButton *getCodeButton;

@property(weak,nonatomic)IBOutlet UIButton *warningButton;

@property(weak,nonatomic)IBOutlet UIButton *agreementButton;
@property (weak, nonatomic) IBOutlet UIView *imageCodeActionV;


@property (weak, nonatomic) IBOutlet UIImageView *codeimage;

@property (weak, nonatomic) IBOutlet UILabel *codelable;
@property (weak, nonatomic) IBOutlet UIView *backAlpView;

@end

@implementation HMRegisteredTextView


-(void)awakeFromNib{
    
    [super awakeFromNib];
    
//    [self setRadius:_number];
//    
//    [self setRadius:_passWord];
//    
//    [self setRadius:_YQnumber];
//    
//    [self setRadius:_codeNumber];
//    
//    [self setRadius:_imageCode];
    
//    self.SureButton.backgroundColor= HMUIColorFromRgbAlpha(0xfdbe19 , 1);
    
//    self.SureButton.layer.cornerRadius = HMCORNERRadius;
//    
//    
//    self.SureButton.layer.masksToBounds = YES;
    
    
    self.backAlpView.layer.cornerRadius = 25;
    
    
    
    
//    self.getCodeButton.backgroundColor= HMUIColorFromRgbAlpha(0xfdbe19 , 1);
    
    self.getCodeButton.layer.cornerRadius = HMCORNERRadius;
    
    self.getCodeButton.layer.borderWidth = 1;
    
    self.getCodeButton.layer.borderColor = [UIColor redColor].CGColor;
    
    [self.getCodeButton addTarget:self action:@selector(GetCodeAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.getCodeButton.layer.masksToBounds = YES;
    
    [self.warningButton addTarget:self action:@selector(warningButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(warningRead) name:@"WarningSureActionNotifica" object:nil];
    
    
    
    [self.SureButton addTarget:self action:@selector(SureActon:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.agreementButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    
    
    [self.number setValue:HMUIColorFromRgbAlpha(0xffffff , 0.5) forKeyPath:@"_placeholderLabel.textColor"];
    
     [self.passWord setValue:HMUIColorFromRgbAlpha(0xffffff , 0.5)forKeyPath:@"_placeholderLabel.textColor"];
    
     [self.YQnumber setValue:HMUIColorFromRgbAlpha(0xffffff , 0.5) forKeyPath:@"_placeholderLabel.textColor"];
    
     [self.codeNumber setValue:HMUIColorFromRgbAlpha(0xffffff , 0.5) forKeyPath:@"_placeholderLabel.textColor"];
    [self.imageCode setValue:HMUIColorFromRgbAlpha(0xffffff , 0.5)forKeyPath:@"_placeholderLabel.textColor"];

    self.number.keyboardType = UIKeyboardTypeNumberPad;
    
    self.passWord.keyboardType = UIKeyboardTypeNumberPad;
    
//    self.YQnumber.keyboardType = UIKeyboardTypeNumberPad;
    
    self.codeNumber.keyboardType = UIKeyboardTypeNumberPad;
    
     self.imageCode.keyboardType = UIKeyboardTypeNumberPad;
    
     [self.passWord addTarget:self action:@selector(PasswordChange:) forControlEvents:UIControlEventEditingChanged];
    
     self.passWord.secureTextEntry = YES;
    
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageCodeActionn:)];
 
    [self.imageCodeActionV addGestureRecognizer:tap];
    
//    self.imageCodeActionV.backgroundColor = HMUIColorFromRgbAlpha(0xfdbe19 , 1);
    
    self.imageCodeActionV.layer.cornerRadius = HMCORNERRadius;

    
    self.imageCodeActionV.layer.masksToBounds = YES;
    
    
    self.imageCodeActionV.layer.borderWidth = 1;
    
    self.imageCodeActionV.layer.borderColor = [UIColor redColor].CGColor;
    
    
    
    
    self.passWord.rightViewMode = UITextFieldViewModeAlways;
    
    UIButton *buttonEye = [[UIButton alloc]init];
    
    buttonEye.frame = CGRectMake(0, 0, 30, 30);
    
    [buttonEye setImage:[UIImage imageNamed:@"眼睛-闭着"] forState:UIControlStateNormal];
    
    [buttonEye setImage:[UIImage imageNamed:@"眼睛睁着"] forState:UIControlStateSelected];
    
    [buttonEye addTarget:self action:@selector(EyeAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.passWord.rightView = buttonEye;
    
    
    
    self.number.rightViewMode = UITextFieldViewModeAlways;
    
    
    self.number.rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    
    
    
    self.YQnumber.rightViewMode = UITextFieldViewModeAlways;
    
    
    self.YQnumber.rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];

    
     [self.warningButton setTitleColor:HMUIColorFromRgbAlpha(0xffffff , 0.5) forState:UIControlStateNormal];
    
    [self.number addTarget:self action:@selector(phoneChange:) forControlEvents:UIControlEventEditingChanged];

}

-(void)EyeAction:(UIButton *)button{
    
    button.selected = !button.selected;
    
    self.passWord.secureTextEntry = !button.selected;
    
    
}



-(void)imageCodeActionn:(UITapGestureRecognizer *)tap{
    
    if(self.number.text == nil || [self.number.text isEqualToString:@""]){
        [MBProgressHUD showError:@"请输入电话号码"] ;  return;
    }
    
    _codelable.text = @"";


    NSInteger nubtime = [[NSDate date]timeIntervalSince1970] ;

    NSString *strimageUrl = [NSString stringWithFormat:@"/wx/wxapiapp/code?phone=%@&date=%ld",self.number.text,nubtime];

    NSString * urlencoding = [HMURL(strimageUrl) stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    

    [_codeimage sd_setImageWithURL:[NSURL URLWithString:urlencoding]];
 
}


-(void)PasswordChange:(UITextField*)passward{
    
    if(passward.text.length > 6){
        
        passward.text = [passward.text substringToIndex:6];;
        
    }
    
}


-(void)phoneChange:(UITextField*)passward{
    
    if(passward.text.length > 11){
        
        passward.text = [passward.text substringToIndex:11];;
        
    }
    
}


- (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

-(void)SureActon:(UIButton *)button{
    

    if(self.number.text == nil || [self.number.text isEqualToString:@""]){
        [MBProgressHUD showError:@"请输入账号"]; return;
    }
    
    if(self.passWord.text == nil || [self.passWord.text isEqualToString:@""]){
        [MBProgressHUD showError:@"请输入密码"]; return;
    }
    
    if(self.codeNumber.text == nil || [self.codeNumber.text isEqualToString:@""]){
        [MBProgressHUD showError:@"请输入验证码"]; return;
    }
    
    if(self.YQnumber.text == nil || [self.YQnumber.text isEqualToString:@""]){
        [MBProgressHUD showError:@"请输入邀请码"]; return;
    }
    
    
    
    if(![self isPureInt:self.passWord.text]){
        
        NSLog(@"%@",_passWord.text);
        [MBProgressHUD showError:@"密码必须为6位数字"]; return;
        
    }
 
    
    
    
    if(self.warningButton.selected ==NO){
        
        [MBProgressHUD showError:@"请确认我已阅读风险协议"];  return;
        
    }
    
    
    
    
    
    
    NSMutableDictionary *dicSouce = [[NSMutableDictionary alloc]init];
    
    
    dicSouce[@"method"] =  @"regUser";
    
    dicSouce[@"phone"] = self.number.text;
    
    dicSouce[@"code"] = self.codeNumber.text;
    
    dicSouce[@"pass"] = self.passWord.text;
    
    dicSouce[@"yqm"] = self.YQnumber.text;
    
    [MBProgressHUD showMessage:@"正在加载..."];
    
    [HMServiceTool RequestWithDic:dicSouce type:URLtypeAPP RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        
        NSLog(@"%@",responseObject);
        
        [MBProgressHUD hideHUD];
        
        
        if([responseObject[@"flag"] integerValue] ==1 ){
            
            [MBProgressHUD showSuccess:@"注册成功"];
        }else{
            
            
            [MBProgressHUD showError:responseObject[@"mess"]];
            
        }

        
        
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        
        [MBProgressHUD hideHUD];
        
        [MBProgressHUD showError:@"服务器未连接"];
        
        
    }];

    
    
    
}


-(void)GetCodeAction:(UIButton *)button{
    
    if(self.number.text == nil || [self.number.text isEqualToString:@""]){
        return [MBProgressHUD showError:@"请输入电话号码"];
    }
    
    
    if(self.imageCode.text == nil || [self.imageCode.text isEqualToString:@""]){
        
        [MBProgressHUD showError:@"请输入图中之和"]; return;
    }
    
    if(self.YQnumber.text == nil || [self.YQnumber.text isEqualToString:@""]){
        
        [MBProgressHUD showError:@"请输入邀请码"]; return;
    }
    
    
    NSMutableDictionary *dicSouce = [[NSMutableDictionary alloc]init];
    
    
    dicSouce[@"method"] =  @"getSmsMesCode_html";
    
    dicSouce[@"phone"] = self.number.text;
    
    dicSouce[@"type"] = @"1";
    
    dicSouce[@"yqm"] = self.YQnumber.text;
    
    dicSouce[@"smsMesCode_html"] = self.imageCode.text;
    
    [MBProgressHUD showMessage:@"正在加载..."];
    
    [HMServiceTool RequestWithDic:dicSouce type:URLtypeAPP RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        
        NSLog(@"%@",responseObject);
        
        [MBProgressHUD hideHUD];
        
        if([responseObject[@"flag"] integerValue] == 1 ){
            
            [MBProgressHUD showSuccess:@"请查收短信，3分钟有效"];
            
            if(self.Delegeat && [self.Delegeat respondsToSelector:@selector(RegisteredTextViewRegisSuccesDo:)]){
                
                [self.Delegeat RegisteredTextViewRegisSuccesDo:self];
                
            }
            
            
        }else{
            
               [MBProgressHUD showError:responseObject[@"mess"]];
            
        }
        

        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        
        [MBProgressHUD hideHUD];
        
        [MBProgressHUD showError:@"服务器未连接"];
        
        
    }];
    
}


-(void)warningButton:(UIButton *)button{
    
    button.selected = !button.selected;
    
}

-(void)warningRead{
    
    self.warningButton.selected = YES;
}


- (IBAction)riskWarningAction:(UIButton *)sender {
    
    [[[HMRiskwarningMask alloc]init] ShowRiskwarningView];
    
}

+(instancetype)RegisteredTextView{
    
    
    return [[[NSBundle mainBundle]loadNibNamed:@"HMRegisteredTextView" owner:self options:nil]lastObject];
}


-(void)setRadius:(UIView *)view{
    
    
    view.backgroundColor = [UIColor clearColor];
    
    view.layer.cornerRadius = HMCORNERRadius;
    
    view.layer.borderColor = HMUIColorFromRgbAlpha(0xc1a952, 1).CGColor;
    view.layer.borderWidth = 1;
    
    // 超出layer边框的全部裁剪掉
    view.layer.masksToBounds = YES;
    
}

@end
