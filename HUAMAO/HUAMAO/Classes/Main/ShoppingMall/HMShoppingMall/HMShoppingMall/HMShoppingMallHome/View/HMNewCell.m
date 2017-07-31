//
//  HMNewCell.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/12.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMNewCell.h"

@interface HMNewCell ()

@property (weak, nonatomic) IBOutlet UILabel *label1;

@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *RY1;
@property (weak, nonatomic) IBOutlet UILabel *RY2;

@end

@implementation HMNewCell

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    self.RY1.layer.borderColor = [UIColor redColor].CGColor;
    
    self.RY1.layer.borderWidth = 1;
    
    self.RY1.layer.cornerRadius = 5;
    
    
    self.RY2.layer.borderColor = [UIColor redColor].CGColor;
    
    self.RY2.layer.borderWidth = 1;
    
    self.RY2.layer.cornerRadius = 5;
    
    
    
}

+(instancetype)NewCell{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"HMNewCell" owner:self options:nil]lastObject];
}

-(void)setArysouce:(NSArray *)arysouce{
    
    _arysouce = arysouce;
    
    
    self.label1.text = arysouce[0];
    self.label1.textColor = HMUIColorFromRgbAlpha(0xa0a0a0, 1);
    
    self.label2.text = arysouce[1];
    self.label2.textColor = HMUIColorFromRgbAlpha(0xa0a0a0, 1);
}

@end
