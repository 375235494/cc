//
//  NSDate+WLXDate.m
//  WLXFamily
//
//  Created by liuming on 16/4/26.
//  Copyright © 2016年 WuHan Future Star. All rights reserved.
//

#import "NSDate+WLXDate.h"

@implementation NSDate (WLXDate)

+ (NSInteger)getDateTimeStampWithStr:(NSString *)strDate{
   
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSInteger integer = [[formatter dateFromString:strDate] timeIntervalSince1970];
    return integer;
}

+ (NSInteger)getCurrentDateTimeStamp{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSInteger integer = [date timeIntervalSince1970];
    return integer;
}

+ (NSInteger)getWeekIntegerWithString:(NSString *)weekString{
    NSInteger weekInteger = 0;
    if ([weekString isEqualToString:@"星期一"]) {
        weekInteger = 1;
    }else if ([weekString isEqualToString:@"星期二"]){
        weekInteger = 2;
    }else if ([weekString isEqualToString:@"星期三"]){
        weekInteger = 3;
    }else if ([weekString isEqualToString:@"星期四"]){
        weekInteger = 4;
    }else if ([weekString isEqualToString:@"星期五"]){
        weekInteger = 5;
    }else if ([weekString isEqualToString:@"星期六"]){
        weekInteger = 6;
    }else if ([weekString isEqualToString:@"星期天"]){
        weekInteger = 7;
    }
    return weekInteger;
}

+ (NSString *)getMonthAndDayFromNum:(NSNumber *)dateNumber{
    NSArray *array = [NSDate getDateArrayWithNum:dateNumber];
    NSString *dateStr = [NSString stringWithFormat:@"%d月%d日",[array[1] intValue],[array[2] intValue]];
    return dateStr;
}

+ (NSString *)getHourWithNum:(NSNumber *)number{
    NSArray *array = [NSDate getDateArrayWithNum:number];
    return [NSString stringWithFormat:@"%@:%@",array[3],array[4]];
}

+ (NSDate *)getLocalDateWithDate:(NSDate *)date{
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate *localDate = [date dateByAddingTimeInterval:interval];
    return localDate;
}

+ (NSInteger)compareTodayWithDateNum:(NSNumber *)number{
    
    NSDate *returnDate = [NSDate dateWithTimeIntervalSince1970:number.doubleValue];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *fromDate;
    NSDate *toDate;
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&fromDate interval:NULL forDate:[NSDate date]];
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&toDate interval:NULL forDate:returnDate];
    NSDateComponents *components = [calendar components:NSCalendarUnitDay fromDate:fromDate toDate:toDate options:0];
    NSInteger integer = components.day;
    return integer;
}

//+ (NSInteger)modelStatusWithModel:(WLXCourseMgrCellModel *)model num:(NSNumber *)number{
//    NSInteger integer = [NSDate compareTodayWithDateNum:number];
//    if (integer < 0) {    //比今天早，比如今天2016年6月2日，上课时间2016年6月1日
//        integer = -1;
//    } else if (integer == 0) {     //今天
//        NSDate *currentLocalDate = [NSDate getLocalDateWithDate:[NSDate date]];
//        NSDate *returnDate = [NSDate dateWithTimeIntervalSince1970:number.doubleValue];
//        NSDate *returnLocalDate = [NSDate getLocalDateWithDate:returnDate];
//        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//        NSDate *fromDate;
//        NSDate *toDate;
//        [calendar rangeOfUnit:NSCalendarUnitMinute startDate:&fromDate interval:NULL forDate:currentLocalDate];
//        [calendar rangeOfUnit:NSCalendarUnitMinute startDate:&toDate interval:NULL forDate:returnLocalDate];
//        NSDateComponents *components = [calendar components:NSCalendarUnitMinute fromDate:fromDate toDate:toDate options:0];
//        if (components.minute <= 30  && components.minute >= 0) {   //比较是否提前半小时，比如当前时间10：20，上课时间10：30
//            integer = 0;
//        }if (components.minute > 30){  //是否比开课时间晚半小时以上，比如当前时间10：20，上课时间11：00
//            integer = 3;
//        }if (components.minute < 0){    //今天，已经上过课
//            if (model.callNameStatus == NO) {
//                integer = 1;       //今天，已经上过课但没有点名，比如当前时间11：00，上课时间10：40，没有点过名
//            }else
//                integer = 2;       //今天，已经上过课已经点过名，比如当前时间11：00，上课时间10：40，已经点过名
//        }
//    } else if (integer > 0){       //比今天晚，比如今天2016年6月1日，上课时间2016年6月2日
//        integer = 3;
//    }
//    return integer;
//}


+ (NSArray *)getDateArrayWithNum:(NSNumber *)currentNumber{
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:currentNumber.doubleValue];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateStr = [formatter stringFromDate:date];
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"- :"];
    NSArray *array = [dateStr componentsSeparatedByCharactersInSet:set];
    return array;
}

+(NSString *)dateToWLXDateSrtingByCurrentDate
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *DateString = [formatter stringFromDate:[NSDate date]];
    return [DateString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

+(NSString *)dateTowlxdatestingBydate:(NSDate*)date
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *DateString = [formatter stringFromDate:date];
    return   DateString;//[DateString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}



+(NSDate*)DatestrToDatesWithstr:(NSString *)strdate
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date = [formatter dateFromString:strdate];
    
    return date;
}
+(NSString *)DateWithinterger:(NSInteger)date
{
    NSDate *dateM = [self getDateFromUnixTimestamp:date];
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd";
  
    return [formatter stringFromDate:dateM];
}


+(NSDate*)getDateFromUnixTimestamp:(NSInteger)unixTimestamp{
    NSDate* dat = [NSDate dateWithTimeIntervalSince1970:unixTimestamp];
    return dat;
}

+(NSString *)getUnixTimestamp:(NSDate *)curdate{
    
    //NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[curdate timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%.0f", a];
    return timeString;
}


+(NSNumber *)DateintervalFromString:(NSString *)dataStr
{
    dataStr = [[dataStr componentsSeparatedByString:@"+"]firstObject];
    NSArray *arr = [dataStr componentsSeparatedByString:@"T"];
    dataStr = [NSString stringWithFormat:@"%@ %@",arr[0],arr[1]];
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";

    int dateinterval =  [[formatter dateFromString:dataStr] timeIntervalSince1970];
    return @(dateinterval);
}
+(NSInteger)DateWLXintervalFromString:(NSString *)dataStr
{
    return [self DateWLXintervalElseFromString:[self DateFromeStrConnection:dataStr]];
}




+(NSTimeInterval)DateInerVallFromStr :(NSString *)datestr
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    int dateinterval =  [[formatter dateFromString:datestr] timeIntervalSince1970];
    
    return dateinterval;
}
+(NSInteger)DateWlxInerVallFromStr :(NSString *)datestr
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    
    formatter.dateFormat = @"yyyy-MM-dd";
    
    int dateinterval =  [[formatter dateFromString:datestr] timeIntervalSince1970];
    
    return dateinterval;
}

+(NSInteger)DateWlxInerVallFromStrCH :(NSString *)datestr
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    
    formatter.dateFormat = @"yyyy年MM月dd日";
    
    int dateinterval =  [[formatter dateFromString:datestr] timeIntervalSince1970];
    
    return dateinterval;
}

+(NSNumber *)DateintervalElseFromString:(NSString *)dataStr
{
   
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    int dateinterval =  [[formatter dateFromString:dataStr] timeIntervalSince1970];
    
    return @(dateinterval) ;
}

+(NSInteger)DateWLXintervalElseFromString:(NSString *)dataStr
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    int dateinterval =  [[formatter dateFromString:dataStr] timeIntervalSince1970];
    
    return dateinterval ;
}

+(NSMutableArray *)DateGetWeekDays
{
    NSMutableArray *Weekdates =[[NSMutableArray alloc]init];
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday|NSCalendarUnitDay
                                         fromDate:now];

    NSInteger weekDay = [comp weekday];
    // 得到几号
    NSInteger day = [comp day];
    
    NSInteger weekNum = weekDay ==1?8:weekDay;

    long firstDiff,lastDiff;
    if (weekDay == 1) {
        firstDiff = 1;
        lastDiff = 0;
    }else{
        firstDiff = [calendar firstWeekday] - weekNum;
        lastDiff = 9 - weekNum;
    }
    
//    NSLog(@"firstDiff:%ld   lastDiff:%ld",firstDiff,lastDiff);
    
    for(int i =0 ;i<7;i++)
    {
        //在当前日期(去掉了时分秒)基础上加上差的天数
        NSDateComponents *DayComp = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:now];
        [DayComp setDay:day + firstDiff+i+1];
        NSDate *DayOfWeek= [calendar dateFromComponents:DayComp];
        
        
        NSDateFormatter *formater = [[NSDateFormatter alloc] init];
        [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        [Weekdates addObject:[formater stringFromDate:DayOfWeek]];
        
    }
    
    return Weekdates;

}


+(NSInteger )DateGetmonthWithDate:(NSDate*)date
{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday|NSCalendarUnitDay
                                         fromDate:date];

    
    NSInteger weekDay = [comp weekday];
    
    
    return weekDay;
  
    
}

+(NSString *)DateGetDayDate
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday|NSCalendarUnitDay
                                         fromDate:now];

    NSInteger year = [comp year];

    NSInteger month = [comp month];
    
    NSInteger weekDay = [comp weekday];
    // 得到几号
    NSInteger day = [comp day];
    
    if(weekDay ==7)
    {
        return [NSString stringWithFormat:@"%ld年%ld月%ld日--周日",year,month,day];
    }
    
    return  [NSString stringWithFormat:@"%ld年%ld月%ld日--周%ld",year,month,day,weekDay-1];
    
}

+(NSString*)DateFromeStrConnection :(NSString *)dateStr
{
    dateStr = [[dateStr componentsSeparatedByString:@"+"]firstObject];
    NSArray *arr = [dateStr componentsSeparatedByString:@"T"];
    dateStr = [NSString stringWithFormat:@"%@ %@",arr[0],arr[1]];

    return dateStr;
    
}

+(NSMutableArray *)DategetmoutDate
{
    
    NSMutableArray *arydate =[[NSMutableArray alloc]init];
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday|NSCalendarUnitDay
                                         fromDate:now];
    
    //    // 得到星期几
    //    // 1(星期天) 2(星期二) 3(星期三) 4(星期四) 5(星期五) 6(星期六) 7(星期天)
    NSInteger weekDay = [comp weekday];
    // 得到几号
    NSInteger day = [comp day];
//    
//    NSInteger year = [comp year];
//    
//    NSInteger month = [comp month];


    NSInteger weekNumberOne =(7+(weekDay-1)-day%7)%7;
 
    NSInteger lengthMouthDay =[self getNumberOfDaysInMonth];
    
    NSInteger weekNum = weekNumberOne ==0?7:weekNumberOne;
    for(int i = 0; i<weekNum ;i++)
    {
        [arydate addObject:@"0"];
    }
    
    for(int j= 1; j<lengthMouthDay+1 ;j++)
    {
        [comp setDay:j];
        NSDate *DayOfmouth = [calendar dateFromComponents:comp];
        
        NSDateFormatter *formater = [[NSDateFormatter alloc] init];
        [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        
        [arydate addObject:[formater stringFromDate:DayOfmouth]];
    }

    return arydate;
    
}


+ (NSInteger)getNumberOfDaysInMonth
{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法
    NSDate * currentDate = [NSDate date]; // 这个日期可以你自己给定
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay
                                   inUnit: NSCalendarUnitMonth
                                  forDate:currentDate];
    
    return range.length;
}
+(NSInteger)WLXgetNumberOfDaysInMonth:(NSDate*)date
{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法
    NSDate * currentDate = date; // 这个日期可以你自己给定
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay
                                   inUnit: NSCalendarUnitMonth
                                  forDate:currentDate];
    
    return range.length;
}



@end
