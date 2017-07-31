//
//  HMLoginTextView.m
//  HUAMAO
//
//  Created by 孙密 on 17/5/17.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMLoginTextView.h"

@interface HMLoginTextView()
<UITextFieldDelegate>

@property(weak,nonatomic)IBOutlet UILabel*forgetNum;
@property(weak,nonatomic)IBOutlet UITextField *viewTextNum;

@property(weak,nonatomic)IBOutlet UITextField *passWord;


@property(weak,nonatomic)IBOutlet UIButton *SureButton;

@property(weak,nonatomic)IBOutlet UIButton *RememberPassword;

@property (weak, nonatomic) IBOutlet UIView *backView;


@property(weak,nonatomic)UIImageView *phoneNumIcon;

@property(weak,nonatomic)UIImageView *passWordIcon;

@end

@implementation HMLoginTextView



-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    if(textField == self.viewTextNum){
        
        self.phoneNumIcon.image = [UIImage imageNamed:@"用户名选中"];
    }
    
    if(textField == self.passWord){
        
        self.passWordIcon.image = [UIImage imageNamed:@"密码选中"];
    }
    
    textField.textColor =  HMUIColorFromRgbAlpha(0xfe1c01, 1);
    
}



-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    if(_RememberPassword.selected==YES){
        
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"RememberPassword"];
        
        [[NSUserDefaults standardUserDefaults]setObject:self.passWord.text forKey:@"PassWord"];
        
        [[NSUserDefaults standardUserDefaults]setObject:self.viewTextNum.text forKey:@"PhoneNumber"];
        
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
    
    
    if(textField == self.viewTextNum){
        
        self.phoneNumIcon.image = [UIImage imageNamed:@"用户名未选"];
    }
    
    if(textField == self.passWord){
        
        self.passWordIcon.image = [UIImage imageNamed:@"密码未选"];
    }
    
    textField.textColor =  HMUIColorFromRgbAlpha(0xffffff, 0.5);
}


-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    self.forgetNum.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(ForgetNUMAction:)];
    
    [self.forgetNum addGestureRecognizer:tap];
    
    self.viewTextNum.backgroundColor = [UIColor clearColor];
//    
//    self.viewTextNum.layer.cornerRadius = HMCORNERRadius;
//    
//    self.viewTextNum.layer.borderColor = HMUIColorFromRgbAlpha(0xc1a952, 1).CGColor;
//    self.viewTextNum.layer.borderWidth = 1;
    
    self.viewTextNum.delegate =self;
    
    // 超出layer边框的全部裁剪掉
//    self.viewTextNum.layer.masksToBounds = YES;
    
    self.passWord.delegate = self;
    
    self.passWord.backgroundColor = [UIColor clearColor];
    
//    self.passWord.layer.cornerRadius = HMCORNERRadius;
//    
//    self.passWord.layer.borderColor = HMUIColorFromRgbAlpha(0xc1a952, 1).CGColor;
//    self.passWord.layer.borderWidth = 1;
//    
//    // 超出layer边框的全部裁剪掉
//    self.passWord.layer.masksToBounds = YES;
    
    self.SureButton.backgroundColor= [UIColor clearColor];//HMUIColorFromRgbAlpha(0xfdbe19 , 1);
    
    self.SureButton.layer.cornerRadius = HMCORNERRadius;
    
    
    self.SureButton.layer.masksToBounds = YES;
    
    
    [self.SureButton addTarget:self action:@selector(SureButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.RememberPassword addTarget:self action:@selector(RememberPasswordAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.RememberPassword.selected = [[NSUserDefaults standardUserDefaults]floatForKey:@"RememberPassword"];
 
 
    
    self.passWord.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"PassWord"];
    
    self.viewTextNum.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"PhoneNumber"];
    
    
    self.RememberPassword.selected = [[NSUserDefaults standardUserDefaults] integerForKey:@"RememberPassword"];
    
    
    
    
    [self.viewTextNum setValue:HMUIColorFromRgbAlpha(0xffffff , 0.5) forKeyPath:@"_placeholderLabel.textColor"];
    
    
    [self.passWord setValue:HMUIColorFromRgbAlpha(0xffffff , 0.5) forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.passWord addTarget:self action:@selector(PasswordChange:) forControlEvents:UIControlEventEditingChanged];
    
    self.passWord.keyboardType = UIKeyboardTypeNumberPad;

    self.viewTextNum.keyboardType = UIKeyboardTypeNumberPad;

    self.backView.layer.cornerRadius = 25 ;
    
    
    
    self.viewTextNum.leftViewMode = UITextFieldViewModeAlways;
    
    UIImageView *loginIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"用户名未选"]];
    
    loginIcon.contentMode = UIViewContentModeCenter;
    
    loginIcon.frame = CGRectMake(0, 0, 30, 30);
    
    self.viewTextNum.leftView = loginIcon;
    
    
    
    
    self.passWord.leftViewMode = UITextFieldViewModeAlways;
    
    UIImageView *passwordIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"密码未选"]];
    
    passwordIcon.contentMode = UIViewContentModeCenter;
    
    passwordIcon.frame = CGRectMake(0, 0, 30, 30);
    
    self.passWord.leftView = passwordIcon;
    
    
    
    self.passWord.rightViewMode = UITextFieldViewModeAlways;
    
    UIButton *buttonEye = [[UIButton alloc]init];
    
    buttonEye.frame = CGRectMake(0, 0, 30, 30);
    
    [buttonEye setImage:[UIImage imageNamed:@"眼睛-闭着"] forState:UIControlStateNormal];
    
    [buttonEye setImage:[UIImage imageNamed:@"眼睛睁着"] forState:UIControlStateSelected];
    
    [buttonEye addTarget:self action:@selector(EyeAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    self.passWord.rightView = buttonEye;
    
    
    self.passWord.secureTextEntry = YES;
    
    
    
  
    [self.RememberPassword setTitleColor:HMUIColorFromRgbAlpha(0x9A9A9A ,1) forState:UIControlStateNormal];

    
    self.RememberPassword.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    
    self.forgetNum.textColor = HMUIColorFromRgbAlpha(0xffffff , 0.5);
    
    
    _passWordIcon = passwordIcon;
    
    _phoneNumIcon = loginIcon;
    
    
    
     self.viewTextNum.rightViewMode = UITextFieldViewModeAlways;
    
    
    self.viewTextNum.rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    
     [self.viewTextNum addTarget:self action:@selector(phoneChange:) forControlEvents:UIControlEventEditingChanged];
    
}


-(void)EyeAction:(UIButton *)button{
    
    button.selected = !button.selected;
    
    self.passWord.secureTextEntry = !button.selected;
    
    
}


-(void)phoneChange:(UITextField*)passward{
    
    if(passward.text.length > 11){
        
        passward.text = [passward.text substringToIndex:11];;
        
    }
    
}


-(void)PasswordChange:(UITextField*)passward{
    
    if(passward.text.length > 6){
        
        passward.text = [passward.text substringToIndex:6];;
        
    }
    
}


- (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}


-(void)RememberPasswordAction:(UIButton *)button{
    
    button.selected = !button.selected;
    
    if(button.selected==YES){
        
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"RememberPassword"];
        
        [[NSUserDefaults standardUserDefaults]setObject:self.passWord.text forKey:@"PassWord"];
        
        [[NSUserDefaults standardUserDefaults]setObject:self.viewTextNum.text forKey:@"PhoneNumber"];
        
        [[NSUserDefaults standardUserDefaults]synchronize];
        
    }else{
        
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"RememberPassword"];
        
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"PassWord"];
        
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"PhoneNumber"];
        
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
}



-(void)ForgetNUMAction:(UITapGestureRecognizer *)tap{
    
    if(self.Delegeat && [self.Delegeat respondsToSelector:@selector(LoginTextViewForgetNumAction:)]){
        
        [self.Delegeat LoginTextViewForgetNumAction:self];
    }
    
}


-(void)SureButtonAction :(UIButton *)sureButton{
    
    
    if(self.viewTextNum.text==nil||[self.viewTextNum.text isEqualToString:@""]){
        
       return [MBProgressHUD showError:@"请输入账号"];
        
        
    }
    
    if(self.passWord.text==nil||[self.passWord.text isEqualToString:@""]){
        
       return [MBProgressHUD showError:@"请输入密码"];
  
    }
    
    
    if(![self isPureInt:self.passWord.text]){
        
        NSLog(@"%@",_passWord.text);
        return [MBProgressHUD showError:@"密码必须为6位数字"];
        
    }
    
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    
    dic[@"method"] = @"loginbyphone";
    
    dic[@"phone"] = self.viewTextNum.text;
    
    
    dic[@"pass"] = self.passWord.text;
    
    
    dic[@"usource"] = @"2";
    
    if(self.Delegeat && [self.Delegeat respondsToSelector:@selector(loginSureAction:WithSouceDic:)]){

        
        [self.Delegeat loginSureAction:self WithSouceDic:dic];
    }
    
}


+(instancetype)LoginTextView{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"HMLoginTextView" owner:self options:nil] lastObject];
}



-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
