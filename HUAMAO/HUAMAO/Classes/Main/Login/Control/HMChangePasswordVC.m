//
//  HMChangePasswordVC.m
//  HUAMAO
//
//  Created by 孙密 on 17/5/17.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMChangePasswordVC.h"

#import "HMServiceTool.h"

@interface HMChangePasswordVC ()
<UITextFieldDelegate>

@property(weak,nonatomic)IBOutlet UIButton*Backbutton;

@property (weak, nonatomic) IBOutlet UIView *codeview;

@property(weak,nonatomic)IBOutlet UITextField*phonNum;


@property(weak,nonatomic)IBOutlet UITextField*codeNum;

@property(weak,nonatomic)IBOutlet UITextField*password;

@property(weak,nonatomic)IBOutlet UITextField*newpassword;

@property(weak,nonatomic)IBOutlet UIButton*SureButton;

@property(weak,nonatomic)IBOutlet UIButton*getCodeButton;

@property (weak, nonatomic) IBOutlet UITextField *codeImageFile;

@property (weak, nonatomic) IBOutlet UIView *codeImageAction;

@property (weak, nonatomic) IBOutlet UILabel *codelabel;
@property (weak, nonatomic) IBOutlet UIImageView *codeImage;

@end

@implementation HMChangePasswordVC



-(void)textFieldDidBeginEditing:(UITextField *)textField{
    

    textField.layer.borderColor = [UIColor redColor].CGColor;
    
}



-(void)textFieldDidEndEditing:(UITextField *)textField{

    
    textField.layer.borderColor = HMUIColorFromRgbAlpha(0x444444, 1).CGColor;

}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    [self.view endEditing:YES];
    
}

- (IBAction)backbuttonAction:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    [self creatUI];
}



-(void)creatUI{
    
    self.SureButton.backgroundColor= [UIColor redColor];//HMUIColorFromRgbAlpha(0xfdbe19 , 1);
    
    self.SureButton.layer.cornerRadius = HMCORNERRadius;
    
    self.SureButton.layer.masksToBounds = YES;
    
    self.SureButton.layer.borderColor = [UIColor redColor].CGColor;
    
//    self.codeImageAction.backgroundColor = HMUIColorFromRgbAlpha(0xfdbe19 , 1);

    self.codeImageAction.layer.cornerRadius = HMCORNERRadius;
    
//    self.codeImageAction.layer.masksToBounds = YES;
    
    self.codeImageFile.layer.borderWidth = 1;
    
    self.codeImageFile.layer.borderColor = [UIColor redColor].CGColor;
    
    
    self.codeview.layer.borderWidth = 1;
    
    self.codeview.layer.borderColor = [UIColor redColor].CGColor;
 
    
//    self.getCodeButton.backgroundColor= HMUIColorFromRgbAlpha(0xfdbe19 , 1);
    
    self.getCodeButton.layer.cornerRadius = HMCORNERRadius;
    
    self.getCodeButton.layer.borderWidth = 1;
    
    self.getCodeButton.layer.masksToBounds = YES;
    
    self.getCodeButton.layer.borderColor = [UIColor redColor].CGColor;

    [self setRadius:_phonNum];
    
    [self setRadius:_codeNum];
    
    [self setRadius:_password];
    
    [self setRadius:_newpassword];
    
    [self setRadius:_codeImageFile];
    
    self.phonNum.delegate = self;
    
    self.codeNum.delegate = self;
    
    self.password.delegate = self;
    
    self.newpassword.delegate = self;
    
    self.codeImageFile.delegate = self;
    
    [self.getCodeButton addTarget:self action:@selector(GetCodeAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.SureButton addTarget:self action:@selector(SureAction:) forControlEvents:UIControlEventTouchUpInside];
    
     [self.phonNum setValue:HMUIColorFromRgbAlpha(0xaeadad , 1) forKeyPath:@"_placeholderLabel.textColor"];
    
     [self.codeNum setValue:HMUIColorFromRgbAlpha(0xaeadad , 1) forKeyPath:@"_placeholderLabel.textColor"];
    
     [self.password setValue:HMUIColorFromRgbAlpha(0xaeadad , 1) forKeyPath:@"_placeholderLabel.textColor"];
    
     [self.newpassword setValue:HMUIColorFromRgbAlpha(0xaeadad , 1) forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.codeImageFile setValue:HMUIColorFromRgbAlpha(0xaeadad , 1) forKeyPath:@"_placeholderLabel.textColor"];

    
     [self.password addTarget:self action:@selector(PasswordChange:) forControlEvents:UIControlEventEditingChanged];
    
    [self.newpassword addTarget:self action:@selector(PasswordChange:) forControlEvents:UIControlEventEditingChanged];
    
    
    self.password.keyboardType = UIKeyboardTypeNumberPad;
    
    self.codeNum.keyboardType = UIKeyboardTypeNumberPad;
    
    self.phonNum.keyboardType = UIKeyboardTypeNumberPad;
    
    self.newpassword.keyboardType = UIKeyboardTypeNumberPad;
    
    
     self.codeImageFile.keyboardType = UIKeyboardTypeNumberPad;
    
     self.password.secureTextEntry = YES;
    
    
     self.newpassword.secureTextEntry = YES;
    
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageCodeActionn:)];
    
    [self.codeImageAction addGestureRecognizer:tap];
    
     [self.phonNum addTarget:self action:@selector(phoneChange:) forControlEvents:UIControlEventEditingChanged];
    
}

-(void)imageCodeActionn:(UITapGestureRecognizer *)tap{
    
    if(self.phonNum.text == nil || [self.phonNum.text isEqualToString:@""]){
        [MBProgressHUD showError:@"请输入电话号码"] ;  return;
    }
    
    _codelabel.text = @"";

    NSInteger nubtime = [[NSDate date]timeIntervalSince1970] ;
    
    NSString *strimageUrl = [NSString stringWithFormat:@"/wx/wxapiapp/code?phone=%@&date=%ld",self.phonNum.text,nubtime];
    
    NSString * urlencoding = [HMURL(strimageUrl) stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    [_codeImage sd_setImageWithURL:[NSURL URLWithString:urlencoding]];
    
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



-(void)SureAction:(UIButton *)button{
    

    if(self.phonNum.text == nil || [self.phonNum.text isEqualToString:@""]){
        return [MBProgressHUD showError:@"请输入账号"];
    }
    
    if(self.password.text == nil || [self.password.text isEqualToString:@""]){
        return [MBProgressHUD showError:@"请输入密码"];
    }
    
    if(self.codeNum.text == nil || [self.codeNum.text isEqualToString:@""]){
        return [MBProgressHUD showError:@"请输入验证码"];
    }
    
    if(![self isPureInt:self.password.text]){
        
        NSLog(@"%@",_password.text);
        return [MBProgressHUD showError:@"密码必须为6位数字"];
        
    }
    
    if(![self isPureInt:self.newpassword.text]){
   
        return [MBProgressHUD showError:@"密码必须为6位数字"];
        
    }
    
    if(self.newpassword.text == nil || [self.newpassword.text isEqualToString:@""]){
        return [MBProgressHUD showError:@"请输入新密码"];
        
    }

    if(![self.newpassword.text isEqualToString:self.password.text]){
        
        return [MBProgressHUD showError:@"新密码与旧密码不相同"];
        
    }
    
    NSMutableDictionary *dicSouce = [[NSMutableDictionary alloc]init];
    
    
    dicSouce[@"method"] =  @"czPass";
    
    dicSouce[@"phone"] = self.phonNum.text;
    
    dicSouce[@"code"] = self.codeNum.text;
    
    dicSouce[@"newpass"] = self.newpassword.text;

    [MBProgressHUD showMessage:@"正在加载..."];
    
    [HMServiceTool RequestWithDic:dicSouce type:URLtypeAPP RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        
        NSLog(@"%@",responseObject);
        
        [MBProgressHUD hideHUD];
        
        if([responseObject[@"flag"] integerValue] ==1 ){
            
            [MBProgressHUD showSuccess:@"修改成功"];
            
            [self.navigationController popViewControllerAnimated:YES];
            
            
        }else{
            
            [MBProgressHUD showError:responseObject[@"mess"]];
            
        }
    
        
        
        
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        
        [MBProgressHUD hideHUD];
        
        [MBProgressHUD showError:@"服务器未连接"];
        
        
    }];

    
    
}


-(void)GetCodeAction:(UIButton *)button{
    
    if(self.phonNum.text == nil || [self.phonNum.text isEqualToString:@""]){
        [MBProgressHUD showError:@"请输入电话号码"]; return;
    }
    
    if(self.codeImageFile.text == nil || [self.codeImageFile.text isEqualToString:@""]){
        [MBProgressHUD showError:@"请输入图中之和"]; return;
    }
    
    NSMutableDictionary *dicSouce = [[NSMutableDictionary alloc]init];
    
    
    dicSouce[@"method"] =  @"getSmsMesCode_zhmm";
    
    dicSouce[@"phone"] = self.phonNum.text;
    
    dicSouce[@"type"] = @"3";
    
    dicSouce[@"smsMesCode_html"] = self.codeImageFile.text;
    
    [MBProgressHUD showMessage:@"正在加载..."];
    
    [HMServiceTool RequestWithDic:dicSouce type:URLtypeAPP RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        
        NSLog(@"%@",responseObject);
        
        [MBProgressHUD hideHUD];
        
        if([responseObject[@"flag"] integerValue] == 1 ){
            
            [MBProgressHUD showSuccess:@"请查收短信，3分钟有效"];
        }else{
            
            [MBProgressHUD showSuccess:responseObject[@"mess"]];
            
        }
        
        
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        
        [MBProgressHUD hideHUD];
        
        [MBProgressHUD showError:@"服务器未连接"];
        
        
    }];
    
}


-(void)setRadius:(UIView *)view{
    
    
    view.backgroundColor = [UIColor clearColor];
    
    view.layer.cornerRadius = HMCORNERRadius;
    
    view.layer.borderColor = HMUIColorFromRgbAlpha(0x444444, 1).CGColor;
    view.layer.borderWidth = 1;
    
    // 超出layer边框的全部裁剪掉
    view.layer.masksToBounds = YES;
    
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
