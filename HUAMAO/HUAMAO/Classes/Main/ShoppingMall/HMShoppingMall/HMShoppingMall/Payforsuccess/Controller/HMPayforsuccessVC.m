//
//  HMPayforsuccessVC.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/7/2.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMPayforsuccessVC.h"
#import "HMShoppingMallHomeVC.h"

@interface HMPayforsuccessVC ()


@property(nonatomic, strong)UIButton *finishBtn;

@end

@implementation HMPayforsuccessVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"支付成功";
    
    [self setfinishBtn];
    
    
    [self.navigationController.navigationItem setHidesBackButton:YES];
    [self.navigationItem setHidesBackButton:YES];
    [self.navigationController.navigationBar.backItem setHidesBackButton:YES];
    
    self.view.backgroundColor = HMColor(21, 21, 21);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)setfinishBtn
{
    self.finishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.finishBtn setTitle:@"完成" forState:UIControlStateNormal];
    [self.finishBtn setTitle:@"完成" forState:UIControlStateHighlighted];
    
    [self.finishBtn addTarget:self action:@selector(settingClick) forControlEvents:UIControlEventTouchUpInside];
    [self.finishBtn sizeToFit];
    
    self.finishBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    
    [self.finishBtn setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    
    UIBarButtonItem *settingItem = [[UIBarButtonItem alloc] initWithCustomView:self.finishBtn];
    
    self.navigationItem.rightBarButtonItems = @[settingItem];
    
}

- (void)settingClick

{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshData" object:self];
    
    
    [self.navigationController  popToRootViewControllerAnimated:YES];
    
}


@end
