//
//  HMUserMessageModel.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMUserMessageModel : NSObject

@property(copy,nonatomic)NSString *strIcon;

@property(copy,nonatomic)NSString *strNum;

@property(copy,nonatomic)NSString *mony;

@property(copy,nonatomic)NSString *Number;

@property(copy,nonatomic)NSString *name;

@property(strong,nonatomic)NSDictionary *messageSouce;


@property(strong,nonatomic)NSDictionary *tradingSouce;

@end
