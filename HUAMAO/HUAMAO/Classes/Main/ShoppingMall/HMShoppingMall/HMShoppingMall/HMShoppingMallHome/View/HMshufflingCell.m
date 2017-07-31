//
//  HMshufflingCell.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/7/2.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMshufflingCell.h"

@interface HMshufflingCell ()

@property (weak, nonatomic) IBOutlet UIImageView *shufflingImage;


@end

@implementation HMshufflingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.backgroundColor = HMUIColorFromRgbAlpha(0x0f0f0f , 1);
}
-(void)setStrimage:(NSString *)strimage{
    
    _strimage = strimage ;
    
    _shufflingImage.image = [UIImage imageNamed:strimage];
}



@end
