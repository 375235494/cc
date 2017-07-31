//
//  HMPlayDetailsVC.m
//  HUAMAO
//
//  Created by karl_pei on 2017/7/24.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMPlayDetailsVC.h"

@interface HMPlayDetailsVC ()
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;
@property (weak, nonatomic) IBOutlet UILabel *lab3;
@property (weak, nonatomic) IBOutlet UILabel *lab4;
@property (weak, nonatomic) IBOutlet UILabel *lab5;

@end

@implementation HMPlayDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sureBtn.layer.masksToBounds = YES;
    self.sureBtn.layer.cornerRadius = self.sureBtn.height * 0.5;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)sureBtnClick {
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
