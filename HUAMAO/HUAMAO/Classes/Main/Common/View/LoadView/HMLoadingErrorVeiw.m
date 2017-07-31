//
//  HMLoadingErrorVeiw.m
//  HUAMAO
//
//  Created by 裴小康 on 2017/5/25.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMLoadingErrorVeiw.h"

@interface HMLoadingErrorVeiw()
@property(nonatomic,weak)UIImageView *imgView;

@property(nonatomic,weak) UILabel *errorLabel;
@end

@implementation HMLoadingErrorVeiw
// 说明：init方法内部会调用initWithFrame：方法
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //添加子控件
        [self addAllSubViews];
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(refreshData)]];
    }
    return self;
}

//添加所有子控件
-(void)addAllSubViews
{
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_loading_icon_failure"]];
    self.imgView = imgView;
    [self addSubview:imgView];
    
    
    UILabel *errorLabel = [[UILabel alloc] init];
    errorLabel.text = @"加载失败，请点击刷新页面...";
    
    errorLabel.textColor =HMColor(110, 109, 145);
    errorLabel.font = [UIFont systemFontOfSize:12];
    self.errorLabel = errorLabel;
    [self addSubview:errorLabel];
    
}

-(void)layoutSubviews
{
    self.imgView.centerX = HMLXScreenWidth  * 0.5;
    self.imgView.centerY = HMLXScreenHeight * 0.25;
    
    [self.errorLabel sizeToFit];
    self.errorLabel.centerX = HMLXScreenWidth * 0.5 + 5;
    self.errorLabel.y = CGRectGetMaxY(self.imgView.frame) + 15;
    
}

//重新刷新数据
-(void)refreshData
{
    
    if ([self.delegate respondsToSelector:@selector(loadingErrorViewDidClick)]) {
        [self.delegate loadingErrorViewDidClick];
    }
}


@end
