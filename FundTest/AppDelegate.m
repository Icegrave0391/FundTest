//
//  AppDelegate.m
//  FundTest
//
//  Created by 张储祺 on 2018/8/24.
//  Copyright © 2018年 1. All rights reserved.
//

#import "AppDelegate.h"
#import "MeController.h"
#import "User.h"
#import "Organization.h"
#import "DataBaseTool.h"
#import "TeamController.h"
#import "ChatController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] ;
    [self.window makeKeyAndVisible] ;
    self.window.backgroundColor = [UIColor whiteColor] ;
    
    UITabBarController * tabCtrl = [[UITabBarController alloc] init] ;
    self.window.rootViewController = tabCtrl ;
    
    MeController * meCtrl = [[MeController alloc] init] ;
    TeamController * teamCtrl = [[TeamController alloc] init] ;
    ChatController * chatCtrl = [[ChatController alloc] init] ;
    UINavigationController * teamNav = [[UINavigationController alloc] initWithRootViewController:teamCtrl] ;
    UINavigationController * chatNav = [[UINavigationController alloc] initWithRootViewController:chatCtrl] ;
    UINavigationController * meNav = [[UINavigationController alloc] initWithRootViewController:meCtrl] ;
    tabCtrl.viewControllers = @[teamNav, chatNav, meNav] ;
    
    teamNav.tabBarItem.title = @"团队" ;
    teamNav.tabBarItem.image = [UIImage imageNamed:@"tab1"] ;
    chatNav.tabBarItem.title = @"交易" ;
    chatNav.tabBarItem.image = [UIImage imageNamed:@"tab2"] ;
    meNav.tabBarItem.title = @"我" ;
    meNav.tabBarItem.image = [UIImage imageNamed:@"tab3"] ;
    return YES;
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


@end
