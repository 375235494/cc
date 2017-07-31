//
//  HMTimeMovements.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMTimeMovements.h"

@interface HMTimeMovements ()

@property(weak,nonatomic)UIButton *SelectButton;

@property (weak, nonatomic) IBOutlet UIButton *ZsButton;

@end

@implementation HMTimeMovements

- (IBAction)buttonAction:(UIButton *)sender {
    
    sender.enabled = NO;
    
    self.SelectButton.enabled = YES;
    
    self.SelectButton = sender;
    
    
    if(self.Delegate && [self.Delegate respondsToSelector:@selector(TimeMovementsSelect:withTag:)]){
        
        [self.Delegate TimeMovementsSelect:self withTag:sender.tag];
    }
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self buttonAction:self.ZsButton];

}

+(instancetype )TimeMovements{
    return [[[NSBundle mainBundle]loadNibNamed:@"HMTimeMovements" owner:self options:nil] lastObject];
    
}

+(CGFloat )TimeMovementsHeigth{
  
    return 30;
    
}

@end
