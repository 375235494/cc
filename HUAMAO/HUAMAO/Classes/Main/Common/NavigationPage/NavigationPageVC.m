//
//  NavigationPageVC.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/7/10.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "NavigationPageVC.h"

#import "HMLoginRegisteredVC.h"

#import "HMLoginNavVC.h"

#define HMNewfeatureCount 7

@interface NavigationPageVC ()
<UIScrollViewDelegate>


@property (nonatomic, weak) UIPageControl *pageControl;

@property (nonatomic, weak) UIScrollView *scrollView;

@end

@implementation NavigationPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    // 2.添加图片到scrollView中
    CGFloat scrollW = scrollView.width;
    CGFloat scrollH = scrollView.height;
    for (int i = 0; i<HMNewfeatureCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.width = scrollW;
        imageView.height = scrollH;
        imageView.y = 0;
        imageView.x = i * scrollW;
        // 显示图片
        NSString *name = [NSString stringWithFormat:@"new_feature_%d", i + 1];
        imageView.image = [UIImage imageNamed:name];
        [scrollView addSubview:imageView];
        
        // 如果是最后一个imageView，就往里面添加其他内容
        if (i == HMNewfeatureCount - 1) {
            [self setupLastImageView:imageView];
        }
    }
    
    
    scrollView.contentSize = CGSizeMake(HMNewfeatureCount * scrollW, 0);
    scrollView.bounces = NO; // 去除弹簧效果
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    
    // 4.添加pageControl：分页，展示目前看的是第几页
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = HMNewfeatureCount;
    pageControl.backgroundColor = [UIColor redColor];
    pageControl.currentPageIndicatorTintColor = HMColorRGB(253, 98, 42);
    pageControl.pageIndicatorTintColor = HMColorRGB(189, 189, 189);
    pageControl.centerX = scrollW * 0.5;
    pageControl.centerY = scrollH - 50;
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    double page = scrollView.contentOffset.x / scrollView.width;
    // 四舍五入计算出页码
    self.pageControl.currentPage = (int)(page + 0.5);

}



- (void)setupLastImageView:(UIImageView *)imageView
{
    // 开启交互功能
    imageView.userInteractionEnabled = YES;

    
    // 1.分享给大家（checkbox）
    UIButton *shareBtn = [[UIButton alloc] init];
    

    [shareBtn setTitle:@"进入商城" forState:UIControlStateNormal];
    
    [shareBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

    shareBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    shareBtn.width = 100;
    shareBtn.height = 33;
    shareBtn.centerX = imageView.width * 0.5;
    shareBtn.centerY = imageView.height * 0.67;
    
    shareBtn.layer.cornerRadius = 10;//shareBtn.height / 2;
    
    shareBtn.layer.borderColor = [UIColor redColor].CGColor;
    
    shareBtn.layer.borderWidth = 1;
    
    shareBtn.clipsToBounds = YES;
    
    [shareBtn addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:shareBtn];
 
    

}

- (void)shareClick:(UIButton *)shareBtn
{
    // 状态取反
//    shareBtn.selected = !shareBtn.isSelected;
    
    [self startClick];
}

- (void)startClick
{
  
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    window.rootViewController = [[HWTabBarViewController alloc] init];
    
    
    HMLoginRegisteredVC * rootloginVC = [[HMLoginRegisteredVC alloc]init];

    HMLoginNavVC *Navlogin = [[HMLoginNavVC alloc]initWithRootViewController:rootloginVC];

    window.rootViewController = Navlogin;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
