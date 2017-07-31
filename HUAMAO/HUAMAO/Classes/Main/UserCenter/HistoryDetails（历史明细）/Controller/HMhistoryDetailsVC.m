
//  HMHistoryDetailsVC.m
//  HUAMAO
//  Created by on 2017/5/24.

#import "HMhistoryDetailsVC.h"
#import "MJRefresh.h"
#import "MJExtension.h"
#import "HMDropdownMenu.h"
#import "HMDataDropdownMenu.h"
#import "HMhistoryDetailsCell.h"
#import "HMHistoryDetailsModel.h"
#import "HMCommonNULLView.h"

#import "NSDictionary+ObjectForKey.h"

@interface HMhistoryDetailsVC ()<UITableViewDelegate,UITableViewDataSource, HMDropdownMenuDelegate, HMDataDropdownMenuDelegate>

@property (weak, nonatomic) UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIButton *woodsTypeBtn;

@property (weak, nonatomic) IBOutlet UIButton *timeChooseBtn;

//topView(头部View)
@property (weak, nonatomic) IBOutlet UIView *BgView;
//
@property(nonatomic, strong) HMHistoryDetailsModel *detailsModel;

@property (nonatomic, strong) NSMutableArray *historyArray;

//木头类型
@property(copy, nonatomic)NSString *code;
//日期
@property(copy, nonatomic)NSString *data;

//刷新是显示的当前页
@property (nonatomic, assign) int page;

@property (weak, nonatomic) IBOutlet UIButton *qureyBtn;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *woodsBtnConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *qureyBtnConstraint;
//@property (weak, nonatomic) IBOutlet UILabel *titleLab;

//tableview 无数据显示占位文字
@property (nonatomic, strong) UIView *littleView;

@end

//每页显示的个数
#define EPage 10

static NSString *cellID = @"HMHistoryDetailsCell";

@implementation HMhistoryDetailsVC


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"closeDropDown" object:self];
}


-(NSMutableArray *)historyArray
{
    if (!_historyArray) {
        _historyArray = [NSMutableArray array];
    }
    
   return _historyArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"国翠商城";
    
    
    self.view.backgroundColor = HMColor(0, 0, 0);
    
    [self setUpFream];
    
    //设置tableView
    [self setUpTableView];
    
    [self setUpRefresh];
    //设置选择 woods 类型
    
    [self setUpWoodsType];
    //设置选择 时间 类型
    
    [self setUpData];
    
    [self setUpLittleView];
    

    self.code = @"-1";
    self.data = [self setUpDate:[NSDate date]];
    
    self.qureyBtn.layer.cornerRadius = 5;
    self.qureyBtn.layer.masksToBounds = YES;
    
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [self.tableView addGestureRecognizer:tapGestureRecognizer];
    
}


//点击屏幕关闭下拉菜单
-(void)keyboardHide
{
  [[NSNotificationCenter defaultCenter] postNotificationName:@"closeDropDown" object:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView.mj_header beginRefreshing];
    
//    [self loadNewRecode];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

-(void)setUpLittleView
{
    
    self.littleView = [HMCommonNULLView setupLittleViewString:@"暂无竞猜记录"];
    self.littleView.hidden = YES;
    [self.tableView addSubview:self.littleView];
    
}

//木头下拉选择框
- (void)setUpWoodsType
{
    HMDropdownMenu *dropdownMenu = [[HMDropdownMenu alloc] init];
    if (HMLXScreenWidth > 325) {
        
        //        [dropdownMenu setFrame:CGRectMake(self.woodsTypeBtn.x, self.woodsTypeBtn.y + 64, self.woodsTypeBtn.width, self.woodsTypeBtn.height)];
        
        [dropdownMenu setFrame:CGRectMake(50, 122, 90, 30)];
        
        [dropdownMenu setMenuTitles:@[@"竞猜项目",@"金乌木",@"黑檀木",@"红楠木"] rowHeight:45];
        
        
    }else{
        
        //        [dropdownMenu setFrame:CGRectMake(self.woodsTypeBtn.x, self.woodsTypeBtn.y + 64, self.woodsTypeBtn.width - 21, self.woodsTypeBtn.height)];
        
        [dropdownMenu setFrame:CGRectMake(50, 122, 69, 30)];
        
        [dropdownMenu setMenuTitles:@[@"竞猜项目",@"金乌木",@"黑檀木",@"红楠木"] rowHeight:35];
        
        self.qureyBtn.titleLabel.font = [UIFont systemFontOfSize:11];
        
    }
    
    dropdownMenu.delegate = self;
    
    [self.view addSubview:dropdownMenu];
    
    self.woodsTypeBtn.layer.cornerRadius = 5;
    self.woodsTypeBtn.layer.masksToBounds = YES;
    [self setButColerCGRect:self.woodsTypeBtn.bounds Botton:self.woodsTypeBtn];
}
//日期下拉选择框
- (void)setUpData
{
    HMDataDropdownMenu *datadropdownMenu = [[HMDataDropdownMenu alloc] init];
    
    if (HMLXScreenWidth > 325) {
        
        
        //       [datadropdownMenu setFrame:CGRectMake(self.timeChooseBtn.x, self.timeChooseBtn.y + 64, self.timeChooseBtn.width, self.timeChooseBtn.height)];
        
        [datadropdownMenu setFrame:CGRectMake(212, 122, 81, 30)];
        //
        [datadropdownMenu setMenuTitles:@[[self setUpDate:[NSDate date]],[self setUpDate:[NSDate dateWithTimeIntervalSinceNow:-(24*60*60)]],[self setUpDate:[NSDate dateWithTimeIntervalSinceNow:-2*(24*60*60)]]] rowHeight:45];
        
    }else{
        
        //         [datadropdownMenu setFrame:CGRectMake(self.timeChooseBtn.x - 20, self.timeChooseBtn.y + 64, self.timeChooseBtn.width - 19 , self.timeChooseBtn.height)];
        
        [datadropdownMenu setFrame:CGRectMake(192, 58 + 64, 62, 30)];
        
        [datadropdownMenu setMenuTitles:@[[self setUpDate:[NSDate date]],[self setUpDate:[NSDate dateWithTimeIntervalSinceNow:-(24*60*60)]],[self setUpDate:[NSDate dateWithTimeIntervalSinceNow:-2*(24*60*60)]]] rowHeight:35];
        
    }
    
    datadropdownMenu.delegate = self;
    [self.view addSubview:datadropdownMenu];
    
    self.timeChooseBtn.layer.cornerRadius = 5;
    self.timeChooseBtn.layer.masksToBounds = YES;
    
    [self setButColerCGRect:self.timeChooseBtn.bounds Botton:self.timeChooseBtn];
    
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
//设置按钮的渐变颜色
- (void)setButColerCGRect:(CGRect)cgrect Botton:(UIButton *)botton
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)HMUIColorFromRgbAlpha(0xda4a28, 1).CGColor, (__bridge id)HMUIColorFromRgbAlpha(0x9a2b2b, 1).CGColor];
    gradientLayer.locations = @[@0.0, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1.0);
    gradientLayer.frame = cgrect;
    [botton.layer addSublayer:gradientLayer];
}

- (void)setUpFream
{

    if (HMLXScreenWidth <= 375 &&  HMLXScreenWidth > 325) {
        
        self.qureyBtnConstraint.constant = 40;
        
        [self setButColerCGRect:self.qureyBtn.bounds Botton:self.qureyBtn];
        
    }else if (HMLXScreenWidth <= 325){
        
        self.woodsBtnConstraint.constant = 70;
        
         self.qureyBtnConstraint.constant = 35;
    
        [self setButColerCGRect:self.qureyBtn.bounds Botton:self.qureyBtn];
        
    }else{
        
    [self setButColerCGRect:self.qureyBtn.bounds Botton:self.qureyBtn];
    
    }

}


#pragma mark - HMDropdownMenu Delegate
//点击下拉菜单选项时候调用
- (void)dropdownMenu:(HMDropdownMenu *)menu selectedCellNumber:(NSInteger)number{
    //0  (-1) 竞猜项目
    //1  (4)  金乌木
    //2  (1)  黑檀木
    //3  (2)  红楠木
 
    if (number == 0) {
        self.code = @"-1";
    }else if (number == 1){
        self.code = @"4";
    }else if (number == 2){
        self.code = @"1";
    }else{
        self.code = @"2";
    }
    NSLog(@"你选择了：%ld,木头类型是：%@",(long)number,self.code);
}

#pragma mark - HMDropdownMenu Delegate

- (void)detaDropdownMenu:(HMDataDropdownMenu *)menu selectedCellNumber:(NSInteger)number{
    
    if (number == 0) {//今天
        self.data = [self setUpDate:[NSDate date]];
    }else if(number == 1){//昨天
        self.data = [self setUpDate:[NSDate dateWithTimeIntervalSinceNow:-(24*60*60)]];
    }else{//前天
        self.data = [self setUpDate:[NSDate dateWithTimeIntervalSinceNow:-2*(24*60*60)]];
    }
    NSLog(@"你选择了：%ld，日期是:%@",(long)number,self.data);
}

- (void)setUpRefresh
{
    //添加底部的刷新控件
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreRecode)];
    
    self.tableView.mj_footer.tintColor = HMColor(155, 151, 180);
    
    //添加头部的下拉刷行的控件
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewRecode)];
    
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    self.tableView.mj_header.tintColor = HMColor(155, 151, 180);
}


//头部下拉刷新
- (void)loadNewRecode
{
    self.page = 0;
    
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    dic[@"method"] = @"queryusertradepage";
    dic[@"type"] = @"-1";
    dic[@"rq"] = self.data;
    dic[@"goodstype"] = self.code;
    dic[@"openid"] = Kopenid;
    dic[@"pageNo"] = @"0";
    dic[@"pageSize"] = @"10";
    dic[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:@"sessionid"];
    
    __weak typeof(self) weakSelf = self;
    [HMServiceTool RequestWithDic:dic type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        NSLog(@"responseObject:%@",responseObject);
        
        if ([responseObject[@"flag"] integerValue] == 1) {
            
           
            //转模型
            weakSelf.historyArray  = [HMHistoryDetailsModel mj_objectArrayWithKeyValuesArray:responseObject[@"resultStr"]];
            
            if ( weakSelf.historyArray.count < 1) {
                
                self.littleView.hidden = NO;
                
            } else {
                self.littleView.hidden = YES;
                [self.tableView setBackgroundColor:[UIColor clearColor]];
            }

            //刷新数据
            [weakSelf.tableView reloadData];
            //结束刷新
            [weakSelf.tableView.mj_header endRefreshing];
            
        }else{
            
            [MBProgressHUD showError:@"加载失败"];
            [weakSelf.tableView.mj_header endRefreshing];
        }
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        [MBProgressHUD showError:@"网络错误，请稍后重试"];
        [weakSelf.tableView.mj_header endRefreshing];
        
    }];

}

//底部上拉刷新
- (void)loadMoreRecode
{
    NSMutableDictionary * dic = [NSMutableDictionary dictionary];
    dic[@"method"] = @"queryusertradepage";
    dic[@"rq"] = self.data;
    dic[@"goodstype"] = self.code;
    dic[@"type"] = @"-1";
    dic[@"openid"] = Kopenid;
    //当前页
    self.page = self.page +1;
    [dic setObject:[NSString stringWithFormat:@"%d",self.page] forKey:@"pageNo"];
    //每页的个数
    [dic setObject:[NSString stringWithFormat:@"%d",EPage] forKey:@"pageSize"];
    
    dic[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:@"sessionid"];
    
    __weak typeof(self) weakSelf = self;
    [HMServiceTool RequestWithDic:dic type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if ([responseObject[@"flag"] integerValue] == 1) {
              //将返回的数据转换成模型
            NSArray *dictArray = [responseObject DWArrayForKey:@"resultStr"];
            
            NSArray *recodeArray  = [HMHistoryDetailsModel  mj_objectArrayWithKeyValuesArray:dictArray];
            
             [weakSelf.historyArray addObjectsFromArray:recodeArray];
            
            if (dictArray.count < 1) {
                [MBProgressHUD showSuccess:@"到底啦"];
            
                self.page --;
            }
            //刷新数据
            [weakSelf.tableView reloadData];
            [weakSelf.tableView.mj_footer endRefreshing];
            
        }else{
            
            [weakSelf.tableView.mj_footer endRefreshing];
            [MBProgressHUD showError:@"加载失败"];
        }
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        [weakSelf.tableView.mj_footer endRefreshing];
        [MBProgressHUD showError:@"加载失败，请检查网络重试"];
   }];

}


- (void)setUpTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    tableView.backgroundColor = [UIColor clearColor];
    
    tableView.frame = CGRectMake(0, 182, HMLXScreenWidth, HMLXScreenHeight - 182);
    
    tableView.showsVerticalScrollIndicator = NO;
    
    self.tableView = tableView;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HMHistoryDetailsCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    
    [self.view addSubview:tableView];
}


#pragma  UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.historyArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HMHistoryDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    cell.historyModel = self.historyArray[indexPath.row];
    
     cell.selectionStyle =UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (IBAction)qureyWoodsDetails {
    
//    [self loadNewRecode];
    [self.tableView.mj_header beginRefreshing];
}
@end
