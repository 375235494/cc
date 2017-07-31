//
//  HMOrderMessage.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/1.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMorderMessageMol;

@interface HMOrderMessage : UIView


@property(copy,nonatomic)void (^ComingAction)();

+(instancetype)ShowView;

@property(strong,nonatomic)HMorderMessageMol *molmessage;


@end
