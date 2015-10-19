//
//  AppDelegate.m
//  YouPai
//
//  Created by stonedong on 15/8/23.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "AppDelegate.h"
#import "LTGlobalViewController.h"
#import "LTConfigure.h"
#import "SAReqManager.h"
#import "YPUserLoginReq.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    LTApplicationSetup();
    LTGlobalViewController* globalVC = [LTGlobalViewController new];
    _globalViewController = globalVC;
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = globalVC;
    //
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    
    YPUserLoginReq* req = [YPUserLoginReq new];
    req.uname = @"test";
    req.passwd = @"123456";
    
    [MSDefaultSyncCenter performRequest:req];
    
    return YES;
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



- (BOOL) application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    if ([[SAReqManager shareManager] canHandleURL]) {
        [[SAReqManager shareManager] handleURL:url];
    }
    
    return YES;
}

- (BOOL) application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if ([[SAReqManager shareManager] canHandleURL]) {
        [[SAReqManager shareManager] handleURL:url];
    }
    
    return YES;
}
@end
