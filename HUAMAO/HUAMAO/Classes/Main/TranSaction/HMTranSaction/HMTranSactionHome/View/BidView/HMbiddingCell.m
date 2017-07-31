//
//  HMbiddingCell.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMbiddingCell.h"
@interface HMbiddingCell()

@property (weak, nonatomic) IBOutlet UIButton *JGbutton;

@property (weak, nonatomic) IBOutlet UIButton *JMbutton;


@property(assign,nonatomic) NSInteger time;

@property(strong,nonatomic) NSTimer *HMtimer;

@end

@implementation HMbiddingCell

-(void)setStartTimer{
    
    _HMtimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(scrollTimer) userInfo:nil repeats:YES];

    [[NSRunLoop mainRunLoop] addTimer:_HMtimer forMode:NSDefaultRunLoopMode];
    
}

-(void)scrollTimer{
    

    _JGbutton.enabled = NO;
    
    _JMbutton.enabled = NO;
    
    _time = _time -1;
    
    [_JGbutton setTitle:[NSString stringWithFormat:@"超过(%lds)",_time] forState:UIControlStateDisabled];
    
    [_JMbutton setTitle:[NSString stringWithFormat:@"不超过(%lds)",_time] forState:UIControlStateDisabled];

    if(_time ==0){
        
        [_HMtimer invalidate];
        
        _HMtimer = nil;
        
        _time = 31;
        
        _JGbutton.enabled = YES;
        
        _JMbutton.enabled = YES;

    }
    
}


- (void)awakeFromNib {
    
    
    [super awakeFromNib];
    // Initialization code
    
    _time = 31;
    
//    self.JGbutton.layer.cornerRadius = 35/2;
//    
//    
//    self.JGbutton.layer.masksToBounds = YES;
//    
//    self.JMbutton.layer.cornerRadius = 35/2;
//    
//    
//    self.JMbutton.layer.masksToBounds = YES;
    
    
//    self.JGbutton.imageEdgeInsets = UIEdgeInsetsMake(0, 100 * kHMScreenWidth_Case *2 , 0, 0);
//    
    self.JGbutton.titleEdgeInsets = UIEdgeInsetsMake(0, -15 * kHMScreenWidth_Case *2, 5, 0);
//
//    self.JMbutton.imageEdgeInsets = UIEdgeInsetsMake(0, 100 * kHMScreenWidth_Case *2 , 0, 0);
//
    self.JMbutton.titleEdgeInsets = UIEdgeInsetsMake(0, -15 * kHMScreenWidth_Case *2, 5, 0);
    
    
    
    _JGbutton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
    
    _JMbutton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
    
    [_JGbutton setBackgroundImage:[[UIImage imageNamed:@"红色按钮"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];

    [_JMbutton setBackgroundImage:[[UIImage imageNamed:@"绿色按钮"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)buy:(id)sender {
    
    
    if(self.Delegate &&[self.Delegate respondsToSelector:@selector(biddingCellwithBuy:)]){
        
        
        [self.Delegate biddingCellwithBuy:self];
        
    }
    
}

- (IBAction)sell:(UIButton *)sender {
    
    if(self.Delegate &&[self.Delegate respondsToSelector:@selector(biddingCellwithbidding:)]){
        
        
        [self.Delegate biddingCellwithbidding:self];
        
    }
    
    
}

+(instancetype)biddingCell{

    return [[[NSBundle mainBundle]loadNibNamed:@"HMbiddingCell" owner:self options:nil]lastObject];
    
}

+(CGFloat)biddingCellHeigth{
    
    return 71;
}

@end
