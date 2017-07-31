//
//  HMprofitView.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/27.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMorderMessageMol;

@interface HMprofitView : UIView

@property(strong,nonatomic)HMorderMessageMol *molmessage;

@property(copy,nonatomic)void (^ComingAction)();

+(instancetype)ShowView;

@end
