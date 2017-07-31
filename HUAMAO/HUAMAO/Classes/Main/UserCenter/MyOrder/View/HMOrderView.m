//
//  HMOrderView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/13.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMOrderView.h"

@interface HMOrderView ()
@property (weak, nonatomic) IBOutlet UIImageView *imgIcon;

@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@property (weak, nonatomic) IBOutlet UILabel *moneyLable;
@property (weak, nonatomic) IBOutlet UILabel *proLable;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *ZXLable;
@property (weak, nonatomic) IBOutlet UILabel *THLable;

@end

@implementation HMOrderView

-(void)awakeFromNib{
    
    [super awakeFromNib];

    
    self.ZXLable.layer.borderColor = UIColorFromHex(0xBC0F17, 1).CGColor;
    
    self.ZXLable.layer.borderWidth = 1;
    
    self.ZXLable.layer.cornerRadius = 5;
    
    self.THLable.layer.borderColor = UIColorFromHex(0xBC0F17, 1).CGColor;
    
    self.THLable.layer.borderWidth = 1;
    
    self.THLable.layer.cornerRadius = 5;
    
}

+(instancetype)OrderView{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"OrderView" owner:self options:nil]lastObject];
}

-(void)setDicSouce:(NSDictionary *)dicSouce{
    
    _dicSouce = dicSouce;
    
    NSLog(@"%@",dicSouce);
    
    [self.imgIcon sd_setImageWithURL:[NSURL URLWithString:dicSouce[@"commodity"][@"cimg"]] placeholderImage:[UIImage imageNamed:HMPlaceHolderImage]];
    
    self.titleLable.text = dicSouce[@"commodity"][@"csummary"];
    
    
    self.proLable.text = [NSString stringWithFormat:@"数量: %@",dicSouce[@"commodity"][@"cname"]];
    
    
    self.number.text =[NSString stringWithFormat:@"x%ld",[dicSouce[@"orderReq"][@"shopnumber"] integerValue]];

    self.moneyLable.text = [NSString stringWithFormat:@"%.f",[dicSouce[@"orderReq"][@"shopprice"] floatValue]];
    
    
}

@end
