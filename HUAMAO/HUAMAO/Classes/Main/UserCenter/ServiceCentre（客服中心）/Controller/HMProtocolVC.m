//
//  HMProtocolVC.m
//  HUAMAO
//
//  Created by  on 2017/5/23.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMProtocolVC.h"
#import "HMGlobalTool.h"

@interface HMProtocolVC ()<UIWebViewDelegate,loadingErrorVeiwDelegate>

@property (weak, nonatomic) UIWebView *webView;

@property (nonatomic ,strong) NSURLRequest *requestLoadInfo;

@property(nonatomic, weak) HMLoadingErrorVeiw *errorView;
@end

@implementation HMProtocolVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"国翠商城";
    
    //设置webView
    [self setUpWebView];
    
    //加载webview
    [self loadWebView];
    
    self.webView.backgroundColor =  [UIColor blackColor];

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
    [self.view addSubview:webView];
    self.webView = webView;
}

-(void)loadWebView
{ //存在就直接reload
    if (self.requestLoadInfo) {
        [self.webView reload];
    } else {
        //url
        NSString *urlStr = @"http://kht.zoosnet.net/LR/Chatpre.aspx?id=KHT26949471&lng=cn";
        
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
