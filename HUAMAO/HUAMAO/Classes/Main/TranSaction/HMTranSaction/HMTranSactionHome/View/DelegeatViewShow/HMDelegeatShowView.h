//
//  HMDelegeatShowView.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/16.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMDelegeatShowView : UIView

-(void)ShowMaskView;

@property(copy,nonatomic) void (^BloackDelegeat)();

@end
