//
//  HMActivityRulesVC.m
//  HUAMAO
//
//  Created by karl_pei on 2017/7/7.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMActivityRulesVC.h"
#import "HMGlobalTool.h"

@interface HMActivityRulesVC ()<UIWebViewDelegate,loadingErrorVeiwDelegate>

@property (weak, nonatomic) UIWebView *webView;

@property (nonatomic ,strong) NSURLRequest *requestLoadInfo;

@property(nonatomic, weak) HMLoadingErrorVeiw *errorView;

@end

@implementation HMActivityRulesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"国翠商城";
    
    //设置webView
    [self setUpWebView];
    
    //加载webview
    [self loadWebView];
    
    self.view.backgroundColor =  [UIColor blackColor];
    
    [self.view addSubview:[HMGlobalTool showLoadingView]];
    self.navigationController.navigationBar.hidden = NO;
}


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


-(void)setUpWebView
{
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame  = CGRectMake(0, 0, HMLXScreenWidth, HMLXScreenHeight);
    webView.delegate = self;
    webView.backgroundColor = HMColor(31, 31, 31);
    
    self.webView = webView;
    
    [self.view addSubview:webView];
}

-(void)loadWebView
{ //存在就直接reload
    if (self.requestLoadInfo) {
        [self.webView reload];
    } else {
        //url
        NSString *urlStr = @"http://gc.autopiao.com/shop/server.html";
        
        self.requestLoadInfo = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlStr]];
        
        [self.webView loadRequest:self.requestLoadInfo];
    }
}
#pragma mark- webViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [HMGlobalTool dismissLoadingVeiw];
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
    [HMGlobalTool dismissLoadingVeiw];
    
}
@end
