//
//  HMTimeSelectView.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMTimeSelectView;

@protocol  TimeSelectViewDelegate<NSObject>

-(void)TimeSelectViewAction:(HMTimeSelectView *)buttonSelectView;

@end

@interface HMTimeSelectView : UIView

@property(weak,nonatomic) id<TimeSelectViewDelegate>delegate;

@property(copy,nonatomic)NSString *strMinit;

@property(assign,nonatomic)BOOL viewSelect;


+(instancetype)TimeSelectView;

@end
