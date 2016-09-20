//
//  AppDelegate.m
//  XianyuTabbar
//
//  Created by 英策网络科技 on 16/8/9.
//  Copyright © 2016年 英策网络科技. All rights reserved.
//

#import "AppDelegate.h"
#import "RDVTabBarItem.h"
#import "RDVTabBarController.h"
#import "firstVC.h"
#import "secondVC.h"
#import "thirdVC.h"
#import "fourthVC.h"
#import "MiddleVC.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UINavigationController*shopNav=[[UINavigationController alloc]initWithRootViewController:[[firstVC alloc]init]];
    
    UINavigationController*storeNav=[[UINavigationController alloc]initWithRootViewController:[[secondVC alloc]init]];
    
    UINavigationController*messageNav=[[UINavigationController alloc]initWithRootViewController:[[thirdVC alloc]init]];
    
    UINavigationController*mineNav=[[UINavigationController alloc]initWithRootViewController:[[fourthVC alloc]init]];
    
    RDVTabBarController*tabBarController=[[RDVTabBarController alloc]init];
    [tabBarController setViewControllers:@[storeNav,shopNav,messageNav,mineNav]];
    [self customizeTabBarForController:tabBarController];
    
    self.window.rootViewController =tabBarController;
    
    [self.window makeKeyWindow];
    return YES;
}
- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController {
    NSArray *tabBarItemImages = @[@"Store",@"Shopping",  @"Message",@"Mine"];
    NSArray *tabBarItemTitle = @[@"店铺",@"购物",@"消息",@"我的"];
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        [item setBackgroundColor:[UIColor whiteColor]];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        item.title = tabBarItemTitle[index];
        index++;
    }
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

@end
