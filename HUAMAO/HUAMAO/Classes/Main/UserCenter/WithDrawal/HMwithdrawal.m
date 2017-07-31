//
//  HMwithdrawal.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/18.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMwithdrawal.h"

#import "HMwithdrawalModel.h"

#import "HMBindingBank.h"

#import "HMServiceTool.h"

#import "HMwithdrawalView.h"


@interface HMwithdrawal ()
<UIScrollViewDelegate,
HMwithdrawalViewDelegeat>

@property(strong,nonatomic)HMwithdrawalView * withdrawalView;

@property(strong,nonatomic)UIScrollView * scrolV;

@end

@implementation HMwithdrawal


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [self.view endEditing:YES];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.hidden = YES;
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.scrolV.frame = [UIApplication sharedApplication].keyWindow.bounds;
    
    self.scrolV.y = - 20;
    
    self.scrolV.height = self.scrolV.height + 20;
    
    [self.view addSubview:self.scrolV];

    self.withdrawalView.frame = [UIApplication sharedApplication].keyWindow.bounds;
    
    self.withdrawalView.height = 645;
    
    [self.scrolV addSubview:self.withdrawalView];
    
    UIImageView * imageV = [[UIImageView alloc]init];
    
    imageV.x = 0 ;
    
    imageV.y = self.withdrawalView.maxY;
    
    imageV.height = 135;
    
    imageV.width = self.view.width;
 
    imageV.image = [UIImage imageNamed:@"提现底部图片"];
    
    [self.scrolV addSubview:imageV];

    self.scrolV.contentSize = CGSizeMake(0, imageV.maxY + 30);

}



-(UIScrollView *)scrolV{
    
    if(_scrolV == nil){
    
        _scrolV = [[UIScrollView alloc]init];
        
        _scrolV.delegate = self;
    }
    
    return _scrolV;
}

-(HMwithdrawalView *)withdrawalView{
    
    if(_withdrawalView == nil){
        
        _withdrawalView =[HMwithdrawalView withdrawalView];
        
        _withdrawalView.Delegeat = self;
        
    }
    
    return _withdrawalView;
    
}






-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];

    self.withdrawalView.withdrawalMessage = self.withdrawalMessage;

}


-(void)CardbindingDoing:(HMwithdrawalView *)withdrawalView{
    
    
    HMBindingBank * bankVC = [[HMBindingBank alloc]init];


    bankVC.withdrawalMessage = self.withdrawalMessage;

    [self.navigationController pushViewController:bankVC animated:YES];

}


-(void)Back:(HMwithdrawalView *)withdrawalView{
    
    [self.navigationController popViewControllerAnimated:YES];
}




@end
