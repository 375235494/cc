//
//  HMButtonListView.h
//  HUAMAO
//
//  Created by 孙密 on 17/5/17.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMButtonListView;

@protocol ButtonListViewDelegeat <NSObject>

-(void)HMButtonListView :(HMButtonListView *)ButtonListView index:(NSInteger)index;

@end

@interface HMButtonListView : UIView

-(void)ButtonListViewWithImages:(NSArray *)aryimages andAryTitle:(NSArray *)arytitles;


@property(weak,nonatomic)id<ButtonListViewDelegeat>Delegeat;

@end
