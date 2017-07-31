//
//  DateValueFormatter.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/30.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "Charts/Charts.h"

@interface DateValueFormatter : NSObject<IChartAxisValueFormatter>

- (id)initWithDateArr:(NSArray *)arr;

@end
