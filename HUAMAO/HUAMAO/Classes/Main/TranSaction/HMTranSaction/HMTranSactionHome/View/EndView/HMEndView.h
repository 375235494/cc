//
//  HMEndView.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/20.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMEndView;

@protocol HMEndViewDelegate <NSObject>

-(void)EndViewCiCAction:(HMEndView*)endView;

-(void)EndViewJYAction :(HMEndView*)endView;


-(void)ChecktheDetails :(HMEndView*)endView indexpath:(NSIndexPath *)indexPath;



-(void)EndViewCiCAction:(HMEndView*)endView WithHeigth :(CGFloat) Heigth;

@end

@interface HMEndView : UIView

@property(weak,nonatomic)id<HMEndViewDelegate>Delegate;

+(instancetype)EndView;

-(void)reloadateCicangWithAry :(NSMutableArray *)arysouce;

-(void)reloadateJiaYiWithAry :(NSMutableArray *)arysouce;

-(void)CicActionLoad;



@property(strong,nonatomic)UITableView * ciCangTableView;


@property(strong,nonatomic)UITableView * JaoYitableView;
@end
