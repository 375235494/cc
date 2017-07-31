//
//  HMHelpCenteModel.h
//  HUAMAO
//
//  Created by  on 2017/5/24.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMHelpCenteModel : NSObject
//标题
@property(copy, nonatomic)NSString *title;
//日期
@property(copy, nonatomic)NSString *addtimestr;

@property (strong, nonatomic) NSMutableArray *cont;

@property (copy, nonatomic) NSString *img;

@end
