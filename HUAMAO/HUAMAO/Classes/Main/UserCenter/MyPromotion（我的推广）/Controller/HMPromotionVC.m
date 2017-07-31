
//  HMPromotionVC.m
//  HUAMAO
//  Created by on 2017/5/22.
//  Copyright © 2017年 陈臣. All rights reserved.

#import "HMPromotionVC.h"
#import "HMPromotionView.h"
#import "HMUserCenterVC.h"

@interface HMPromotionVC ()<HMPromotionViewDelegate>
//返回按钮
@property (weak, nonatomic) IBOutlet UIButton *promotionBtn;
//推广View
@property (nonatomic, strong) UIView *PromotionV;
//蒙板
@property(nonatomic, strong) UIView *coverView;

@end

@implementation HMPromotionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = HMColor(0, 0, 0);

}
//view即将显示时隐藏nav
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
//view即将显示时显示nav
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)promotionBtnClick {
    //添加蒙板
    [self setUpView];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.PromotionV.centerX = HMLXScreenWidth * 0.5;
        self.PromotionV.centerY = HMLXScreenHeight * 0.5;
    }];
}



- (void)setUpView{
    
    UIView *coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HMLXScreenWidth, HMLXScreenHeight)];
    
    coverView.backgroundColor = [UIColor blackColor];
    coverView.alpha = 0.8;
    self.coverView = coverView;
    
    [self.view addSubview:coverView];
    
    //在蒙板上添加立即邀请招募view
    HMPromotionView *promotionV = [[[NSBundle mainBundle] loadNibNamed:@"HMPromotionView" owner:nil options:nil] lastObject];
    
    promotionV.layer.cornerRadius = 5;
    promotionV.layer.masksToBounds = YES;
    promotionV.delegate = self;

    promotionV.frame = CGRectMake(0, -HMLXScreenHeight, HMLXScreenWidth * 0.8, HMLXScreenHeight - 200 );
    promotionV.centerX = HMLXScreenWidth * 0.5;
    self.PromotionV = promotionV;
    [self.view insertSubview:promotionV aboveSubview:coverView];

}

#pragma HMPromotionViewDelegate
- (void)removeView
{
    [self.PromotionV removeFromSuperview];
    [self.coverView removeFromSuperview];
}



- (IBAction)backBtn {
    
    [self.navigationController  popViewControllerAnimated:YES];
}

@end
