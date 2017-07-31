//
//  HMShoppingMallHomeVC.m
//  HUAMAO
//
//  Created by 孙密 on 17/5/17.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMHeadView.h"

#import "HMShoppingMallHomeVC.h"

#import "HMdetailsVC.h"

#import "HMshufflingView.h"

#import "HMlistView.h"

#import "HMgoodsView.h"

#import "HMDetailListV.h"

#import "HMDetailModel.h"

#import "HMTopUp.h"

#import "HMwithdrawal.h"

#import "HMwithdrawalModel.h"

#import "HMNewsV.h"

#import "HMLoginShowmask.h"

#import "HMintervalView.h"


@interface HMShoppingMallHomeVC ()
<ButtonListViewDelegeat,
HeadViewDelegeat,
goodsViewDelegeat>

@property (weak, nonatomic) IBOutlet UIScrollView *backScrolView;

@property(weak,nonatomic)HMDetailListV * detailList ;

@property(weak,nonatomic)HMgoodsView * goodsView;

@property(copy,nonatomic)NSString * strimage;

@property(strong,nonatomic)NSNumber * mUid;

@property(strong,nonatomic)NSNumber * strmony;

@property(weak,nonatomic)HMHeadView * headV;

@property(strong,nonatomic)HMwithdrawalModel *withdrawal;


@property(strong,nonatomic)NSArray * arySouce;

@end

@implementation HMShoppingMallHomeVC



-(void)goodsView:(HMgoodsView *)goodsView SelectIndex:(NSInteger)index{
    
    if(_arySouce && _arySouce.count >= 8){
        
        NSDictionary * dic = self.arySouce[index-1];
        
        
        NSNumber * numId = dic[@"id"];
        
        HMdetailsVC * detailVC = [[HMdetailsVC alloc]init];
        
        detailVC.DetailsId = numId;
        
        detailVC.dicDetails = dic;
        
        [self.navigationController pushViewController:detailVC animated:YES];

        
    }
    
    
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(void)willcouponsAction{
    
    
    
  
}


-(void)willtopUpAction{
    
    NSLog(@"chongzhi");
    
    HMTopUp * TopUp = [[HMTopUp alloc]init];
    
    TopUp.mUid = self.mUid;
    
    TopUp.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:TopUp animated:YES];
    
}


-(void)willwithdrawalAction{
    
    HMwithdrawal * withdrawal = [[HMwithdrawal alloc]init];
    
    withdrawal.withdrawalMessage = self.withdrawal;
    
    withdrawal.mUid = self.mUid;
    
    withdrawal.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:withdrawal animated:YES];
}



#pragma 跳转个人中心
- (void)jumpUserCenter{

  self.tabBarController.selectedIndex = 3;

}

-(HMwithdrawalModel*)withdrawal {
    
    if(_withdrawal == nil){
        
        _withdrawal = [[HMwithdrawalModel alloc]init];
    }
    
    return _withdrawal;
    
}


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

    //    [MBProgressHUD showMessage:@"正在加载..."];
    
    [HMServiceTool RequestWithDic:getuserinfoDic type:URLtypeUSER RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        NSLog(@"%@",responseObject);
        
         self.withdrawal.dicsouce = responseObject[@"resultStr"];
        
        
        self.strimage = responseObject[@"resultStr"][@"head"];
        
        self.strmony = responseObject[@"resultStr"][@"account"];
        
        
        self.mUid = responseObject[@"resultStr"][@"id"];

        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        NSLog(@"%@",error);
        
        //        [MBProgressHUD hideHUD];
        
        //        [MBProgressHUD showError:@"服务器未连接"];
        
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


-(void)HMButtonListView :(HMDetailListV *)DetailListV index:(NSInteger)index{
    
    NSDictionary * dic = DetailListV.arysouce[index-100];
    
    
    NSNumber * numId = dic[@"id"];
    
    HMdetailsVC * detailVC = [[HMdetailsVC alloc]init];
    
    detailVC.DetailsId = numId;
    
     detailVC.dicDetails = dic;
    
    [self.navigationController pushViewController:detailVC animated:YES];

}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = HMUIColorFromRgbAlpha(0x0f0f0f , 1);
    
    self.backScrolView.backgroundColor = HMUIColorFromRgbAlpha(0x0f0f0f , 1);
    
    self.navigationController.navigationBar.hidden = YES;
    
    [self creatUI];
    
    [self GGLoad];

    
    [self detailListSouce];

}


-(void)GGLoad{
    
    NSMutableDictionary *dicGG = [[NSMutableDictionary alloc]init];
    
    dicGG[@"method"] = @"getAnnouncePage";
    
    dicGG[@"type"] = @"announcelog";
    
    dicGG[@"pageNo"] = @0;
    
    dicGG[@"pageSize"] = @1;
    
    [HMServiceTool RequestWithDic:dicGG type:URLtypeAPP RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        NSLog(@"%@",responseObject);
        
        HMLoginShowmask *mask =  [[HMLoginShowmask alloc]init];
        
        [mask ShowMaskView];
        
        mask.logingMessage = responseObject[@"resultStr"][0][@"cont"][0][@"val"];
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        [MBProgressHUD showError:@"服务器未连接"];
        
        
    }];
    
    
    
}

//view即将显示时隐藏nav
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    [self GetsouceAndRefresh];

}
//view即将显示时显示nav
- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];

//    [self detailListSouce];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}



-(void)creatUI{
    
    
    HMHeadView * headV = [HMHeadView HeadView];
    
    headV.Delegeat =self;
    
    _headV = headV;
    
    headV.x = 0 ;
    
    headV.y = 0;
    
    headV.height = 80;
    
    headV.width = HMLXScreenWidth;
    
    [self.backScrolView addSubview:headV];
    
    HMshufflingView * shufflingV = [HMshufflingView shufflingView];
    
    shufflingV.x = 0 ;
    
    shufflingV.y = headV.maxY;
    
    shufflingV.height = 150;
    
    shufflingV.width = HMLXScreenWidth;
    
    [self.backScrolView addSubview:shufflingV];
    
    
    HMlistView * listV = [HMlistView listView];
    
    listV.y = shufflingV.maxY;
    
    listV.height = 200;
    
    listV.width = HMLXScreenWidth;
    
    listV.x = 0 ;
    

    [self.backScrolView addSubview:listV];
    
    
    HMNewsV * newsV = [[HMNewsV alloc]initWithFrame:CGRectMake(0, listV.maxY, HMLXScreenWidth, 60)];
    
    newsV.backgroundColor = HMUIColorFromRgb(0x151515);
    
    [self.backScrolView addSubview:newsV];
    
    
    HMgoodsView * goodsView = [HMgoodsView goodsView];
    
    
    goodsView.Delegeat = self;
    
    goodsView.height = 320;
    
    goodsView.width = HMLXScreenWidth;
    
    goodsView.x = 0 ;
    
    goodsView.y = newsV.maxY + 10;
    
    
    _goodsView = goodsView;
    
     [self.backScrolView addSubview:goodsView];
    
    
    HMintervalView * interval = [[HMintervalView alloc]initWithFrame:CGRectMake(0, goodsView.maxY, HMLXScreenWidth, 30)];
    
//    interval.backgroundColor = [UIColor whiteColor];
    
     [self.backScrolView addSubview:interval];
    
    
    
    HMDetailListV * detailList  = [[HMDetailListV alloc]init];
    
    detailList.x = 0 ;
    
    detailList.y = interval.maxY ;
    
    detailList.height = 0;
    
    detailList.width =HMLXScreenWidth;
    
    detailList.Delegeat = self;
    
    
    [self.backScrolView addSubview:detailList];

    _detailList = detailList;
    
    self.backScrolView.contentSize = CGSizeMake(0, self.detailList.maxY);
    

}


-(void)detailListSouce{
    

    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    
    dic[@"method"] = @"selectshop";

    
    [HMServiceTool RequestWithDic:dic type:URLtypeAPP RequestType:RequesttypeGet success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        NSLog(@"%@",responseObject);
        
        if([responseObject[@"flag"] integerValue] == 0) return ;
         
        NSArray * arysouce = responseObject[@"resultStr"];
        
        
//        NSMutableArray * aryHM  = [[NSMutableArray alloc]init];
//        
//        for(int i = 0 ; i< arysouce.count ; i++){
//            
//            HMDetailModel *mol  = [HMDetailModel  DetailModelWithDic:arysouce[i]];
//            
//            
//            [aryHM addObject:mol];
//        }
//        
        
        _arySouce = arysouce;
        
        self.detailList.arysouce =  arysouce;
        
        self.detailList.height = [self.detailList DetailListVHeigth];
      
        
        self.backScrolView.contentSize = CGSizeMake(0, self.backScrolView.contentSize.height + self.detailList.height );
        
  
        
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        
        [MBProgressHUD hideHUD];
        
        [MBProgressHUD showError:@"服务器未连接"];
        
        
    }];
    
    
    
}




@end
