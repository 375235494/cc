//
//  HMDelegeatView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/16.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMDelegeatView.h"

#import "HMDelegeatView.h"

#import "HMMainTabBarVC.h"

#import "HMDelegeatTextView.h"

@interface HMDelegeatView ()



@property (weak, nonatomic) IBOutlet UIButton *KKButton;

@property (weak, nonatomic) IBOutlet UILabel *DelegeatLable;

@end


@implementation HMDelegeatView


-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    self.KKButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -30);
    
    
    self.KKButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -20);
    
    
    self.DelegeatLable.userInteractionEnabled = YES;
    
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DelegeatAction:)];
    
    
    [self.DelegeatLable addGestureRecognizer:tap];
    
    
    
}


-(void)DelegeatAction:(UITapGestureRecognizer *)tap{
    

    self.DelegeatLableAction();
    
}

+(instancetype)DelegeatView{
    
    return  [[[NSBundle mainBundle]loadNibNamed:@"HMDelegeatView" owner:self options:nil]lastObject];
}


- (IBAction)selectSureAction:(id)sender {
    
    UIButton * button  = (UIButton *) sender;
    
    
    button.selected = ! button.selected;
}


- (IBAction)cancelAction:(id)sender {
    
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    
    HMMainTabBarVC * rootVC = (HMMainTabBarVC * )window.rootViewController;
    
    
    rootVC.selectedIndex = 0;
    
    self.CancelButtonAction();
}



- (IBAction)acceptAction:(id)sender {
    
    if(self.SelectSureButton.selected == YES){
        
        NSString *app_build = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
        [[NSUserDefaults standardUserDefaults]setObject:app_build forKey:@"Build"];
    
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        self.SureButtonAction();
        
    }else{
        
        
        [MBProgressHUD showError:@"请确认接受协议"];
        
    }
    
}




@end
