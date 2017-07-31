//
//  HMSelectproductV.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMSelectproductV;

@protocol HMSelectproductVDelegate <NSObject>

-(void)SelectproductV:(HMSelectproductV *)SelectproductV WithIndex:(NSInteger)index;

@end

@interface HMSelectproductV : UIView

+(CGFloat)SelectproductVHeigth;

@property(weak,nonatomic)id<HMSelectproductVDelegate>Delegate;

@end
