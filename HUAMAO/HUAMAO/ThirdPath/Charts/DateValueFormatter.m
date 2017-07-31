//
//  DateValueFormatter.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/30.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "DateValueFormatter.h"

@interface DateValueFormatter (){
    NSArray *_dateArr;
    NSDateFormatter *_preFormatter;
    NSDateFormatter *_needFormatter;
    
}


@end

@implementation DateValueFormatter

- (id)initWithDateArr:(NSArray *)arr {
    if (self = [super init]) {
        _dateArr = [NSArray arrayWithArray:arr];
        
        _preFormatter = [[NSDateFormatter alloc] init];
        _preFormatter.dateFormat = @"mm:ss";
        
        
        _needFormatter = [[NSDateFormatter alloc] init];
        _needFormatter.dateFormat = @"mm:ss";
    }
    return self;
}

- (NSString *)stringForValue:(double)value axis:(ChartAxisBase *)axis {
    if (_dateArr.count > 0) {
        NSString *dateStr = _dateArr[(int)value];
        NSDate *date = [_preFormatter dateFromString:dateStr];
        return [_needFormatter stringFromDate:date];
    }
    return @"";
}

@end
