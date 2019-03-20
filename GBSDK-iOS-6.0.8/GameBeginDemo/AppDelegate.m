//
//  AppDelegate.m
//  GameBeginSDK
//
//  Created by bruce on 2017/8/17.
//  Copyright © 2017年 GameBegin. All rights reserved.
//

#import "AppDelegate.h"
#import <GBSDK/GBSDK.h>
#import <AdSupport/AdSupport.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSString *adId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    NSLog(@"adID:%@", adId);
    
    [self initSDK];
    
    return [[GBSDK shareInstance] application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)initSDK {
    //默认横版的，竖版的要设置这个
    //[[GBSDK shareInstance] setScreenOrientation:UIInterfaceOrientationPortrait];
    
    //[[GBSDK shareInstance] debugMod];//测试网络，注释掉为正式网络
    [[GBSDK shareInstance] log];     //打印日志，注释掉为不打日志
    
    
    //sample com.gamebegin.sample eling@gamebegin.com
    //语言设置
    [[GBSDK shareInstance] setLanguage:GB_LANGUAGE_DE];
    [[GBSDK shareInstance] setGameID:@"72" sdkSecret:@"cVOOTUHKr4qyVJta"];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {

    return [[GBSDK shareInstance] application:application supportedInterfaceOrientationsForWindow: window];

}

////iOS8 or older
//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
//  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
//
//
//    return [[GBSDK shareInstance] application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
//}

//iOS9 or newer
//Twitter默认使用这个
- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary *)options {

    return [[GBSDK shareInstance] application:app openURL:url options: options];

}


@end
