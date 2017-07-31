//
//  HMUserHeadView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/22.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMUserHeadView.h"

#import "HMUserMessageModel.h"

@interface HMUserHeadView ()

@property (weak, nonatomic) IBOutlet UIImageView *PerSonIcon;


@property (weak, nonatomic) IBOutlet UIView *withdrawalView;

@property (weak, nonatomic) IBOutlet UIView *topUUpView;
@property (weak, nonatomic) IBOutlet UILabel *monelable;
@property (weak, nonatomic) IBOutlet UILabel *Name;

@end

@implementation HMUserHeadView

+(instancetype)UserHeadView{
    
    return  [[[NSBundle mainBundle]loadNibNamed:@"HMUserHeadView" owner:self options:nil] lastObject];
}

+(CGFloat)UserHeadViewHeigth{
    
    return 150;
    
}

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    
    _PerSonIcon.layer.cornerRadius = 40/2;
    
    _PerSonIcon.layer.borderWidth = 1;
    
    _PerSonIcon.clipsToBounds = YES;
    
    _PerSonIcon.layer.borderColor = [UIColor blackColor].CGColor;
    
    
    _PerSonIcon.image = [UIImage imageNamed:HMPlaceHolderImage];
    
    UITapGestureRecognizer *tapwithdrawal = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(withdrawal)];
    
    
     UITapGestureRecognizer *tapopUUp = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(opUUp)];
    
    
    [self.withdrawalView addGestureRecognizer:tapwithdrawal];
    
    
    [self.topUUpView addGestureRecognizer:tapopUUp];
    
    _monelable.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];

    
}

-(void)withdrawal{
    
    if(self.Delegeat && [self.Delegeat respondsToSelector:@selector(withdrawalButtonAction)]){
        
        [self.Delegeat withdrawalButtonAction];
    }
    
}

-(void)opUUp{
    
    if(self.Delegeat && [self.Delegeat respondsToSelector:@selector(topUUpButtonAction)]){
        
        [self.Delegeat topUUpButtonAction];
    }
    
}

-(void)setMoney:(NSString *)money{
    
    _money = money;
    
    _monelable.text = money;
}



-(void)setUsermessageMol:(HMUserMessageModel *)usermessageMol{
    
    _usermessageMol = usermessageMol;
    
//    [self.PerSonIcon sd_setImageWithURL:[NSURL URLWithString:usermessageMol.strIcon] placeholderImage:[UIImage imageNamed:HMPlaceHolderImage]];
//
//    self.Name.text = usermessageMol.name;
    
    self.Name.text = usermessageMol.strNum;
    

    
}

@end
