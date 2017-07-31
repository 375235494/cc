//
//  HMDetailListV.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/7/3.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>


@class HMDetailListV;

@protocol ButtonListViewDelegeat <NSObject>

-(void)HMButtonListView :(HMDetailListV *)DetailListV index:(NSInteger)index;

@end

@interface HMDetailListV : UIView

@property(weak,nonatomic)id<ButtonListViewDelegeat>Delegeat;

@property(strong,nonatomic)NSArray *arysouce;


-(CGFloat )DetailListVHeigth;

@end
