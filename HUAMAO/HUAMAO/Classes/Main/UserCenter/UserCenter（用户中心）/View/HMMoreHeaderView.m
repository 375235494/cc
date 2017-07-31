//
//  HMMoreHeaderView.m
//  HUAMAO
//
//  Created by 裴小康 on 2017/5/21.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMMoreHeaderView.h"
 #import "MJExtension.h"

@interface HMMoreHeaderView ()

@property (weak, nonatomic) IBOutlet UILabel *usreNameLab;
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;

@end

@implementation HMMoreHeaderView

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    self.backgroundColor = HMColor(0, 0, 0);
    
    NSString *iphone =  [[NSUserDefaults standardUserDefaults] objectForKey:@"iphone"];
    
    self.usreNameLab.text = iphone;
     self.headerImage.layer.cornerRadius = self.headerImage.width * 0.5;
    self.headerImage.layer.masksToBounds = YES;
    self.headerImage.backgroundColor = HMUIColorFromRgbAlpha(0x191919, 1);

//   NSString *headerUrl =  [[NSUserDefaults standardUserDefaults] objectForKey:@"headerUrl"];
//    
//     [self.headerImage sd_setImageWithURL:[NSURL URLWithString:headerUrl]];
    
    self.headerImage.image = [UIImage imageNamed:@"Zhanwei"];
}



@end
