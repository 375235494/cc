//
//  HMPromotionView.m
//  HUAMAO
//
//  Created by 裴小康 on 2017/5/22.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMPromotionView.h"

@interface HMPromotionView ()
@property (weak, nonatomic) IBOutlet UIButton *removeBtn;

@end

@implementation HMPromotionView


- (void)awakeFromNib
{

 [super awakeFromNib];
    


}

- (IBAction)removeBtnClick:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(removeView)]) {
        [self.delegate removeView];
    }

    
    
}


@end
