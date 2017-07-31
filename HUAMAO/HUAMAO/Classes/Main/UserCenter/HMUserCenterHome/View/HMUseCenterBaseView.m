//
//  HMUseCenterBaseView.m
//  HUAMAO
//
//  Created by 孙密 on 17/5/17.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMUseCenterBaseView.h"

@interface HMUseCenterBaseView ()

@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *title;

@end

@implementation HMUseCenterBaseView

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    self.icon.contentMode = UIViewContentModeCenter;
    
    self.title.textColor = UIColorFromHex(0xAEADAD, 1);
    
    
    self.backgroundColor = UIColorFromHex(0x1b1b1b, 1);
    
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if(self = [super initWithCoder:aDecoder]){
        
    }
    
    return self;
}

-(void)setImage :(NSString *)strimage andTitel:(NSString *)title{
    
    self.icon.image = [UIImage imageNamed:strimage];
    
    self.title.text = title;
    
    self.title.font = HMFontSIZE;
}


+(instancetype)HMUseCenterBaseView{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"HMUseCenterBaseView" owner:self options:nil]lastObject];
}

@end
