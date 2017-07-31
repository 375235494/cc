//
//  Const.h
//  HMTeacher
//
//  Created by liuming on 16/4/25.
//  Copyright © 2016年 WuHan Future Star. All rights reserved.
//

#ifndef Const_h
#define Const_h

#ifndef __IPHONE_8_0
//#warning "This project uses features only available in iOS SDK 8.0 and later."
#endif

#define HMLXIos8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8)
#define HMLXScreenHeight [[UIScreen mainScreen] bounds].size.height
#define HMLXScreenWidth [[UIScreen mainScreen] bounds].size.width

#define kHMScreenHeight_Case  [[UIScreen mainScreen] bounds].size.height/1334.0

#define kHMScreenWidth_Case [[UIScreen mainScreen] bounds].size.width/750.0

#define kHMTitleColor  [UIColor colorWithRed:228.0/255.0 green:70.0/255.0 blue:38.0/255.0 alpha:1.0]
#define kHMBackgroundColor  [UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1.0]
#define kHMDatabase @"chinaHM.db"
#define kHMUserAcceptEULA @"kUserAcceptEULA" //同意《用户条款》
#define kHMUmengAppKey @"123456789"

//1.0 - 10 | 1.2 - 12 | 2.0 - 20
#define kHMVersionNumber @"kVersionNumber"
#define kHMVersionCode 10
#define kNeverShowVersionCode @"kNeverShowVersionCode"

//Rgb值转成UIColor
#define HMUIColorFromRgb(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1]

#define HMUIColorFromRgbAlpha(rgbValue,Alpha) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:Alpha]

//0:内测 | 1:AppStore
#define kHMIsAppStore 0
#if kHMIsAppStore
#define kHMAppStoreUrl @"http://itunes.apple.com/us/app/fturestar/id123456789?ls=1&mt=8"
#else
#define kHMAppStoreUrl @"http://www.chinaHM.com/iphone_download.html"
#endif

//检测版本更新宏
#define HMSystemVersionLessThan(v) ([[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"] compare:v options:NSNumericSearch] == NSOrderedAscending)

//分享类型
typedef enum {
    ShareTypeSinaWeiBo = 0,
    ShareTypeTencentWeiBo = 1,
    ShareTypeQqSpace = 2,
    ShareTypeWeiXin = 3,
    ShareTypeRenRen = 4
} HMShareType;

//#ifndef __OPTIMIZE__
//#define NSLog(...) NSLog(__VA_ARGS__)
//#else
//#define NSLog(...) {}
//#endif

#ifdef DEBUG
#define NSLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define NSLog(format, ...)
#endif

#define HMTRACE(s)  NSLog(@"TRACE FUNCTION: %@ | %s | %@", NSStringFromClass([self class]), __FUNCTION__, s);
#define HMTRACE_FUNCTION  NSLog(@"TRACE FUNCTION: %@ | %s", NSStringFromClass([self class]), __FUNCTION__);
#define IS_DEBUG_LAYOUT (([@"YES" isEqualToString:[[NSUserDefaults standardUserDefaults] objectForKey:@"IsDebugLayout"]]) ? (true) : (false))

#define HMNotificationCenter   [NSNotificationCenter defaultCenter]

#define iOS7Later [[UIDevice currentDevice].systemVersion floatValue] >= 7.0f
#define iOS8Later [[UIDevice currentDevice].systemVersion.floatValue] >= 8.0f
#define iOS9Later [[UIDevice currentDevice].systemVersion.floatValue] >= 9.0f

#define HMColor(r,g,b) ([UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1])

#define separateLineColor UIColorFromHex(0xdddddd, 1)

#define HMPlaceHolderImage  @"Zhanwei"

/**使用十六进制获取颜色*/
#define UIColorFromHex(rgbValue, alphaValue)  [UIColor colorWithRed:(((rgbValue & 0xFF0000) >> 16))/255.0 green:(((rgbValue &0xFF00) >>8))/255.0 blue:((rgbValue &0xFF))/255.0 alpha:alphaValue]

#define HMWindow [UIApplication sharedApplication].delegate.window

#define RequestTimeOUT  15

//#define HMURLIP   @"http://wxapi.aoyusen.com"

//#define HMURLIP   @"http://wxapi.gedafu.com"

//#define HMURLIP   @"http://192.168.3.191:8686"

//#define HMURLIP   @"http://106.14.68.110:8080"

//#define HMURLIP   @"http://106.15.37.183:8383"

#define HMURLIP @"http://wxapi.autopiao.com"

//#define HMURLIP @"http://192.168.3.191:8878"

//#define HMURLIP @"http://106.15.42.0:8986"


#define  HMURL(PATH)  [NSString stringWithFormat:@"%@%@",HMURLIP,PATH]

#define HMCORNERRadius 3

#define HMFontSIZE [UIFont systemFontOfSize:13]

#define HMSESSIONId @"sessionid"

#define OPENId @"openid"

#define HMURLPath  @"/wx/wxapiapp/wsajax/wxapp"

#define HMURLPathUSER @"/wx/wxapiapp/wsajax/wxuser"
//
//#define HMURLPath  @"/twooption/wxapiapp/wsajax/wxapp"
//
//#define HMURLPathUSER @"/twooption/wxapiapp/wsajax/wxuser"

#define HMPATUrl [NSString stringWithFormat:@"%@%@",HMURLIP,HMURLPath]

#define HMPATUrlUSER [NSString stringWithFormat:@"%@%@",HMURLIP,HMURLPathUSER]

typedef enum {
    
    URLtypeAPP,
    
    URLtypeUSER
    
}URLtype;

typedef enum {
    
    RequesttypeGet,
    
    RequesttypePost
    
}Requesttype;

#define kCOLOR_R_G_B_A(r,g,b,a) [UIColor colorWithRed:r/255.0f  green:g/255.0f  blue:b/255.0f alpha:a]
#define kMainColor [UIColor colorWithRed:25/255.0f green:143/255.0f blue:236/255.0f alpha:1]


// RGB颜色
#define HMColorRGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 随机色
#define HMRandomColor HWColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

//下拉
#define VIEW_CENTER(aView)       ((aView).center)
#define VIEW_CENTER_X(aView)     ((aView).center.x)
#define VIEW_CENTER_Y(aView)     ((aView).center.y)

#define FRAME_ORIGIN(aFrame)     ((aFrame).origin)
#define FRAME_X(aFrame)          ((aFrame).origin.x)
#define FRAME_Y(aFrame)          ((aFrame).origin.y)

#define FRAME_SIZE(aFrame)       ((aFrame).size)
#define FRAME_HEIGHT(aFrame)     ((aFrame).size.height)
#define FRAME_WIDTH(aFrame)      ((aFrame).size.width)

#define VIEW_BOUNDS(aView)       ((aView).bounds)

#define VIEW_FRAME(aView)        ((aView).frame)

#define VIEW_ORIGIN(aView)       ((aView).frame.origin)
#define VIEW_X(aView)            ((aView).frame.origin.x)
#define VIEW_Y(aView)            ((aView).frame.origin.y)

#define VIEW_SIZE(aView)         ((aView).frame.size)
#define VIEW_HEIGHT(aView)       ((aView).frame.size.height)
#define VIEW_WIDTH(aView)        ((aView).frame.size.width)


#define VIEW_X_Right(aView)      ((aView).frame.origin.x + (aView).frame.size.width)
#define VIEW_Y_Bottom(aView)     ((aView).frame.origin.y + (aView).frame.size.height)

#define AnimateTime 0.25f   // 下拉动画时间

//用户名:username
#define Kusername  [[NSUserDefaults standardUserDefaults] objectForKey:@"username"]
//开户行：bankname
#define Kbankname  [[NSUserDefaults standardUserDefaults] objectForKey:@"bankname"]
//卡号：bankno
#define Kbankno  [[NSUserDefaults standardUserDefaults] objectForKey:@"bankno"]

//省份：bankprov
#define Kbankprov [[NSUserDefaults standardUserDefaults] objectForKey:@"bankprov"]
//城市：bankcity
#define Kbankcity [[NSUserDefaults standardUserDefaults] objectForKey:@"bankcity"]

#define KVersion  [[NSUserDefaults standardUserDefaults] objectForKey:@"version"]


//登录服务器返回的openid
#define Kopenid [[NSUserDefaults standardUserDefaults]objectForKey:@"openid"]
//登录服务器返回的sessionid
#define Kusersessionid = [[NSUserDefaults standardUserDefaults]objectForKey:@"sessionid"]



//#define TOPUPUrl(MuID) [NSString stringWithFormat:@"http://pay.autopiao.com/pay/pay.html?uid=%@",MuID]

#define TOPUPUrl(MuID) [NSString stringWithFormat:@"http://gc.autopiao.com/pay/pay/pay.html?uid=%@",MuID]


#endif /* Const_h */
