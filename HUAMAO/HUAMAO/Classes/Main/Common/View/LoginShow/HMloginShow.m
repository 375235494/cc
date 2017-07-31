//
//  HMloginShow.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/5.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMloginShow.h"

@interface HMloginShow ()
@property (weak, nonatomic) IBOutlet UIButton *sureButton;
@property (weak, nonatomic) IBOutlet UILabel *message;

@end

@implementation HMloginShow


-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    
    self.sureButton.layer.cornerRadius = HMCORNERRadius;
    
    self.sureButton.layer.masksToBounds = YES;
}

- (IBAction)SureAction:(UIButton *)sender {
    
//    self.SureAction();
    
    
}


+(instancetype)ShowView{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"HMloginShow" owner:self options:nil]lastObject];
}


-(void)setLogingMessage:(NSString *)logingMessage{
    
    
    _logingMessage = logingMessage;
    
    _message.text = logingMessage;
    
}

@end
