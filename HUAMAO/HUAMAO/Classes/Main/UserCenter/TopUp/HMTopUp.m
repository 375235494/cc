//
//  HMTopUp.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/18.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMTopUp.h"

@interface HMTopUp ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation HMTopUp

- (void)viewDidLoad {
    [super viewDidLoad];
//     Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.title = @"充值";
    
    self.webView.delegate = self;
    
    self.webView.opaque = NO;
    
    self.webView.backgroundColor = [UIColor blackColor];
 
    
    NSURL *url = [NSURL URLWithString:TOPUPUrl(self.mUid)];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
}

- (IBAction)backAction:(UIButton *)sender {

    [self.navigationController popViewControllerAnimated:YES];
}

@end
