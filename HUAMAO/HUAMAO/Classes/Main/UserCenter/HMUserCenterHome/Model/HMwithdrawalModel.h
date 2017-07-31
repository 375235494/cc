//
//  HMwithdrawalModel.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/18.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMwithdrawalModel : NSObject

@property(copy,nonatomic) NSString *strMoney;

@property(copy,nonatomic) NSString *Name;

@property(copy,nonatomic) NSString *bank;

@property(copy,nonatomic)NSString *bankNumber;

@property(copy,nonatomic)NSString *PhoneNumber;

@property(copy,nonatomic)NSString * peopelNum;


@property(strong,nonatomic)NSDictionary *dicsouce;



@end
