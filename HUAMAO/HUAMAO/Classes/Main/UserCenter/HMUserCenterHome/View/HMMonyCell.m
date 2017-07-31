//
//  HMMonyCell.m
//  HUAMAO
//
//  Created by 孙密 on 17/5/18.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMMonyCell.h"

@interface HMMonyCell()

@property (weak, nonatomic) IBOutlet UILabel *mony;

@property (weak, nonatomic) IBOutlet UIButton *withdrawalButton;

@property (weak, nonatomic) IBOutlet UIButton *topUUpButton;

@end

@implementation HMMonyCell

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    self.withdrawalButton.backgroundColor= HMUIColorFromRgbAlpha(0xfdbe19 , 1);
    
    self.withdrawalButton.layer.cornerRadius = HMCORNERRadius;
    
    self.mony.textColor = HMUIColorFromRgb(0xfdbe19);
    
    
    self.withdrawalButton.layer.masksToBounds = YES;
    
    self.topUUpButton.backgroundColor= HMUIColorFromRgbAlpha(0xfdbe19 , 1);
    
    self.topUUpButton.layer.cornerRadius = HMCORNERRadius;
    
    
    self.topUUpButton.layer.masksToBounds = YES;
    
    
    [self.withdrawalButton addTarget:self action:@selector(withdrawalButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
     [self.topUUpButton addTarget:self action:@selector(topUUpButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.withdrawalButton.imageEdgeInsets = UIEdgeInsetsMake(0, -7 * kHMScreenWidth_Case *2 , 0, 0);
    
    self.withdrawalButton.titleEdgeInsets = UIEdgeInsetsMake(0, 7 * kHMScreenWidth_Case *2, 0, 0);
    
    self.topUUpButton.imageEdgeInsets = UIEdgeInsetsMake(0, -7* kHMScreenWidth_Case *2 , 0, 0);
    
    self.topUUpButton.titleEdgeInsets = UIEdgeInsetsMake(0, 7 * kHMScreenWidth_Case *2, 0, 0);
    
    

}

-(void)withdrawalButtonAction:(UIButton *)button{
    
    if(self.Delegate &&[self.Delegate respondsToSelector:@selector(withdrawalButtonAction)]){
        
        [self.Delegate withdrawalButtonAction];
    }
    
}

-(void)topUUpButtonAction:(UIButton *)button{
    
    if(self.Delegate &&[self.Delegate respondsToSelector:@selector(topUUpButtonAction)]){
        
        [self.Delegate topUUpButtonAction];
    }
    
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if(self = [super initWithCoder:aDecoder]){
        
    }
    
    return self;
}

-(void)setStrMony:(NSNumber *)strMony{
    
    
    _strMony = strMony;

//    self.mony.text = strMony;
    self.mony.text = [NSString stringWithFormat:@"%.1f",[strMony floatValue]];
    
}



+(instancetype)MonyCell{
    
    HMMonyCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"HMMonyCell" owner:self options:nil]lastObject];
    
    cell.backgroundColor =  UIColorFromHex(0x1b1b1b, 1);
    
    return cell;
}


+(CGFloat)MonyCellHeigth{
    
    return 50;
    
}


@end
