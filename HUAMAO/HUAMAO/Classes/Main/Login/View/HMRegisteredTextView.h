//
//  HMRegisteredTextView.h
//  HUAMAO
//
//  Created by 孙密 on 17/5/17.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMRegisteredTextView;

@protocol HMRegisteredTextDelegeat <NSObject>


-(void)RegisteredTextViewRegisSuccesDo:(HMRegisteredTextView *)RegisteredTextView ;

@end
@interface HMRegisteredTextView : UIView

+(instancetype)RegisteredTextView;

@property(weak,nonatomic)id<HMRegisteredTextDelegeat>Delegeat;

@end
