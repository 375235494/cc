//
//  HMplayVC.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/7/22.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMplayVC.h"

@interface HMplayVC ()

@end

@implementation HMplayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    
    
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)SureAction:(id)sender {
    
     [self.navigationController popViewControllerAnimated:YES];
}

@end
