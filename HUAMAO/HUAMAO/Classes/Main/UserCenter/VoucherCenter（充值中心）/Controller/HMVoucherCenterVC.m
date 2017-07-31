//
//  HMVoucherCenterVC.m
//  HUAMAO
//  Created by  on 2017/5/30.
//  Copyright © 2017年 陈臣. All rights reserved.

#import "HMVoucherCenterVC.h"
#import "HMRechargeVC.h"
#import "HMdrawingVC.h"
#import "HMTitleButton.h"
#import "HMReDrHederView.h"
#import "HMDataDropdownMenu.h"

@interface HMVoucherCenterVC ()<UIScrollViewDelegate,HMDataDropdownMenuDelegate>
/** scrollView: 所有tableView的父控件 */
@property (nonatomic, weak) UIScrollView *scrollView;
/** 所有标题的父控件 */
@property (nonatomic, weak) UIView *titlesView;
/** 标题底部的指示线（下划线） */
@property (nonatomic, weak) UIView *titleUnderlineView;
/** 记录上一次点击的标题按钮 */
@property (nonatomic, weak) UIButton *clickedTitleButton;
/** 存放所有的标题按钮 */
@property (nonatomic, strong) NSMutableArray *titleButtons;

@property (nonatomic, strong) HMReDrHederView *hederView;


//日期
@property(copy, nonatomic)NSString *data;


@end

@implementation HMVoucherCenterVC

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"closeDropDown" object:self];
}


- (NSMutableArray *)titleButtons
{
    if (!_titleButtons) {
        _titleButtons = [NSMutableArray array];
    }
    return _titleButtons;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //标题
    self.title = @"国翠商城";
    
    //设置ScrollView
    [self setupScrollView];
    //设置titleView
    [self setupTitlesView];
   
    //顶部标题栏
    [self setUpTopView];
    //设置日期选择器
    self.data = [self setUpDate:[NSDate date]];
    
    //添加子控制器
    [self setupAllChildVcs];
 
    self.view.backgroundColor = HMColor(31, 31, 31);
    
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.scrollView addGestureRecognizer:tapGestureRecognizer];
    
}

-(void)keyboardHide
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"closeDropDown" object:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
   
    [self scrollViewDidEndScrollingAnimation:self.scrollView];

}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    
}


-(void)setUpTopView
{
    //头部的view
    UIView *topView = [[UIView alloc] init];
    topView.frame = CGRectMake(0, 64, HMLXScreenWidth, 60);
    topView.backgroundColor = HMUIColorFromRgbAlpha(0x1f1f1f, 1);
    [self.view addSubview:topView];
    
    //设置图片
    UIImageView *imageV = [[UIImageView alloc] init];
    
    imageV.frame = CGRectMake(20, 84, 30, 25);
    imageV.image = [UIImage imageNamed:@"chongzhi-"];
    [self.view insertSubview:imageV aboveSubview:topView];
    
    //设置标题
    UILabel *titleLab = [[UILabel alloc] init];
    titleLab.frame = CGRectMake(imageV.width + imageV.x + 10, imageV.y, 100, imageV.height);
    titleLab.centerX = titleLab.centerX;
    titleLab.text = @"充值转让记录";
    

    [titleLab setFont:[UIFont boldSystemFontOfSize:14]];
    
    titleLab.textColor = HMUIColorFromRgbAlpha(0xc8c8c8, 1);
    
    [self.view insertSubview:titleLab aboveSubview:topView];
    
    //设置日期选择框
    UIView *bgV = [[UIView alloc] init];
    [bgV setFrame:CGRectMake(HMLXScreenWidth - 100 , 84, 70 , 25)];
    //背景颜色渐变
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)HMUIColorFromRgbAlpha(0xda4a28, 1).CGColor, (__bridge id)HMUIColorFromRgbAlpha(0x9a2b2b, 1).CGColor];
    gradientLayer.locations = @[@0.0, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1.0);
    gradientLayer.frame = bgV.bounds;
    
    [bgV.layer addSublayer:gradientLayer];
    
    bgV.layer.cornerRadius = 5;
    bgV.layer.masksToBounds = YES;
    
    [self.view addSubview:bgV];
    
    //日期查询日期
    UILabel *title = [[UILabel alloc] init];
    [title setFrame:CGRectMake(HMLXScreenWidth - 165 , 84, 70 , 25)];
    title.text = @"查询时间";
    [title setFont:[UIFont systemFontOfSize:14]];
    [title setTextColor:HMColor(250 , 250, 250)];
    [self.view insertSubview:title aboveSubview:topView];
    
    
    HMDataDropdownMenu *datadropdownMenu = [[HMDataDropdownMenu alloc] init];
    [datadropdownMenu setFrame:CGRectMake(HMLXScreenWidth - 100 , 84, 70 , 25)];
    [datadropdownMenu setMenuTitles:@[[self setUpDate:[NSDate date]],[self setUpDate:[NSDate dateWithTimeIntervalSinceNow:-(24*60*60)]],[self setUpDate:[NSDate dateWithTimeIntervalSinceNow:-2*(24*60*60)]]] rowHeight:45];
    datadropdownMenu.delegate = self;
    [self.view insertSubview:datadropdownMenu aboveSubview:bgV];
    
}

//设置日期（3天）
-(NSString *)setUpDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"MM-dd"];
    
    NSString *dateTime = [formatter stringFromDate:date];
    return dateTime;
    
}

- (void)detaDropdownMenu:(HMDataDropdownMenu *)menu selectedCellNumber:(NSInteger)number{
    
    if (number == 0) {//今天
        self.data = [self setUpDate:[NSDate date]];
    }else if(number == 1){//昨天
        self.data = [self setUpDate:[NSDate dateWithTimeIntervalSinceNow:-(24*60*60)]];
    }else{//前天
        self.data = [self setUpDate:[NSDate dateWithTimeIntervalSinceNow:-2*(24*60*60)]];
    }
    NSLog(@"你选择了：%ld，日期是:%@",(long)number,self.data);
    
     //发送通知
    [self sendNewDate];
}

- (void)setupAllChildVcs
{
    //充值
    HMRechargeVC *recharge = [[HMRechargeVC alloc] init];
    recharge.date = self.data;
    [self addChildViewController:recharge];
    //转让
    HMdrawingVC *drawing = [[HMdrawingVC alloc] init];
    recharge.date = self.data;
    [self addChildViewController:drawing];
    
    // 设置contentSize
    CGFloat contentW = self.childViewControllers.count * self.scrollView.width;
    self.scrollView.contentSize = CGSizeMake(contentW, 0);
}

- (void)setupTitlesView
{
    UIView *titlesView = [[UIView alloc] init];
    titlesView.y = 124;
    titlesView.width = self.view.width;
    titlesView.height = 40;
    titlesView.backgroundColor = HMUIColorFromRgbAlpha(0x292929, 1);
    [self.view addSubview:titlesView];
    self.titlesView = titlesView;
    
// 标题底部的指示线
//    UIView *titleUnderlineView = [[UIView alloc] init];
//    titleUnderlineView.height = 1;
//    titleUnderlineView.y = titlesView.height - titleUnderlineView.height;
//    titleUnderlineView.backgroundColor = HMUIColorFromRgbAlpha(0xfa5637, 1);
//    [titlesView addSubview:titleUnderlineView];
//    self.titleUnderlineView = titleUnderlineView;
    
    // 文字数据
    NSArray *titles = @[@"充值",@"转让"];
    
    // 添加所有的标题文字（所有的按钮）
    CGFloat titleW = titlesView.width / titles.count;
    CGFloat titleH = titlesView.height;
    for (int i = 0; i < titles.count; i++) {
        // 创建按钮
       HMTitleButton *titleButton = [HMTitleButton buttonWithType:UIButtonTypeCustom];
        titleButton.tag = i;
        [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titlesView addSubview:titleButton];
        [self.titleButtons addObject:titleButton];
        
        // 设置文字
        [titleButton setTitle:titles[i] forState:UIControlStateNormal];
        
        // 设置frame
        titleButton.width = titleW;
        titleButton.height = titleH;
        titleButton.y = 0;
        titleButton.x = i * titleW;
        
        if (i == 0) {
            // 默认选中第0个按钮
            titleButton.selected = YES;
            
            self.clickedTitleButton = titleButton;
            
            self.scrollView.frame = CGRectMake(0, 64, HMLXScreenWidth, HMLXScreenHeight);
            
            // 马上根据文字设置内部label的尺寸
            [titleButton.titleLabel sizeToFit];
            
            self.titleUnderlineView.width = titleButton.width;
            
            self.titleUnderlineView.centerX = titleButton.centerX;
        }
    }
}

- (void)setupScrollView
{
    // 不要自动调整scrollView的inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, HMLXScreenWidth, HMLXScreenHeight)];
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.backgroundColor = HMColor(24, 24, 24);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    HMReDrHederView *hederView = [[[NSBundle mainBundle] loadNibNamed:@"HMReDrHederView" owner:nil options:nil] lastObject];
    hederView.frame = CGRectMake(0, 164, HMLXScreenWidth, 30);
    hederView.backgroundColor = [UIColor clearColor];
    [self.view insertSubview:hederView aboveSubview:scrollView];
}

#pragma mark - 监听
//点击了顶部的标题按钮
- (void)titleClick:(HMTitleButton *)titleButton
{
    // 修改按钮状态
    self.clickedTitleButton.selected = NO;
    titleButton.selected = YES;
    self.clickedTitleButton = titleButton;
    
    // 移除底部下划线
    [UIView animateWithDuration:0.25 animations:^{
        self.titleUnderlineView.width = titleButton.width;
        self.titleUnderlineView.centerX = titleButton.centerX;
    }];
    
    // 让scrollView滚动到对应的位置(不要去修改contentOffset的y值)
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = titleButton.tag * self.scrollView.width;
    [self.scrollView setContentOffset:offset animated:YES];
}


#pragma mark - <UIScrollViewDelegate>
//滚动完毕就会调用（如果不是人为拖拽scrollView导致滚动完毕，才会调用这个方法）

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    int index = scrollView.contentOffset.x / scrollView.width ;
    UIViewController *willShowChildVc = self.childViewControllers[index];
    
    // 如果这个子控制器的view已经添加过了，就直接返回
    if (willShowChildVc.isViewLoaded) return;
    
    // 添加子控制器的view
    willShowChildVc.view.frame = scrollView.bounds;
    [scrollView addSubview:willShowChildVc.view];
    
   [self sendNewDate];
}

  //滚动完毕就会调用（如果是人为拖拽scrollView导致滚动完毕，才会调用这个方法）

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int index = scrollView.contentOffset.x / scrollView.width   ;
    // 点击对应的按钮
    [self titleClick:self.titleButtons[index]];
    // 添加子控制器的view
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

- (void)sendNewDate
{
    NSDictionary *userInfoDict = @{@"data":self.data};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"quretNewDate" object:self userInfo:userInfoDict];
}
@end
