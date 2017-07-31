//
//  HMMyOrderVC.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/13.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMMyOrderVC.h"

#import "HMpaymentVC.h"

#import "HMdeliveryVC.h"

#import "HMgoodsVC.h"

#import "HMdealVC.h"


#import "HMHeadOrderV.h"

@interface HMMyOrderVC ()
<HMHeadOrderVDelegeat>

@property(strong,nonatomic)HMpaymentVC * paymentVc;

@property(strong,nonatomic)HMdeliveryVC * deliveryVC;

@property(strong,nonatomic)HMgoodsVC * goodsVC;

@property(strong,nonatomic)HMdealVC * dealVC;

@property(weak,nonatomic)HMHeadOrderV * headV;

@end

@implementation HMMyOrderVC


-(void)HeadOrderV:(HMHeadOrderV *)HeadOrderV SelectIndex:(NSInteger)index{
    
    switch (index) {
        case 0:{
            

            [_dealVC.view removeFromSuperview];
            
            [_goodsVC.view removeFromSuperview];
            
            [_deliveryVC.view removeFromSuperview];
            
            
            [self addChildViewController:self.paymentVc];
            
            [self.view addSubview:self.paymentVc.view];
            
            self.paymentVc.view.frame = self.view.bounds;
            
            
            self.paymentVc.view.y = self.headV.maxY;
            
            self.paymentVc.view.height = self.view.height - self.headV.maxY;
        }
  
            break;
            
        case 1:{
            
            [_dealVC.view removeFromSuperview];
            
            [_goodsVC.view removeFromSuperview];
            
            [_paymentVc.view removeFromSuperview];
            
            
            [self addChildViewController:self.deliveryVC];
            
            [self.view addSubview:self.deliveryVC.view];
            
            self.deliveryVC.view.frame = self.view.bounds;
            
            
            self.deliveryVC.view.y = self.headV.maxY;
            
            self.deliveryVC.view.height = self.view.height - self.headV.maxY;
            
        }
            
            break;
            
        case 2:{
            
            [_dealVC.view removeFromSuperview];
            
            [_deliveryVC.view removeFromSuperview];
            
            [_paymentVc.view removeFromSuperview];
            
            
            [self addChildViewController:self.goodsVC];
            
            [self.view addSubview:self.goodsVC.view];
            
            self.goodsVC.view.frame = self.view.bounds;
            
            
            self.goodsVC.view.y = self.headV.maxY;
            
            self.goodsVC.view.height = self.view.height - self.headV.maxY ;
        }
            
            break;
            
        case 3:{
            
            [_goodsVC.view removeFromSuperview];
            
            [_deliveryVC.view removeFromSuperview];
            
            [_paymentVc.view removeFromSuperview];
            
            
            [self addChildViewController:self.dealVC];
            
            [self.view addSubview:self.dealVC.view];
            
            self.dealVC.view.frame = self.view.bounds;
            
            
            self.dealVC.view.y = self.headV.maxY;
            
            self.dealVC.view.height = self.view.height - self.headV.maxY ;

        }
            
            break;
            
        default:
            break;
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HMHeadOrderV * headVie = [HMHeadOrderV HeadVIew];
    _headV = headVie;
    
    headVie.Delegeat = self;
    
    headVie.x = 0 ;
    
    headVie.y = 64;
    
    headVie.height = 38;
    
    headVie.width = self.view.width;
    
    headVie.selectIndex = self.SelectIndex;
    
    [self.view addSubview:headVie];
    
     
    switch (self.SelectIndex) {
        case 0:{
        
            [self addChildViewController:self.paymentVc];
            
            [self.view addSubview:self.paymentVc.view];
            
            self.paymentVc.view.frame = self.view.bounds;
            
            
            self.paymentVc.view.y = self.headV.maxY;
            
            self.paymentVc.view.height = self.view.height - self.headV.maxY  ;
        }
            
            break;
            
        case 1:{
            
     
            [self addChildViewController:self.deliveryVC];
            
            [self.view addSubview:self.deliveryVC.view];
            
            self.deliveryVC.view.frame = self.view.bounds;
            
            
            self.deliveryVC.view.y = self.headV.maxY;
            
            self.deliveryVC.view.height = self.view.height - self.headV.maxY ;
            
        }
            
            break;
            
        case 2:{
   
            
            [self addChildViewController:self.goodsVC];
            
            [self.view addSubview:self.goodsVC.view];
            
            self.goodsVC.view.frame = self.view.bounds;
            
            
            self.goodsVC.view.y = self.headV.maxY;
            
            self.goodsVC.view.height = self.view.height - self.headV.maxY ;
        }
            
            break;
            
        case 3:{
            
 
            [self addChildViewController:self.dealVC];
            
            [self.view addSubview:self.dealVC.view];
            
            self.dealVC.view.frame = self.view.bounds;
            
            
            self.dealVC.view.y = self.headV.maxY;
            
            self.dealVC.view.height = self.view.height - self.headV.maxY;
            
        }
            
            break;
            
        default:
            break;
    }

    
    NSLog(@"%ld",self.SelectIndex);
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
//    self.headV.selectIndex = self.SelectIndex;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(HMpaymentVC *) paymentVc{
    
    
    if(_paymentVc == nil){
        
        _paymentVc = [[HMpaymentVC alloc]init];
        
    }
    
    return _paymentVc;
    
}

-(HMdeliveryVC *)deliveryVC{
    
    if(_deliveryVC ==nil){
        
        _deliveryVC = [[HMdeliveryVC alloc]init];
    }
    
    return _deliveryVC;
    
}


-(HMgoodsVC *)goodsVC{
    
    if(_goodsVC == nil){
        
        _goodsVC = [[HMgoodsVC alloc]init];
    }
    
    return _goodsVC;
}


-(HMdealVC *)dealVC{
    
    if(_dealVC ==nil){
        
        _dealVC = [[HMdealVC alloc]init];
    }
    
    return _dealVC;
    
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
