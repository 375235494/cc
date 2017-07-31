//
//  HMShoppingMallHomeVC.m
//  HUAMAO
//
//  Created by 孙密 on 17/5/17.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMShoppingMallHomeVC.h"

@interface HMShoppingMallHomeVC ()
<UIWebViewDelegate>

@property(strong,nonatomic)UIWebView *webView;

@end

@implementation HMShoppingMallHomeVC

-(UIWebView *)webView{
    if(_webView ==nil){
        
        _webView = [[UIWebView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
        
       
    }
    
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];

    self.webView.delegate = self;
    
    
    self.webView.opaque = NO;

    self.webView.backgroundColor = [UIColor blackColor];
    
     [self.view addSubview:self.webView];
    
    
    NSURL *url = [NSURL URLWithString:@"http://shop.fivemei.com"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];

}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];

    
}
//
//- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
//    
//    return YES;
//    
//}
//- (void)webViewDidStartLoad:(UIWebView *)webView{
//    
//
//     [MBProgressHUD showMessage:@"正在加载..."];
//    
//}
//- (void)webViewDidFinishLoad:(UIWebView *)webView{
//    
//    
//    
//    [MBProgressHUD hideHUD];
//    
//    [webView stringByEvaluatingJavaScriptFromString:@"cnm()"];
//    
//}
//- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
//    
//    [MBProgressHUD showError:@"网络出错"];
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
