//
//  HMAddAddressVC.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/7/2.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMAddAddressVC.h"
#import "HMsureorderVC.h"
#import "MJExtension.h"
#import "NSDictionary+ObjectForKey.h"
#import "HMSureOtherModel.h"
#import "HMAddressModel.h"


@interface HMAddAddressVC ()<UITextFieldDelegate,UITextViewDelegate>


@property (weak, nonatomic) UITableView *tableView;


//收货人 consignee
@property (weak, nonatomic) IBOutlet UITextField *consigneeTF;

//联系电话 collPhone
@property (weak, nonatomic) IBOutlet UITextField *collPhoneTF;

//所在地 location
@property (weak, nonatomic) IBOutlet UITextField *locationTF;

//街道 street
@property (weak, nonatomic) IBOutlet UITextField *streetTF;
//详细地址输入框
@property (weak, nonatomic) IBOutlet UITextView *detailsAddressTextView;
//地址输入框占位文字
@property (weak, nonatomic) IBOutlet UILabel *placeHolderLab;

//保存 saveFile
@property (weak, nonatomic) IBOutlet UIButton *saveFileBtn;


@property (nonatomic, strong) HMSureOtherModel *goodsShowModel;

@property (nonatomic, strong) HMAddressModel *addressModel;
@end

@implementation HMAddAddressVC

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    [self.view endEditing:YES];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"添加收货地址";
    
    [self setUpTextField];
    
    [self message];
  
    self.view.backgroundColor = HMColor(21, 21, 21);
    
    self.saveFileBtn.layer.cornerRadius = 6;
    self.saveFileBtn.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

- (void)setUpTextField
{

    [self setUpOneTextField:self.consigneeTF];
    
    [self setUpOneTextField:self.collPhoneTF];
    
  
    [self setUpOneTextField:self.locationTF];

    [self setUpOneTextField:self.streetTF];
    
    self.detailsAddressTextView.delegate = self;


}


- (void)setUpfile
{



}

- (void)message
{
    self.consigneeTF.text = self.cname;
    self.collPhoneTF.text = self.phone;
    
    if (self.adderss.length > 0) {
        self.detailsAddressTextView.text = self.adderss;
        self.placeHolderLab.hidden = YES;
    }
    
    self.streetTF.text = @"000000";
    
}


- (void)setUpOneTextField:(UITextField *)textfield
{
    [textfield setValue:HMUIColorFromRgbAlpha(0xaeadad , 1) forKeyPath:@"_placeholderLabel.textColor"];

    textfield.delegate = self;
    
}

-(void)textViewDidChange:(UITextView *)textView
{
    self.detailsAddressTextView = textView;
    
    if (textView.text.length == 0) {
        self.placeHolderLab.text = @"收货地址";
    }else{
        self.placeHolderLab.text = @"";
    }
}

- (IBAction)saveFileBtnClick {
    
    if (self.consigneeTF.text.length == 0) {
        [MBProgressHUD showError:@"请填写收货人姓名"];
        return;
    }
    if (self.collPhoneTF.text.length == 0) {
        [MBProgressHUD showError:@"请填写联系电话"];
        return;
    }
        if (self.detailsAddressTextView.text.length == 0 ) {
        [MBProgressHUD showError:@"请填写收货地址"];
        return;
    }if (self.streetTF.text.length == 0) {
            [MBProgressHUD showError:@"请填写邮编号码"];
            return;
        }

    
   [MBProgressHUD showMessage:@"正在加载..."];
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    dic[@"method"] = @"order_jy";
    dic[@"openid"] = Kopenid;
    dic[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:@"sessionid"];
    dic[@"oname"] = self.consigneeTF.text;
    dic[@"phone"] = self.collPhoneTF.text;
    dic[@"address"] = self.detailsAddressTextView.text;
    dic[@"id"] = self.order_id;
    dic[@"postman"] = @"0";

    [HMServiceTool RequestWithDic:dic type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        NSLog(@"订单详询：%@",responseObject);
        
        if ([responseObject[@"flag"] integerValue] == 1) {
            
            [MBProgressHUD hideHUD];
            
            HMsureorderVC * VC = [[HMsureorderVC alloc]init];
            
            VC.addressModel = [HMAddressModel mj_objectWithKeyValues:responseObject[@"resultStr"][@"orderReq"]];
            
    
            VC.goodsShowModel = [HMSureOtherModel mj_objectWithKeyValues:responseObject[@"resultStr"][@"commodity"]];
            
            VC.order_id = self.order_id;
            
            [self.navigationController pushViewController:VC animated:YES];
            
            [MBProgressHUD showSuccess:@"保存成功"];
        
        }else{
            [MBProgressHUD hideHUD];
            [MBProgressHUD showError:@"加载失败"];
        }
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        [MBProgressHUD hideHUD];
        [MBProgressHUD showError:@"加载失败，请检查网络重试"];
    }];
    
}

    
    





@end
