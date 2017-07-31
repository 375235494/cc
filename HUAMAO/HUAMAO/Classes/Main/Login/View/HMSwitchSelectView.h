//
//  HMSwitchSelectView.h
//  HUAMAO
//
//  Created by 孙密 on 17/5/17.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMSwitchSelectView : UIView


typedef  void(^SwithSelectButtonAction)();

+(instancetype)SwitchSelectV;

-(void)setLiftbuttontitle :(NSString*)lifttitle Rightbuttontitle:(NSString*)rigthtitle liftbuttonAction:(SwithSelectButtonAction)liftAction  rightButtonAction:(SwithSelectButtonAction)rigthbuttonAction;


@property(weak,nonatomic)IBOutlet UIButton*liftbutton;

@property(weak,nonatomic)IBOutlet UIButton*rigthbutton;

-(void)loginButtonAction;

@end
