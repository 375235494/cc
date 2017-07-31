//
//  HMABoutUsVC.m
//  HUAMAO
//
//  Created by on 2017/5/17.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMABoutUsVC.h"

@interface HMABoutUsVC ()

//顶部标题lable
@property (weak, nonatomic) IBOutlet UILabel *topLable;
@property (weak, nonatomic) IBOutlet UILabel *versionLab;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *logImageHeight;
@property (weak, nonatomic) IBOutlet UIImageView *logImage;

@end



#define HMVersionKey @"version"

@implementation HMABoutUsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"国翠商城";
    //设置顶部lable线框
    [self setUpTopLable];
    
    self.view.backgroundColor = HMColor(25, 25, 25);
    
    // 最新的版本保存到info.plist文件
    NSString *curVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    [[NSUserDefaults standardUserDefaults] setObject:curVersion forKey:HMVersionKey];
    
    [self.versionLab setTextColor:HMUIColorFromRgbAlpha(0x808080, 1)];
    
    self.versionLab.text = [NSString stringWithFormat:@"copyright ⓒ2013-2017  current version:v%@",KVersion];
}

- (void)setUpTopLable
{
    self.topLable.layer.cornerRadius = 5;
    self.topLable.layer.masksToBounds = YES;
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}



@end
