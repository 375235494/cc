//
//  AppDelegate.m
//  HUAMAO
//
//  Created by 孙密 on 17/5/17.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "AppDelegate.h"

#import "HMMainTabBarVC.h"

#import "HMLoginRegisteredVC.h"

#import "HMChangePasswordVC.h"

#import "HMLoginNavVC.h"

#import "NavigationPageVC.h"



@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    

    
    [self setupBootstrapViewController];
    
    return YES;
}

#pragma mark - bootstrap view controller
- (void)setupBootstrapViewController {
    
    [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:@"maskTag"];
    
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor whiteColor];

//    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//    
//    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
//    
//    float integerApp_build = [app_build floatValue];
//    
//    float userDefaultBuild = [[[NSUserDefaults standardUserDefaults] objectForKey:@"AppBuild"]  floatValue];
    
//    if(integerApp_build == userDefaultBuild){
    
            HMLoginRegisteredVC * rootloginVC = [[HMLoginRegisteredVC alloc]init];
        
            HMLoginNavVC *Navlogin = [[HMLoginNavVC alloc]initWithRootViewController:rootloginVC];
        
            self.window.rootViewController = Navlogin;
//        
//    }else{
//        
//        NavigationPageVC * navigationPagevc = [[NavigationPageVC alloc]init];
//        
//        self.window.rootViewController = navigationPagevc;
//        
//    }
//    
//    
//    [[NSUserDefaults standardUserDefaults]setObject:app_build forKey:@"AppBuild"];
//    
//    [[NSUserDefaults standardUserDefaults] synchronize];
//    

    [self.window makeKeyAndVisible];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    SDWebImageManager *mgr = [SDWebImageManager sharedManager];
    // 1.取消下载
    [mgr cancelAll];
    
    // 2.清除内存中的所有图片
    [mgr.imageCache clearMemory];
}

@end
