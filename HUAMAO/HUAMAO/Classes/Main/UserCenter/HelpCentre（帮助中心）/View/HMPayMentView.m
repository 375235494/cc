//
//  HMPayMentView.m
//  HUAMAO
//  Created by karl_pei on 2017/6/20.
//  Copyright © 2017年 陈臣. All rights reserved.

#import "HMPayMentView.h"

@interface HMPayMentView ()
//顶部标题
@property (weak, nonatomic) IBOutlet UILabel *topLab;
//第二个标题
@property (weak, nonatomic) IBOutlet UILabel *title2;
//第三个标题
@property (weak, nonatomic) IBOutlet UILabel *title3;
//支付图片详询
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@property (weak, nonatomic) IBOutlet UIImageView *image4;
@property (weak, nonatomic) IBOutlet UIImageView *image5;
@property (weak, nonatomic) IBOutlet UIImageView *image6;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeihgt;
//显示图片的总高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bgViewHeihgt;

@end

#define ImageHeight 600

@implementation HMPayMentView

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    
}

- (void)setCode:(NSString *)code
{
    _code = code;
    
    self.topLab.textColor = [UIColor yellowColor];
    self.title2.textColor = [UIColor yellowColor];
    self.title3.textColor = [UIColor yellowColor];
    
    //每张图片的高度
     self.imageHeihgt.constant =  ImageHeight;
    
      
    self.image1.hidden = YES;
    //self.image1.image = [UIImage imageNamed:@"one"];
    NSLog(@"%ld",(long)code.intValue);

    if (code.intValue == 3) {//银联支付
        
         self.bgViewHeihgt.constant = ImageHeight * 4 + 60;
        
        self.topLab.text = @"①点击充值按钮，跳转到充值界面，选择金额和银联支付，点击确认。";
       // self.image2.image = [UIImage imageNamed:@"yl_two"];
        self.title2.text = @"②界面跳转到支付页面，点击认证支付，进入手机支付界面，输入卡号点击提交即可。";
        
        self.title3.hidden = YES;
        
      //  self.image3.image = [UIImage imageNamed:@"yl_three"];
       // self.image4.image = [UIImage imageNamed:@"yl_four"];
        
        self.image5.hidden = YES;
        self.image6.hidden = YES;
        
    } else if(code.intValue == 4 ){// 快捷支付
        self.bgViewHeihgt.constant = ImageHeight * 5 + 60;
        
        self.topLab.text = @"①点击充值按钮，选择充值金额和快捷支付。跳转到用户登录界面，新用户初次登陆需点击最下方立即注册";
        
       // self.image2.image = [UIImage imageNamed:@"kj_two"];
        self.title2.text = @"②点击用户注册跳转至新用户注册页面，注意区分用户名和平台用户名。";
        self.title3.hidden = NO;
        self.title3.text = @"③注册完成登录后绑定银行卡，即可充值。";
        
      //  self.image3.image = [UIImage imageNamed:@"kj_three"];
       // self.image4.image = [UIImage imageNamed:@"kj_four"];
        
       // self.image5.hidden = NO;
      //  self.image5.image = [UIImage imageNamed:@"kj_five"];
        
        //self.image6.hidden = YES;
        
    }else if(code.intValue == 5){//支付宝支付
        self.bgViewHeihgt.constant = ImageHeight * 5 + 60;
        self.topLab.text = @"①点击充值按钮，进入充值界面。选择充值金额和支付宝支付，点击确认按钮。";
        self.topLab.textColor = [UIColor yellowColor];
        
       // self.image2.image = [UIImage imageNamed:@"zfb_two"];
        self.title2.text = @"②点击确认后，弹出支付宝二维码支付界面，点击立即充值按钮。";
        
        self.title3.hidden = NO;
        self.title3.text = @"③点击充值按钮后，系统自动进入支付宝支付页面，输入支付密码，即可完成支付。";
        
       // self.image3.image = [UIImage imageNamed:@"zfb_three"];
      //  self.image4.image = [UIImage imageNamed:@"zfb_four"];
        
       // self.image5.hidden = NO;
      //  self.image5.image = [UIImage imageNamed:@"zfb_five"];
       // self.image6.hidden = YES;
        
    }else{//微信支付
        self.bgViewHeihgt.constant = ImageHeight * code.intValue +  60;
        self.topLab.text = @"①点击充值按钮，进入充值界面，选择充值金额和微信支付。";
       // self.image2.image = [UIImage imageNamed:@"wx_two"];
        self.title2.text = @"②点击确认后，弹出微信二维码支付界面，手机截屏并保存图片二维码。";
        self.title3.hidden = NO;
        self.title3.text = @"③打开微信，点击右上角“+”选择扫一扫，选择从相册选取二维码。";
//        
//        self.image3.image = [UIImage imageNamed:@"wx_three"];
//        self.image4.image = [UIImage imageNamed:@"wx_four"];
//        self.image5.hidden = NO;
//        self.image5.image = [UIImage imageNamed:@"wx_five"];
//        self.image6.hidden = NO;
//        self.image6.image = [UIImage imageNamed:@"wx_six"];
    }
     self.image1.hidden = YES;
    self.image2.hidden = YES;
    self.image3.hidden = YES;
    self.image4.hidden = YES;
    self.image5.hidden = YES;
    self.image6.hidden = YES;
    
    
}

@end
