//
//  HMbuttonSelectView.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMbuttonSelectView;

@protocol  buttonSelectViewDelegate<NSObject>

-(void)buttonSelectViewAction:(HMbuttonSelectView *)buttonSelectView;

@end

@interface HMbuttonSelectView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *stateImage;

+(instancetype)buttonSelectView;

@property(weak,nonatomic)id<buttonSelectViewDelegate>SelectViewDelegate;

@property(copy,nonatomic)NSString *titleStr;

@property(copy,nonatomic)NSString *priceStr;

@property(assign,nonatomic)BOOL stateUpOrDown;

@property(assign,nonatomic) BOOL Slect;


@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@property (weak, nonatomic) IBOutlet UIView *lineView;


@end
