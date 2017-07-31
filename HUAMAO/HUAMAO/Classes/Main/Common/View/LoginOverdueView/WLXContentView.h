//
//  WLXContentView.h
//  WLXTeacher
//
//  Created by 陈臣 on 16/7/28.
//  Copyright © 2016年 WuHan Future Star. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WLXContentView;

@protocol WLXContentViewDelegeat <NSObject>

-(void)SureAction:(WLXContentView*)contentv;


@end

@interface WLXContentView : UIView
@property (weak, nonatomic) IBOutlet UILabel *labletext;


@property(weak,nonatomic) id<WLXContentViewDelegeat>contentvDelegeat;

+(instancetype)ContentView;


@end
