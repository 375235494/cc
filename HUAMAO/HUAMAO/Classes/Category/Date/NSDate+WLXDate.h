//
//  NSDate+WLXDate.h
//  WLXFamily
//
//  Created by liuming on 16/4/26.
//  Copyright © 2016年 WuHan Future Star. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (WLXDate)

//得到周几
+(NSInteger )DateGetmonthWithDate:(NSDate*)date;

+ (NSInteger)getDateTimeStampWithStr:(NSString *)strDate;

+(NSInteger)DateWlxInerVallFromStrCH :(NSString *)datestr;

+(NSString *)DateWithinterger:(NSInteger)date;

+(NSInteger)DateWLXintervalFromString:(NSString *)dataStr;

+(NSInteger)DateWlxInerVallFromStr :(NSString *)datestr;

+(NSInteger)WLXgetNumberOfDaysInMonth:(NSDate*)date;

+ (NSInteger)getNumberOfDaysInMonth;

+(NSString *)dateToWLXDateSrtingByCurrentDate;

+(NSString *)dateTowlxdatestingBydate:(NSDate*)date;

+(NSDate*)getDateFromUnixTimestamp:(NSInteger)unixTimestamp;

+(NSString *)getUnixTimestamp:(NSDate *)curdate;

+(NSNumber *)DateintervalFromString:(NSString *)dataStr;

+(NSNumber *)DateintervalElseFromString:(NSString *)dataStr;

+(NSMutableArray *)DateGetWeekDays;

+(NSString *)DateGetDayDate;

+(NSString*)DateFromeStrConnection :(NSString *)dateStr;

+(NSDate*)DatestrToDatesWithstr:(NSString *)strdate;

+(NSMutableArray*)DategetmoutDate;

+(NSTimeInterval)DateInerVallFromStr :(NSString *)datestr;

+ (NSString *)getMonthAndDayFromNum:(NSNumber *)currentDate;

+ (NSString *)getHourWithNum:(NSNumber *)number;

+ (NSInteger)compareTodayWithDateNum:(NSNumber *)number;

+ (NSArray *)getDateArrayWithNum:(NSNumber *)currentNumber;

//+ (NSInteger)modelStatusWithModel:(WLXCourseMgrCellModel *)model num:(NSNumber *)number;

+ (NSDate *)getLocalDateWithDate:(NSDate *)date;

+ (NSInteger)getWeekIntegerWithString:(NSString *)weekString;

+ (NSInteger)getCurrentDateTimeStamp;

@end
