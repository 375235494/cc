//
//  HMLoginTextView.h
//  HUAMAO
//
//  Created by 孙密 on 17/5/17.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMLoginTextView;

@protocol HMLoginTextViewDelegeat <NSObject>

-(void)LoginTextViewForgetNumAction:(HMLoginTextView *)LoginTextView ;



-(void)loginSureAction:(HMLoginTextView *)LoginTextView WithSouceDic:(NSDictionary *)dic;

@end

@interface HMLoginTextView : UIView

+(instancetype)LoginTextView;


@property(weak,nonatomic)id<HMLoginTextViewDelegeat>Delegeat;

@end
