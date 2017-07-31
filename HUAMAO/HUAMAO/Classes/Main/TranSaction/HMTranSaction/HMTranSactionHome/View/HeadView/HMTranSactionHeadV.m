//
//  HMTranSactionHeadV.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMTranSactionHeadV.h"

#import "HMTextScrolView.h"

@interface HMTranSactionHeadV()

@property (weak, nonatomic) IBOutlet UIImageView *imageIcon;

@property (weak, nonatomic) IBOutlet UIButton *withdrawal;

@property (weak, nonatomic) IBOutlet UIButton *Topup;

@property (weak, nonatomic) IBOutlet UIButton *GongGao;


@property (weak, nonatomic) IBOutlet UIView *boxView;

@end



@implementation HMTranSactionHeadV




- (IBAction)InvitationAction:(id)sender {
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(InvitationShow)]){
        
        [self.delegate InvitationShow];
        
    }
    
}

- (IBAction)withdrawalAction:(UIButton *)sender {
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(withdrawalButtonAction)]){
        
        [self.delegate withdrawalButtonAction];
        
    }
}

- (IBAction)topup:(id)sender {
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(topUUpButtonAction)]){
        
        [self.delegate topUUpButtonAction];
        
    }
    
}
- (IBAction)announcementAction:(id)sender {
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(announcementAction)]){
        
        [self.delegate announcementAction];
        
    }
    
    
    
}

- (void)settlementIconimageClick
{
    if(self.delegate && [self.delegate respondsToSelector:@selector(jumpUserCenter)]){
        
        [self.delegate jumpUserCenter];
    }


}

-(void)setStrIcon:(NSString *)strIcon{
    
    _strIcon = strIcon;
    
//    [self.imageIcon sd_setImageWithURL:[NSURL URLWithString:strIcon] placeholderImage:[UIImage imageNamed:HMPlaceHolderImage]];
    
    self.imageIcon.image = [UIImage imageNamed:HMPlaceHolderImage];
    
}

-(void)setStrmoney:(NSString *)strmoney{
    
    _strmoney = strmoney;
 
    _money.text = strmoney;
    
}
//
//-(instancetype)initWithCoder:(NSCoder *)aDecoder{
//    
//    if(self = [super initWithCoder:aDecoder]){
//        
//        HMTextScrolView  *  TextScrolView = [[HMTextScrolView alloc]init];
//        
//        TextScrolView.x = 8 ;
//        
//        
//        TextScrolView.y = 0;
//        
//        TextScrolView.height = 20;
//        
//        TextScrolView.width = 100;
//        
//        
//        [self.boxView addSubview:TextScrolView];
//        
//        
//    }
//    
//    return self;
//}

-(void)awakeFromNib{
    
    
    [super awakeFromNib];
    

    
    
    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(settlementIconimageClick)];
    
    self.imageIcon.userInteractionEnabled = YES;//打开用户交互
    [self.imageIcon addGestureRecognizer:tapGesturRecognizer];
    
//    self.Topup.backgroundColor= HMUIColorFromRgbAlpha(0xfdbe19 , 1);
//    
//    self.Topup.layer.cornerRadius = HMCORNERRadius;
//    
//    
//    self.Topup.layer.masksToBounds = YES;
//    
//    
//    self.withdrawal.backgroundColor= HMUIColorFromRgbAlpha(0xfdbe19 , 1);
//    
//    self.withdrawal.layer.cornerRadius = HMCORNERRadius;
//    
//    
//    self.withdrawal.layer.masksToBounds = YES;
    
//    self.withdrawal.imageEdgeInsets = UIEdgeInsetsMake(0, -4 * kHMScreenWidth_Case *2 , 0, 0);
//    
//    self.withdrawal.titleEdgeInsets = UIEdgeInsetsMake(0, 4 * kHMScreenWidth_Case *2, 0, 0);
//    
//    self.Topup.imageEdgeInsets = UIEdgeInsetsMake(0, -4* kHMScreenWidth_Case *2 , 0, 0);
//    
//    self.Topup.titleEdgeInsets = UIEdgeInsetsMake(0, 4 * kHMScreenWidth_Case *2, 0, 0);
//    
//    self.GongGao.imageEdgeInsets = UIEdgeInsetsMake(0, -4* kHMScreenWidth_Case *2 , 0, 0);
//    
//    self.GongGao.titleEdgeInsets = UIEdgeInsetsMake(0, 4 * kHMScreenWidth_Case *2, 0, 0);
    
    _money.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
    
    self.imageIcon.layer.cornerRadius  =  59/2;
    
    
    self.imageIcon.layer.masksToBounds = YES;
    
}


+(instancetype)TranSactionHeadV{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"HMTranSactionHeadV" owner:self options:nil]lastObject];
    
}

@end
