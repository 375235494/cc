//
//  HMFeedBackVC.m
//  HUAMAO
//  Created by  on 2017/5/17.
//  Copyright © 2017年 陈臣. All rights reserved.


#import "HMFeedBackVC.h"
#import "HMPlaceholderTextView.h"

@interface HMFeedBackVC ()<UITextViewDelegate>
//带有提示文字的文本框
@property (weak, nonatomic) IBOutlet HMPlaceholderTextView *placeholderView;
//提交按钮
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;
// 内容view
@property (weak, nonatomic) IBOutlet UIView *contentView;
//状态label
@property (weak, nonatomic) IBOutlet UILabel *statuesLabel;

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
//contentView高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bgView;
//Placeholder View
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *PlaceholderViewH;

//手机号码框高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *phoneH;

//提交按钮距离顶部高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *submitTopH;

//提交按钮的高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *submitBtnH;

@end

@implementation HMFeedBackVC

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"国翠商城";
    
    self.view.backgroundColor = kCOLOR_R_G_B_A(24, 24, 24, 1);
    //设置文本输入框
    [self setupTextView];
    //设置手机号占位文字的颜色
    [self setUpplaceholderColor];
    
    [self setIphoneScreenAdaptation];

}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.placeholderView becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.placeholderView resignFirstResponder];
}


- (void)setupTextView
{
    
    //设置TextView光标位置
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.placeholderView.layer.cornerRadius = 5;
    self.placeholderView.layer.masksToBounds = YES;
    
    self.contentView.layer.borderWidth = 1;
    self.contentView.layer.borderColor = HMUIColorFromRgbAlpha(0xe91a01, 1).CGColor;
    self.contentView.backgroundColor = HMColor(30, 30, 30);
    self.placeholderView.placeholder = @"反馈意见必须大于4个字符！";
    self.placeholderView.alwaysBounceVertical = NO;
    self.placeholderView.delegate = self;
    self.placeholderView.placeholderColor = HMColor(102, 102, 102);
    self.placeholderView.font = [UIFont systemFontOfSize:14];
    self.placeholderView.editable = YES;
    self.contentView.layer.cornerRadius = 5;
    self.contentView.layer.masksToBounds = YES;
    
    //提交按钮
     self.submitBtn.frame = CGRectMake(self.submitBtn.x, self.submitBtn.y, HMLXScreenWidth -20, self.submitBtn.height);
    
    self.submitBtn.layer.cornerRadius = 5;
    self.submitBtn.layer.masksToBounds = YES;
    
    CAGradientLayer *layer = [CAGradientLayer new];
    layer.colors = @[(__bridge id)HMUIColorFromRgbAlpha(0xe62b1a, 1).CGColor, (__bridge id)HMUIColorFromRgbAlpha(0xcc2617, 1).CGColor];
    layer.locations = @[@0.0, @1.0];
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(0, 1.0);
    layer.frame = self.submitBtn.bounds;
    [self.submitBtn.layer addSublayer:layer];
    
    
    
    // 手机号
    self.phoneTextField.layer.cornerRadius = 5;
    self.phoneTextField.layer.masksToBounds = YES;
    self.phoneTextField.layer.borderWidth = 1;
    self.phoneTextField.layer.borderColor = HMUIColorFromRgbAlpha(0xe91a01, 1).CGColor;

    
}

- (void)setUpplaceholderColor
{
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"手机号或电子邮件（非必填）" attributes:
                                      @{NSForegroundColorAttributeName:kCOLOR_R_G_B_A(102, 102, 102, 1),
                                        NSFontAttributeName:self.phoneTextField.font
                                        }];
    self.phoneTextField.attributedPlaceholder = attrString;
    self.phoneTextField.backgroundColor = HMColor(30, 30, 30);
    
    [self.view addSubview:self.phoneTextField];
    
    //设置内边距为10
    self.phoneTextField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 0)];
    
        self.phoneTextField.leftViewMode = UITextFieldViewModeAlways;
}

#pragma mark - <UITextViewDelegate>
- (void)textViewDidChange:(UITextView *)textView
{
    self.placeholderView.placeholderLabel.hidden = textView.hasText;

    self.submitBtn.enabled = textView.hasText;

    NSInteger number = [textView.text length];
    
    if (number > 200) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"字符个数不能大于200" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        
        textView.text = [textView.text substringToIndex:200];
        number = 200;
    }
    self.statuesLabel.text = [NSString stringWithFormat:@"%ld",(long)number];
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

- (IBAction)submitBtnClick {
    
    if (self.placeholderView.text.length < 5) {
      
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"反馈意见必须大于四个字符" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];

    } else {
        
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"method"] = @"suggest";
    dic[@"cont"] = self.placeholderView.text;
    dic[@"phone_email"] = self.phoneTextField.text;
    dic[@"openid"] = [[NSUserDefaults standardUserDefaults]objectForKey:OPENId];
    dic[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:HMSESSIONId];

    [HMServiceTool RequestWithDic:dic type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        if([responseObject[@"flag"] integerValue] == 1 ){

            [MBProgressHUD showSuccess:@"提交成功"];
             NSLog(@"qqq%@",responseObject);
            
            [self.navigationController popViewControllerAnimated:YES];
            
        }else{
            
            [MBProgressHUD showError:responseObject[@"mess"]];
        }
     
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
         [MBProgressHUD showError:@"网络错误，请稍后重试"];
        
    }];
        
    }
    
}
//适配5
- (void)setIphoneScreenAdaptation
{
    if (HMLXScreenWidth <= 325) {
        self.bgView.constant = 180;
        self.PlaceholderViewH.constant = 130;
        self.phoneH.constant = 40;
        self.submitTopH.constant = 60;
        self.submitBtnH.constant = 40;

    } else if (HMLXScreenWidth <= 375 && HMLXScreenWidth > 325){
     self.submitTopH.constant = 80;
    
    }
    
}

@end
