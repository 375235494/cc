//
//  HMDelegeatView.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/16.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^buttonActionblock)() ;

@interface HMDelegeatView : UIView

+(instancetype)DelegeatView;

@property(copy,nonatomic)buttonActionblock SureButtonAction;


@property(copy,nonatomic)buttonActionblock CancelButtonAction;


@property(copy,nonatomic)buttonActionblock DelegeatLableAction;


@property (weak, nonatomic) IBOutlet UIButton *SelectSureButton;

@end
