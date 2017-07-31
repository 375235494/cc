//
//  HMLoadingView.m
//  HUAMAO
//
//  Created by 裴小康 on 2017/5/25.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMLoadingView.h"

#import "HMLoadingErrorVeiw.h"

@interface HMLoadingView ()<UIWebViewDelegate,loadingErrorVeiwDelegate>

@property (weak, nonatomic) UIView *loadingLayerView ;
@property (weak, nonatomic) UILabel *loadLabel;

@end

@implementation HMLoadingView

// 说明：init方法内部会调用initWithFrame：方法
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //添加子控件
        [self addAllSubViews];
        [self loadingAnimation];
    }
    return self;
}

//添加所有子控件
-(void)addAllSubViews
{
    UIView  *loadingView = [[UIView alloc] init];
    self.loadingLayerView = loadingView;
    [self addSubview:loadingView];
    
    UILabel *loadLabel = [[UILabel alloc] init];
    loadLabel.text = @"加载中...";

    
    loadLabel.textAlignment = NSTextAlignmentCenter;
    
    loadLabel.textColor = HMColor(110, 109, 145);
    
    loadLabel.font = [UIFont systemFontOfSize:12];
    
    self.loadLabel = loadLabel;
    [self addSubview:loadLabel];
    
}

-(void)layoutSubviews
{
    self.loadingLayerView.x = HMLXScreenWidth  * 0.5 -27;
    self.loadingLayerView.y  = HMLXScreenHeight * 0.25 - 27;
    self.loadingLayerView.width = 54;
    self.loadingLayerView.height = 54;
    
    self.loadLabel.x = self.loadingLayerView.x + 5;
    self.loadLabel.y = CGRectGetMaxY(self.loadingLayerView.frame) + 10;
    [self.loadLabel sizeToFit];
}


-(void)loadingAnimation
{
    CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
    replicator.frame = CGRectMake(0, 0, 54, 54);
    replicator.backgroundColor = [UIColor clearColor].CGColor;
    [self.loadingLayerView.layer addSublayer:replicator];
    
    CALayer *indicator = [CALayer layer];
    
    indicator.transform = CATransform3DMakeScale(0, 0, 0);
    
    indicator.position = CGPointMake(30, 4);
    
    indicator.bounds = CGRectMake(0, 0, 8, 8);
    
    indicator.cornerRadius = 4;
    
    indicator.masksToBounds = YES;
    
    [replicator addSublayer:indicator];
    
    CGFloat durtion = 1;
    
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    anim.keyPath = @"transform.scale";
    anim.fromValue = @1;
    anim.toValue = @0.3;
    
    anim.repeatCount = MAXFLOAT;
    
    anim.duration = durtion;
    
    [indicator addAnimation:anim forKey:nil];
    
    int count = 15;
    
    // 设置子层次数
    replicator.instanceCount = count;
    
    // 设置子层动画延长时间
    replicator.instanceDelay = durtion / count;
    
    // 设置子层形变角度
    CGFloat angle = M_PI * 2 / count;
    replicator.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
    
    
    CABasicAnimation *colorAnim = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    colorAnim.duration = durtion;
    colorAnim.fromValue = (id)HMColor(111, 108, 157).CGColor;
    colorAnim.toValue = (id)HMColor(56, 44, 97).CGColor;
    colorAnim.repeatCount = MAXFLOAT;
    
    [indicator addAnimation:colorAnim forKey:nil];
    
}

@end
