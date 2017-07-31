//
//  HMHeadCell.m
//  HUAMAO
//
//  Created by 孙密 on 17/5/18.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMHeadCell.h"

@interface HMHeadCell()
@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *Name;

@property (weak, nonatomic) IBOutlet UILabel *number;

@property (weak, nonatomic) IBOutlet UILabel *mony;

@property (weak, nonatomic) IBOutlet UILabel *haveNum;
@end

@implementation HMHeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(instancetype)HeadCell{
    
    HMHeadCell *cell =  [[[NSBundle mainBundle]loadNibNamed:@"HMHeadCell" owner:self options:nil]lastObject];
    
     cell.backgroundColor =  HMUIColorFromRgbAlpha(0x1e1e1e , 1);
    
    return cell;
}

-(void)setUsermessageMol:(HMUserMessageModel *)usermessageMol{
    
    _usermessageMol = usermessageMol;
    
//    [self.icon sd_setImageWithURL:[NSURL URLWithString:usermessageMol.strIcon] placeholderImage:[UIImage imageNamed:HMPlaceHolderImage]];
    
    self.icon.image = [UIImage imageNamed:HMPlaceHolderImage];
    
    self.Name.text = usermessageMol.name;
    
    self.number.text = usermessageMol.strNum;
    
    
    self.mony.text = usermessageMol.mony;
    
    
    self.haveNum.text = usermessageMol.Number;
    
}


+(CGFloat)HeadCellHeigth{
    
    return 92;
    
}
@end
