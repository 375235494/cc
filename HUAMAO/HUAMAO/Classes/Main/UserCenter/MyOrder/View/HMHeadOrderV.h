//
//  HMHeadOrderV.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/13.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMHeadOrderV;

@protocol HMHeadOrderVDelegeat <NSObject>

-(void)HeadOrderV:(HMHeadOrderV *)HeadOrderV SelectIndex:(NSInteger)index;

@end

@interface HMHeadOrderV : UIView


+(instancetype)HeadVIew;

@property(assign,nonatomic)NSInteger selectIndex;

@property(weak,nonatomic)id<HMHeadOrderVDelegeat>Delegeat;

@property(strong,nonatomic)NSDictionary * dicSouce;

@end
