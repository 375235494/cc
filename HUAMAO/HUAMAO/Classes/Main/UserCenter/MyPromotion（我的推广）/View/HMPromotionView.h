//
//  HMPromotionView.h
//  HUAMAO
//
//  Created by 裴小康 on 2017/5/22.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol HMPromotionViewDelegate <NSObject>

- (void)removeView;
@end

@interface HMPromotionView : UIView

@property(nonatomic, weak)id <HMPromotionViewDelegate>delegate;

@end
