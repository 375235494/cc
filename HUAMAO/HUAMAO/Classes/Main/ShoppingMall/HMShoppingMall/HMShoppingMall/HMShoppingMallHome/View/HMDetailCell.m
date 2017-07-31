//
//  HMDetailCell.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/7/3.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMDetailCell.h"

#import "HMDetailModel.h"

@interface HMDetailCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageIcon;


@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *YJLable;

@property (weak, nonatomic) IBOutlet UILabel *detail;
@property (weak, nonatomic) IBOutlet UILabel *price;

@end

@implementation HMDetailCell


-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    
    self.backgroundColor = HMUIColorFromRgb(0x202020);
    self.YJLable.layer.borderColor = [UIColor redColor].CGColor;
    
    self.YJLable.layer.borderWidth = 1;
    
    self.YJLable.layer.cornerRadius = 5;
    
}

+(instancetype)DetailCell{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"HMDetailCell" owner:self options:nil]lastObject];
}


-(void)setDicsouce:(NSDictionary *)dicsouce{
    
    _dicsouce = dicsouce;
    
    
    [self.imageIcon sd_setImageWithURL:[NSURL URLWithString:dicsouce[@"cimg"]] placeholderImage:[UIImage imageNamed:HMPlaceHolderImage]];
    
    
    self.name.text = dicsouce[@"cname"];
    
    self.detail.text = dicsouce[@"csummary"];
    
    CGFloat floatPrice = [dicsouce[@"newprice"] floatValue];
    
    self.price.text =  [NSString stringWithFormat:@"%.f" , floatPrice];
    
    
    
}


@end
