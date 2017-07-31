//
//  HMorderMessageMol.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/2.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMorderMessageMol : NSObject

@property(assign,nonatomic)NSInteger product;

@property(assign,nonatomic)NSInteger money;



@property(strong,nonatomic)NSNumber * Executiveprice;

@property(assign,nonatomic)NSInteger type;

@property(copy,nonatomic)NSString * results;

@property(assign,nonatomic)BOOL isOrderBegin;


@property(strong,nonatomic)NSDictionary *dicSouce;


@property(assign,nonatomic)NSInteger cycelTime;

@property(assign,nonatomic)CGFloat moneyprofit;

@property(copy,nonatomic)NSString * addTime;


@property(copy,nonatomic)NSString * endTime;


@property(strong,nonatomic)NSNumber * EndPrcie;

@end
