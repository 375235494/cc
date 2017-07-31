//
//  HMHeadView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/7/2.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMHeadView.h"

@interface HMHeadView ()
@property (weak, nonatomic) IBOutlet UIButton *coupons;

@property (weak, nonatomic) IBOutlet UIImageView *Iconimage;

@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;

@end

@implementation HMHeadView

+(instancetype)HeadView{

    return [[[NSBundle mainBundle]loadNibNamed:@"HMHeadView" owner:self options:nil] lastObject];
}

-(void)awakeFromNib{
    //111
    [super awakeFromNib];
    
    _moneyLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
    
    self.Iconimage.layer.cornerRadius  =  60/2;
    self.Iconimage.layer.masksToBounds = YES;
    
    
    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(settlementIconimageClick)];
    
    self.Iconimage.userInteractionEnabled = YES;//打开用户交互
    [self.Iconimage addGestureRecognizer:tapGesturRecognizer];
    
    
}

- (IBAction)couponsAction:(id)sender {
    
    if(self.Delegeat && [self.Delegeat respondsToSelector:@selector(willcouponsAction)]){
        
        [self.Delegeat willcouponsAction];
    }
}

- (IBAction)topUpAction:(id)sender {
    
    if(self.Delegeat && [self.Delegeat respondsToSelector:@selector(willtopUpAction)]){
        
        [self.Delegeat willtopUpAction];
    }
    
}

- (IBAction)withdrawalAction:(id)sender {
    
    if(self.Delegeat && [self.Delegeat respondsToSelector:@selector(willwithdrawalAction)]){
        
        [self.Delegeat willwithdrawalAction];
    }
    
}

- (void)settlementIconimageClick
{
    
    if(self.Delegeat && [self.Delegeat respondsToSelector:@selector(jumpUserCenter)]){
        
        [self.Delegeat jumpUserCenter];
    }

}


-(void)setStrIcon:(NSString *)strIcon{
    
    _strIcon = strIcon;
    
    //    [self.imageIcon sd_setImageWithURL:[NSURL URLWithString:strIcon] placeholderImage:[UIImage imageNamed:HMPlaceHolderImage]];
    
    self.Iconimage.image = [UIImage imageNamed:HMPlaceHolderImage];
    
}

-(void)setStrmoney:(NSString *)strmoney{
    
    _strmoney = strmoney;
    
    _moneyLabel.text = strmoney;
    
}




@end
