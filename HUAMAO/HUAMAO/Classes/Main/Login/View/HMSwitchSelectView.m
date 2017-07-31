//
//  HMSwitchSelectViewiewiew.m
//  HUAMAO
//
//  Created by 孙密 on 17/5/17.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMSwitchSelectView.h"

@interface HMSwitchSelectView ()


@property(copy,nonatomic) SwithSelectButtonAction liftbuttonAction;

@property(copy,nonatomic) SwithSelectButtonAction  rigthbuttonAction;

@property(weak,nonatomic) UIView *liftview;

@property(weak,nonatomic) UIView *rigthview;

@end

@implementation HMSwitchSelectView

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if(self ==[super initWithCoder:aDecoder])
    {
        
        self.autoresizingMask=UIViewAutoresizingNone;
        self.backgroundColor = [UIColor clearColor];
        
    }
    
    return self;
}
-(void)awakeFromNib
{
    [super awakeFromNib];
    
    [self.liftbutton setTitleColor:HMUIColorFromRgb(0xfe1c01) forState:UIControlStateDisabled];
    
    [self.liftbutton setTitleColor:HMUIColorFromRgbAlpha(0xffffff,0.5) forState:UIControlStateNormal];
    
    UIView *viewlogin = [[UIView alloc]init];
    
    viewlogin.width = 40;
    
    viewlogin.height = 2;
    
    viewlogin.x = ((HMLXScreenWidth  - 40*2)/2 - viewlogin.width)/2;
    
    viewlogin.y = 40 - 2;
    
    viewlogin.backgroundColor = [UIColor redColor];
    
    _liftview = viewlogin;
    
    [self.liftbutton addSubview:viewlogin];


    [self.rigthbutton setTitleColor:HMUIColorFromRgb(0xfe1c01) forState:UIControlStateDisabled];
    
    [self.rigthbutton setTitleColor:HMUIColorFromRgbAlpha(0xffffff,0.5) forState:UIControlStateNormal];
    
    UIView *viewregiset = [[UIView alloc]init];
    
    viewregiset.width = 40;
    
    viewregiset.height = 2;
    
    viewregiset.x = viewlogin.x;
    
    viewregiset.y = 40 - 2;
    
    _rigthview = viewregiset;
    
    [self.rigthbutton addSubview:viewregiset];
    
    
    self.rigthbutton.backgroundColor = [UIColor clearColor];
    
    self.liftbutton.backgroundColor =[UIColor clearColor];

    [self.liftbutton addTarget:self action:@selector(liftButtonDown:) forControlEvents:UIControlEventTouchDown];
    
    
    [self.rigthbutton addTarget:self action:@selector(RigthButtonDown:) forControlEvents:UIControlEventTouchDown];
    
    
}

-(void)liftButtonDown:(UIButton *)button{
    
    self.liftbutton.enabled =NO;
    
    self.rigthbutton.enabled = YES;
    
    _liftview.backgroundColor = [UIColor redColor];
    
    _rigthview.backgroundColor = [UIColor clearColor];

    self.liftbuttonAction();
    
}

-(void)loginButtonAction{
    
    [self liftButtonDown:self.liftbutton];
}

-(void)RigthButtonDown:(UIButton *)button{
    
    self.rigthbutton.enabled =NO;
    
    self.liftbutton.enabled =YES;
    
    _rigthview.backgroundColor = [UIColor redColor];
    
    _liftview.backgroundColor = [UIColor clearColor];
    
    self.rigthbuttonAction();
    
}

-(void)setLiftbuttontitle :(NSString*)lifttitle Rightbuttontitle:(NSString*)rigthtitle liftbuttonAction:(SwithSelectButtonAction)liftAction  rightButtonAction:(SwithSelectButtonAction)rigthbuttonAction
{
    
    [self.liftbutton setTitle:lifttitle forState:UIControlStateNormal];
    
    [self.rigthbutton setTitle:rigthtitle forState:UIControlStateNormal];
    self.liftbuttonAction =liftAction;
    
    self.rigthbuttonAction =rigthbuttonAction;
    
}

+(instancetype)SwitchSelectV
{
    return [[[NSBundle mainBundle]loadNibNamed:@"HMSwitchSelectView" owner:self options:nil]lastObject];
}

@end
