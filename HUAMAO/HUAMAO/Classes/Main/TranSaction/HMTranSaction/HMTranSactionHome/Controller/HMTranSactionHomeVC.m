//
//  HMTranSactionHomeVC.m
//  HUAMAO
//
//  Created by 孙密 on 17/5/17.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMLoginShowmask.h"

#import "HMTranSactionHomeVC.h"

#import "HMTranSactionHeadV.h"

#import "HMSelectproductV.h"

#import "HMSelectTimeCell.h"

#import "HMbiddingCell.h"

#import "HMMaskView.h"

#import "HMTimeMovements.h"

#import "HMKlineGraphView.h"

#import "HMEndView.h"

#import "HMPriceChange.h"

#import "HMwithdrawal.h"

#import "HMTopUp.h"

#import "HMServiceTool.h"

#import "HMwithdrawalModel.h"

#import "HMCIcModel.h"

#import "HMpiceFluctuationsDataSouce.h"

#import "SocketRocket.h"

#import "HMJYModel.h"

#import "HMOrderMessageMask.h"

#import "HMorderMessageMol.h"

#import "HMprofitMaskView.h"

#import "HMCHicCell.h"


#import "HMInvitationHomeVC.h"

#import "HMInvitationHomePlusVC.h"

#import "HMInvitationHomeIphone5VC.h"

#import "HMDelegeatShowView.h"

#import "HMplayVC.h"
@interface HMTranSactionHomeVC ()
<HMTranSactionHeadVDelegate,
HMbiddingCellDelegate,
HMTimeMovementsDelegate,
HMSelectTimeCellDelegate,
HMSelectproductVDelegate,
HMEndViewDelegate,
HMMaskViewDelegate,
SRWebSocketDelegate,
HMPriceChangeDelegate,
UIScrollViewDelegate,
HMprofitMaskViewDelegeat,
HMCHicCellDelegate>
{
    BOOL end;
    
    
}

@property(nonatomic,weak) HMKlineGraphView * KlineGraphView;

@property (nonatomic,strong)SRWebSocket *webSocket;

@property(strong,nonatomic)UIScrollView *scrollV;

@property(strong,nonatomic)NSNumber * strmony;

@property(strong,nonatomic)NSNumber *mUid;

@property(strong,nonatomic)HMwithdrawalModel *withdrawal;

@property(weak,nonatomic)HMTranSactionHeadV *headV;

@property(copy,nonatomic)NSString *strimage;

@property(weak,nonatomic)HMEndView *endView;

@property(assign,nonatomic) NSInteger contractSelct;

@property(assign,nonatomic) NSInteger TimeSelect;

@property(assign,nonatomic) NSInteger TypeBuySelect;

@property(assign,nonatomic) NSInteger moneySelect;

@property(assign,nonatomic) NSInteger MovementsSelect;

@property(assign,nonatomic)BOOL OneComing;

@property(assign,nonatomic)NSInteger SelectOrder;

@property(strong,nonatomic)NSMutableArray *OrderMessageAry;

@property(weak,nonatomic)HMbiddingCell *biddingV;

@property(strong,nonatomic)NSTimer *timer;


@property(assign,nonatomic)NSInteger timce;


@property(weak,nonatomic)HMSelectproductV *SelectCell;



@end

@implementation HMTranSactionHomeVC


-(void)InvitationShow{

    
    if(HMLXScreenWidth * 2 >  750){
        
        HMInvitationHomePlusVC * InvitationHomePlusVC = [[HMInvitationHomePlusVC alloc]init];

        
        [self.navigationController pushViewController:InvitationHomePlusVC animated:YES];
       

    }else if( HMLXScreenWidth * 2 < 750){

        HMInvitationHomeIphone5VC * InvitationHome5VC = [[HMInvitationHomeIphone5VC alloc]init];
       
        [self.navigationController pushViewController:InvitationHome5VC animated:YES];
    }else{
        
        HMInvitationHomeVC *InvitationHomeVC =[[HMInvitationHomeVC alloc]init];
        
        [self.navigationController pushViewController:InvitationHomeVC animated:YES];
    }

}

//公告
-(void)announcementAction{
    
     [self GGLoad];
    
}


#pragma 跳转个人中心界面
-(void)jumpUserCenter
{
    self.tabBarController.selectedIndex = 3;
}

-(void)profitMaskViewRloatMoney:(HMprofitMaskView *)profitMaskView{
    
    [self GetsouceAndRefresh];
    
}

-(void)lossrefreshMoney :(HMCHicCell *)CHicCell{
    
    [self GetsouceAndRefresh];
    
}


-(UIView *)profitMaskViewWithToFrame:(HMprofitMaskView *)profitMaskView {

     [self.scrollV setContentOffset:CGPointMake(0, -20) animated:NO];
    
    return _headV.money;
}



-(NSInteger)PriceChangeSelceted:(HMPriceChange *)PriceChange{
    
    return _contractSelct;
    
}

-(HMwithdrawalModel*)withdrawal {
    
    if(_withdrawal == nil){
        
        _withdrawal = [[HMwithdrawalModel alloc]init];
    }
    
    return _withdrawal;
    
}

-(void)EndViewCiCAction:(HMEndView*)endView{
    
//    if(_OneComing == YES){
    
         [self.scrollV setContentOffset:CGPointMake(0, -20) animated:YES];
//    }
    
   
    
    _SelectOrder = 0;
//    [self GetsouceAndRefresh];
    
//    [self getChiCangSouceLoad];
    
    
}

-(void)EndViewJYAction :(HMEndView*)endView{
    
    [self.scrollV setContentOffset:CGPointMake(0, _scrollV.contentSize.height - self.view.height + self.SelectCell.maxY -40) animated:YES];
    
    _SelectOrder = 1;
    [self JYLoad];
}

-(void)SelectproductV:(HMSelectproductV *)SelectproductV WithIndex:(NSInteger)index{
    
    NSLog(@"选择的木头%ld",index);
    
    _contractSelct =  index - 1000;
}

-(void)SelectTimeCell:(HMSelectTimeCell*)SelectTimeCell SelectIndex:(NSInteger)index{
    
    NSLog(@"选择的秒%ld",index);
    
    _TimeSelect = index -1000;
}


-(void)TimeMovementsSelect:(HMTimeMovements *)TimeMovements withTag:(NSInteger)index{
    
    NSLog(@"%ld",index);
    
    _MovementsSelect = index - 100;
    
    if(_MovementsSelect == 0){
        
        [self.KlineGraphView showmovement];
        
        [self sendMessage:@"line"];
        
        
    }else{
        
        [self.KlineGraphView showKlineView];
        
        [self sendMessage:@"kline"];
    }
    
}


//改成玩法
-(void)withdrawalButtonAction{
    
//    NSLog(@"tixian");
//    
//    HMwithdrawal * withdrawal = [[HMwithdrawal alloc]init];
//    
//    withdrawal.withdrawalMessage = self.withdrawal;
//    
//    withdrawal.mUid = self.mUid;
//    
//    withdrawal.hidesBottomBarWhenPushed = YES;
//    
//    [self.navigationController pushViewController:withdrawal animated:YES];
    
    
    HMplayVC * playVC = [[HMplayVC alloc]init];
    
    
    [self.navigationController pushViewController:playVC animated:YES];
    
}



-(void)topUUpButtonAction{
    
//    NSLog(@"chongzhi");
//    
//    HMTopUp * TopUp = [[HMTopUp alloc]init];
//    
//    TopUp.mUid = self.mUid;
//    
//    TopUp.hidesBottomBarWhenPushed = YES;
//    
//    [self.navigationController pushViewController:TopUp animated:YES];

    

}


-(void)biddingCellwithbidding:(HMbiddingCell *)cell{
    
    NSLog(@"jingmia")
    
    _TypeBuySelect = 1;
    
    _moneySelect = 6;
    
    HMMaskView * MaskView = [[HMMaskView alloc]init];
    
    MaskView.Delegate =self;
    
    [MaskView ShowMaskView];
    
    [MaskView setHY:_contractSelct cycleTime:_TimeSelect orderType:_TypeBuySelect];
}



-(void)MaskView:(HMMaskView *)MaskView moneySelectIndex:(NSInteger)index{
    
    NSLog(@"%ld",index);
    
    _moneySelect =  index - 100;
}

-(void)MaskViewCancel:(HMMaskView *)MaskView{
    
    
    
}

-(void)MaskViewSure:(HMMaskView *)MaskView{
    
    NSMutableDictionary *Dic = [[NSMutableDictionary alloc]init];
    
    Dic[@"method"] = @"usertradeorder";
    
    Dic[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:HMSESSIONId];
    
    Dic[@"openid"] = [[NSUserDefaults standardUserDefaults]objectForKey:OPENId];

    Dic[@"tradetype"] = @"0";
    
    Dic[@"moneytype"] = @"1";
    
    Dic[@"maxwin"] = @"0";
    
    Dic[@"maxloss"] = @"0";
    
    Dic[@"ordernum"] = @"1";
    
    Dic[@"tradeunit"] = @"";
    
    Dic[@"money"] = [NSString stringWithFormat:@"%ld",[self SelectMoneyWithTag:_moneySelect]];
    
    switch (_TimeSelect) {
        case 0:{
           
            Dic[@"minute"] = @"3";
        }
            break;
        case 1:{
            
            Dic[@"minute"] = @"1";
        }

            break;
        case 2:{
            
            Dic[@"minute"] = @"5";
        }
            break;
            
        default:
            break;
    }
    
    
    switch (_TypeBuySelect) {
        case 0:{
            
            Dic[@"type"] = @"1";
        }
            break;
        case 1:{
            
            Dic[@"type"] = @"-1";
        }
            break;
            
            
        default:
            break;
    }
    
    
    switch (_contractSelct) {
            
        case 0:{
            
            Dic[@"tranid"] = @"4";
        }
            break;
        case 1:{
            
            Dic[@"tranid"] = @"1";
        }
            break;
        case 2:{
            
            Dic[@"tranid"] = @"2";
        }
            break;
            
        default:
            break;
    }
    
    [self SubmitOrdersWithDic:Dic andMaskViewSure:MaskView];
    
}


-(void)biddingCellwithBuy :(HMbiddingCell *)cell{
    
    NSLog(@"jinggougou")
    
    _TypeBuySelect =0;
    
    _moneySelect = 6;
    
    HMMaskView * MaskView = [[HMMaskView alloc]init];
    
    MaskView.Delegate =self;

    [MaskView ShowMaskView];
    
    [MaskView setHY:_contractSelct cycleTime:_TimeSelect orderType:_TypeBuySelect];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    self.webSocket.delegate = nil;
    [self.webSocket close];
    self.webSocket = nil;
}


-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
     [self Reconnect];
}

-(UIScrollView *)scrollV{
    
    if(_scrollV ==nil){
        
        _scrollV = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        
        _scrollV.height = _scrollV.height +20;
        
//        _scrollV.backgroundColor = HMUIColorFromRgbAlpha(0x1e1e1e , 1);

        _scrollV.delegate = self;
        
    }
    
    return _scrollV;
    
}


-(void)ChecktheDetails :(HMEndView*)endView indexpath:(NSIndexPath *)indexPath{
    
    HMOrderMessageMask *mask = [[HMOrderMessageMask alloc]init];
    
    mask.molmessage = self.OrderMessageAry[indexPath.section];
    
    NSLog(@"%ld",mask.molmessage.cycelTime);
    
    [mask ShowMaskView];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    _moneySelect = 6;
    
    _TimeSelect = 1;

    self.navigationController.navigationBar.hidden = YES;

    self.view.backgroundColor = HMUIColorFromRgbAlpha(0x1e1e1e , 1);
    
    [self.view addSubview:self.scrollV];
    
    self.scrollV.height = self.scrollV.height - 64;

     [self cretUI];
    
    
    
    [self.KlineGraphView showmovement];
    
//    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(scrollTimer) userInfo:nil repeats:YES];

}




-(void)GGLoad{

    NSMutableDictionary *dicGG = [[NSMutableDictionary alloc]init];
    
    dicGG[@"method"] = @"getAnnouncePage";
    
    dicGG[@"type"] = @"announcelog";

    dicGG[@"pageNo"] = @0;
    
    dicGG[@"pageSize"] = @1;

    [HMServiceTool RequestWithDic:dicGG type:URLtypeAPP RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        NSLog(@" 公告%@",responseObject);
        
       HMLoginShowmask *mask =  [[HMLoginShowmask alloc]init];
        
        [mask ShowMaskView];
        
        mask.logingMessage = responseObject[@"resultStr"][0][@"cont"][0][@"val"];

    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        [MBProgressHUD showError:@"服务器未连接"];
        
        
    }];
    
    
    
}



-(void)viewWillAppear:(BOOL)animated{
    

    [super viewWillAppear:animated];

    

}



-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    
    [self GetsouceAndRefresh];
    
    //    [self getChiCangSouceLoad];
    //
//    [self.endView CicActionLoad];
    
    [self Reconnect];
    
    //    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(scrollTimer) userInfo:nil repeats:YES];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(countdown:) name:@"CountdownIsZero" object:nil];
    
    [self myRunloop];
    
    
    [self ShowDelegeatView];
    
    
}



-(void)ShowDelegeatView{
    
    NSString *app_build = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    float integerApp_build = [app_build floatValue];
    
    float userDefaultBuild = [[[NSUserDefaults standardUserDefaults] objectForKey:@"Build"]  floatValue];
    
    if(integerApp_build == userDefaultBuild){
        
        
        
    }else{
        

        HMDelegeatShowView * DelegeatShow =  [[HMDelegeatShowView alloc]init];

        [DelegeatShow ShowMaskView];

    }
    

    

    
}

-(void)countdown:(NSNotification *)notifica{
    
    
    NSLog(@"%@",notifica.userInfo);
//    
//    [_timer invalidate];
//    
//    _timer =nil;
    
    _timce = _timce + 1;
//    
    [self methodFourGCDwith:notifica.userInfo[@"orderId"]];
    
    
    
    
}




- (void)viewDidDisappear:(BOOL)animated{
    // Close WebSocket
    [super viewDidDisappear:animated];
    
    self.webSocket.delegate = nil;
    [self.webSocket close];
    self.webSocket = nil;
    
//    [_timer invalidate];
//    
//    _timer =nil;

    end =YES;
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"CountdownIsZero" object:nil];
}


-(void)cretUI{
    
    HMTranSactionHeadV *headV = [HMTranSactionHeadV TranSactionHeadV];
    
    headV.delegate = self;
    
    headV.width = self.view.width;
    
    headV.height = 89;
    
    headV.x = 0 ;
    
    headV.y = 20;
    
    [self.view addSubview:headV];
    
    _headV = headV;
    
    
    
    HMSelectproductV *SelectCell = [[HMSelectproductV alloc]init];
    
    _SelectCell = SelectCell;
    
    SelectCell.Delegate = self;

    SelectCell.x = 5;
    
    SelectCell.y = headV.maxY;
    
    SelectCell.height = [HMSelectproductV SelectproductVHeigth];

    SelectCell.width = self.view.width -10;
    
    
    self.scrollV.y = SelectCell.maxY ;

    self.scrollV.height = self.view.height - SelectCell.maxY;
    
    
    
    

    HMPriceChange * PriceChange = [HMPriceChange PriceChange];
    
    PriceChange.Delegate = self;
    
    PriceChange.x = 0;
    
    PriceChange.y = -20;
    
    PriceChange.height =  [HMPriceChange PriceChangeHeigth];
    
    PriceChange.width = self.view.width;
    
    [self.scrollV addSubview:PriceChange];

    
    HMSelectTimeCell *SelectTimeCell = [HMSelectTimeCell initSelectTimeCell];
    
    SelectTimeCell.Delegate =self;
    
    SelectTimeCell.x = 0;
    
    SelectTimeCell.y = PriceChange.maxY;
    
    SelectTimeCell.height = [HMSelectTimeCell SelectTimeCellHeight];

    SelectTimeCell.width = self.view.width;
    
    [self.scrollV addSubview:SelectTimeCell];
    

    HMbiddingCell *biddingCell =  [HMbiddingCell  biddingCell];

    
    biddingCell.Delegate = self;

    biddingCell.x = 0;
    
    biddingCell.y = SelectTimeCell.maxY;
    
    biddingCell.height = [HMbiddingCell biddingCellHeigth];
    
    biddingCell.width = self.view.width;
    
    _biddingV = biddingCell;
    
    [self.scrollV addSubview:biddingCell];
    
    
    HMTimeMovements *TimeMovements =  [HMTimeMovements  TimeMovements];
    
    TimeMovements.Delegate =self;
    
    TimeMovements.x = 0;
    
    TimeMovements.y = biddingCell.maxY;
    
    TimeMovements.height = [HMTimeMovements TimeMovementsHeigth];
    
    TimeMovements.width = self.view.width;
    
    [self.scrollV addSubview:TimeMovements];
    
    HMKlineGraphView * KlineGraphView = [[HMKlineGraphView alloc]init];
    
    _KlineGraphView = KlineGraphView;
    
    KlineGraphView.x = 0;
    
    KlineGraphView.y = TimeMovements.maxY;
    
    KlineGraphView.height =[HMKlineGraphView lineGraphViewHeigth];
    
    KlineGraphView.width = self.view.width;

    [self.scrollV addSubview:KlineGraphView];
    
    HMEndView *endV = [HMEndView EndView];
    
    _endView = endV;

    endV.Delegate =self;
    
    endV.x = 0;
    
    endV.y = KlineGraphView.maxY;

    endV.width = self.view.width;

    endV.height = 140;

    [self.scrollV addSubview:endV];

    self.scrollV.contentSize = CGSizeMake(self.view.width, endV.maxY);
    
    
     [self.view addSubview:SelectCell];
}



-(void)EndViewCiCAction:(HMEndView*)endView WithHeigth :(CGFloat) Heigth{
    
    self.scrollV.contentSize = CGSizeMake(self.view.width, _endView.maxY);
    
}


-(void)JYLoad{

    self.webSocket.delegate = nil;
    [self.webSocket close];
    self.webSocket = nil;
    
    NSMutableDictionary *dicJY = [[NSMutableDictionary alloc]init];
    
    dicJY[@"method"] = @"usertradepage";
    
    dicJY[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:HMSESSIONId];
    
    dicJY[@"openid"] = [[NSUserDefaults standardUserDefaults]objectForKey:OPENId];
    
    dicJY[@"pageNo"] = @0;
    
    dicJY[@"pageSize"] = @5;
    
    [MBProgressHUD showMessage:@"正在加载..."];
    
    [HMServiceTool RequestWithDic:dicJY type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        NSLog(@"%@",responseObject);
        
        [MBProgressHUD hideHUD];
    
        NSMutableArray *arysouce = [NSMutableArray array];
        
        NSArray *ary = responseObject[@"resultStr"];
        
        for(NSDictionary *dic in ary){
            
            HMJYModel *mol = [HMJYModel JYModelWithDic:dic];
            
            [arysouce addObject:mol];
        }
        
        [self.endView reloadateJiaYiWithAry:arysouce];
        
        
        [self Reconnect];
        
        
        self.endView.JaoYitableView.height = (40 + 15) * arysouce.count + 70;

        self.endView.height = (40 + 15) * arysouce.count +  150;

        self.scrollV.contentSize = CGSizeMake(self.view.width, self.endView.maxY);

        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        [MBProgressHUD hideHUD];
        
        [MBProgressHUD showError:@"服务器未连接"];
 
    }];
    
    
    
}


-(void)getChiCangSouceLoad{
    

    NSMutableDictionary *dicusertradeing = [[NSMutableDictionary alloc]init];
    
    dicusertradeing[@"method"] = @"usertradeing";
    
    dicusertradeing[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:HMSESSIONId];
    
    dicusertradeing[@"openid"] = [[NSUserDefaults standardUserDefaults]objectForKey:OPENId];
    
    dicusertradeing[@"pageNo"] = @0;
    
    dicusertradeing[@"pageSize"] = @100;
 
    
    [HMServiceTool RequestWithNotaboutboxDic:dicusertradeing type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        NSLog(@"%@",responseObject);

        //            [MBProgressHUD hideHUD];
        
            NSArray *ary = responseObject[@"resultStr"];
        
            NSMutableArray *arysouce = [[NSMutableArray alloc]init];
    
            [self.OrderMessageAry removeAllObjects];
   
            for(NSDictionary *dic in ary){
                
                HMCIcModel *mol = [HMCIcModel CIcModelWithDic:dic];
                
                [arysouce addObject:mol];
                
                HMorderMessageMol *orderMessage = [[HMorderMessageMol alloc]init];
                
                orderMessage.isOrderBegin = NO;
                
                orderMessage.dicSouce = dic;
                
                [self.OrderMessageAry addObject:orderMessage];
                
            }
            
        
             [self.endView reloadateCicangWithAry:arysouce];
        
//        if(arysouce.count == 0){
//            
//            end = YES;
//        }

        
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        
        //            [MBProgressHUD hideHUD];
        
//            [MBProgressHUD showError:@"服务器未连接"];
    
    }];
    
}


//-(void)scrollTimer{
//    
//    [self getChiCangSouceLoad];
//    
////    [self GetsouceAndRefresh];
//}


-(void)GetsouceAndRefresh{
    
    NSMutableDictionary *getuserinfoDic = [[NSMutableDictionary alloc]init];
    
    getuserinfoDic[@"method"] = @"getuserinfo";
    
    getuserinfoDic[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:HMSESSIONId];
    
    getuserinfoDic[@"openid"] = [[NSUserDefaults standardUserDefaults]objectForKey:OPENId];
    
    NSMutableDictionary *dicusertradeing = [[NSMutableDictionary alloc]init];
    
    dicusertradeing[@"method"] = @"usertradeing";
    
    dicusertradeing[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:HMSESSIONId];
    
    dicusertradeing[@"openid"] = [[NSUserDefaults standardUserDefaults]objectForKey:OPENId];
    
    dicusertradeing[@"pageNo"] = @0;
    
    dicusertradeing[@"pageSize"] = @100;
    
    [self getMessagedFormURLWithgetuserinfo:getuserinfoDic AndusertradeingDic:dicusertradeing];

}


-(void)getMessagedFormURLWithgetuserinfo:(NSDictionary *)getuserinfoDic AndusertradeingDic:(NSDictionary *)dicusertradeing{
//    self.webSocket.delegate = nil;
//    [self.webSocket close];
//    self.webSocket = nil;
//    [MBProgressHUD showMessage:@"正在加载..."];

    [HMServiceTool RequestWithDic:getuserinfoDic type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        NSLog(@"%@",responseObject);

        self.withdrawal.dicsouce = responseObject[@"resultStr"];
  
        
        self.strimage = responseObject[@"resultStr"][@"head"];
        
        self.strmony = responseObject[@"resultStr"][@"account"];
        
        
        self.mUid = responseObject[@"resultStr"][@"id"];
        
        
//        [HMServiceTool RequestWithDic:dicusertradeing type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
//            
//            NSLog(@"%@",responseObject);
//      
////            [MBProgressHUD hideHUD];
//            
//            NSArray *ary = responseObject[@"resultStr"];
//            
//            NSMutableArray *arysouce = [[NSMutableArray alloc]init];
//            
//            for(NSDictionary *dic in ary){
//                
//                HMCIcModel *mol = [HMCIcModel CIcModelWithDic:dic];
//                
//                [arysouce addObject:mol];
//                
//                HMorderMessageMol *orderMessage = [[HMorderMessageMol alloc]init];
//                
//                orderMessage.dicSouce = dic;
//         
//                orderMessage.isOrderBegin = NO;
//                
//                [self.OrderMessageAry addObject:orderMessage];
//              
//            }
//            
//            
//            [self.endView reloadateCicangWithAry:arysouce];
//
//            [self Reconnect];
//            
//            
//      
//        } failure:^(NSURLSessionDataTask *operation, NSError *error) {
//            
//            
////            [MBProgressHUD hideHUD];
//            
////            [MBProgressHUD showError:@"服务器未连接"];
//            
//            
//        }];
        
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        NSLog(@"%@",error);
        
//        [MBProgressHUD hideHUD];
        
//        [MBProgressHUD showError:@"服务器未连接"];
        
    }];

}



-(void)SubmitOrdersWithDic:(NSDictionary *)dic andMaskViewSure:(HMMaskView *)maskView{
    
    self.webSocket.delegate = nil;
    [self.webSocket close];
    self.webSocket = nil;
    [MBProgressHUD showMessage:@"正在加载..."];
    
//    end = YES;
    
    [HMServiceTool RequestWithDic:dic type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        NSLog(@"%@",responseObject);
        
        [MBProgressHUD hideHUD];
        
        if([responseObject[@"flag"]integerValue] == 1){
            
//            [MBProgressHUD showSuccess:@"订单提交成功"];
    
            [_biddingV setStartTimer];
            
            HMorderMessageMol *mol = [[HMorderMessageMol alloc]init];
            
            mol.product = _contractSelct;
            
            mol.money = _moneySelect;
            
            mol.cycelTime = _TimeSelect;
            
            mol.Executiveprice = responseObject[@"resultStr"][@"price"];
            
            mol.type  = _TypeBuySelect;
            
            mol.isOrderBegin = YES;
            
            [maskView SureEnd];
            
            
            maskView.molmessage = mol;
            
            
            [self Reconnect];
            
            [self GetsouceAndRefresh];
            
            
//            if(_SelectOrder == 0){
//                
//                 [self getChiCangSouceLoad];
//            }
            
//            [self myRunloop];

        }else{
            
            [MBProgressHUD showError:responseObject[@"mess"]];
        }

    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        
        [MBProgressHUD hideHUD];
        
        [MBProgressHUD showError:@"服务器未连接"];
        
        
    }];
 
}


-(void)setStrmony:(NSNumber *)strmony{
    
    _strmony = strmony;
    
    self.headV.strmoney = [NSString stringWithFormat:@"%.f",strmony.floatValue];
    
}

-(void)setStrimage:(NSString *)strimage{
    
    _strimage = strimage;
    
    self.headV.strIcon = strimage;
}


-(NSInteger)SelectMoneyWithTag:(NSInteger)tag{
    
    if(tag ==0){
        
        return 5000;
        
    }else if(tag ==1){
        
        return 3000;
        
    }else if(tag ==2){
        
        return 2000;
        
    }else if(tag ==3){
        
        return 1000;
        
    }else if(tag ==4){
        
        return 500;
        
    }else if(tag ==5){
        
        return 300;
        
    }else if(tag ==6){
        
        return 200;
        
    }else{
        
        return 100;
    }
}

//Socket  链接

//初始化
- (void)Reconnect{
    self.webSocket.delegate = nil;
    [self.webSocket close];
    
    self.webSocket = [[SRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"ws://106.14.146.102:6379"]]];
    
    self.webSocket.delegate = self;
    
    [self.webSocket open];
}


//成功连接
- (void)webSocketDidOpen:(SRWebSocket *)webSocket {
    NSLog(@"Websocket Connected");
    if(_OneComing==0){
        
        _OneComing = 1;
        
        [self sendMessage:@"line"];

    }
}
//连接失败，打印错误信息
- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error {
    NSLog(@":( Websocket Failed With Error %@", error);
    
    self.webSocket = nil;

}
//接收服务器发送信息
- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message {
    
    NSLog(@"Received \"%@\"", message);
    
    NSString *strmessage =(NSString *) message;
    
    NSDictionary *dicsouce = [NSString  dictionaryWithJsonString:strmessage];
    
    if([dicsouce[@"type"] isEqualToString:@"ping"]){
        
        return;
    }
    
    [HMpiceFluctuationsDataSouce sharedpiceFluctuationsDataSouce].dicSouce = dicsouce[@"resultStr"];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    
    dic[@"contractSelct"]= @(_contractSelct);
    
    dic[@"MovementsSelect"]= @(_MovementsSelect);
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"DataChage" object:nil userInfo:dic];
    
    NSLog(@"%@",dicsouce);
    

}
// 长连接关闭
- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean {
    NSLog(@"WebSocket closed");
   
    self.webSocket = nil;
}
//该函数是接收服务器发送的pong消息
- (void)webSocket:(SRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload {
    
    NSString *reply = [[NSString alloc] initWithData:pongPayload encoding:NSUTF8StringEncoding];
    NSLog(@"%@",reply);
}


- (void)sendMessage:(NSString *)str {
 

    if (self.webSocket) {
        
        [self.webSocket send:str];
    }
}

-(NSMutableArray *)OrderMessageAry{
    
    
    if(_OrderMessageAry == nil){
        
        _OrderMessageAry =[[NSMutableArray alloc]init];
    }
    
    return _OrderMessageAry;
    
}

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}




//弹出盈利亏损框
- (void)methodFourGCDwith:(NSNumber *)orderId{
    
    
    if(_timce > 1) return;
    
    __block typeof(self) weakSelf = self;
    
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        
        [weakSelf delayMethodwith:orderId withDelegeat:weakSelf];
        
        _timce = 0;
    });
}

-(void)delayMethodwith:(NSNumber *)orderId  withDelegeat:(id)Dlegeate{
    
   
    
    NSMutableDictionary * dic = [[NSMutableDictionary alloc]init];
    
    dic[@"method"] = @"select_record_id";
    
    dic[@"usersessionid"] = [[NSUserDefaults standardUserDefaults]objectForKey:HMSESSIONId];
    
    dic[@"openid"] = [[NSUserDefaults standardUserDefaults]objectForKey:OPENId];
    
    dic[@"id"] = orderId;
    
    [HMServiceTool RequestWithDic:dic type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if([responseObject[@"resultStr"] isKindOfClass:[NSNull class]]){
            
            
            return ;
        }
        
        
        if(responseObject[@"resultStr"] == nil) return;
        
        if([responseObject[@"resultStr"][@"winmoney"] isKindOfClass:[NSNull class]]) return ;
        
        NSNumber * vinmoney =  responseObject[@"resultStr"][@"winmoney"];
        
        NSNumber * money =  responseObject[@"resultStr"][@"money"];
        
        
        HMorderMessageMol * MessageMol = [[HMorderMessageMol alloc]init];
        
        
        MessageMol.moneyprofit = vinmoney.floatValue- money.floatValue;
        
        MessageMol.dicSouce = responseObject[@"resultStr"];
        
        HMprofitMaskView * profitMaskView = [[HMprofitMaskView alloc]init];
        
        NSInteger  indexttag = [[[NSUserDefaults standardUserDefaults]objectForKey:@"maskTag"] integerValue];
        
        profitMaskView.TagMask = indexttag + 1;
        
        [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%ld",profitMaskView.TagMask] forKey:@"maskTag"];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"MaskShow" object:nil];
        
        
        profitMaskView.Delegeat = Dlegeate;

        if(vinmoney.floatValue- money.floatValue > 0){
            
            profitMaskView.profitIs = YES;
            
            
        }else{
            
            profitMaskView.profitIs = NO;
        }
        
        
        
        
        profitMaskView.molmessage = MessageMol;
        
        
        [profitMaskView ShowMaskView];
        
//        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(scrollTimer) userInfo:nil repeats:YES];
        
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        
        
        
    }];
    
    
}




//

-(void)myRunloop
{
    [NSThread detachNewThreadSelector:@selector(newThreadFun) toTarget:self withObject:nil];
}

-(void)newThreadFun
{
    @autoreleasepool {
        end =NO;
        NSRunLoop * myRunLoop =[NSRunLoop currentRunLoop];
        CFRunLoopObserverContext context = {0,CFBridgingRetain(self),NULL,NULL,NULL};
        CFRunLoopObserverRef observer = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, &myRunLoopObserver, &context);
        if (observer) {
            CFRunLoopRef cfRunloop = [myRunLoop getCFRunLoop];
            CFRunLoopAddObserver(cfRunloop, observer, kCFRunLoopDefaultMode);
        }
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerprocess) userInfo:nil repeats:YES];
        while (!end) {
            
            [myRunLoop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
        }
        
    }
}

-(void)timerprocess{

    [self getChiCangSouceLoad];
}
void myRunLoopObserver(CFRunLoopObserverRef observer,CFRunLoopActivity activity,void* info)
{
    switch (activity) {
        case kCFRunLoopEntry:
            NSLog(@"run loop entry");
            break;
        case kCFRunLoopBeforeTimers:
            NSLog(@"run loop before times");
            break;
        case kCFRunLoopBeforeSources:
            NSLog(@"run loop before sources");
            break;
        case kCFRunLoopBeforeWaiting:
            NSLog(@"run loop before waiting");
            break;
        case kCFRunLoopAfterWaiting:
            NSLog(@"run loop after waiting");
            break;
        case kCFRunLoopExit:
            NSLog(@"run loop exit");
            break;
        default:
            break;
    }
}


@end
