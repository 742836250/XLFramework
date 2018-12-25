//
//  AppDelegate.m
//  XLFramework
//
//  Created by Jack Wang on 2018/9/12.
//  Copyright © 2018年 Jack Wang. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSURL *receiptUrl=[[NSBundle mainBundle] appStoreReceiptURL];
    NSData *receiptData=[NSData dataWithContentsOfURL:receiptUrl];
    
    NSString *receiptString=[receiptData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];//转化为base64字符串
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
      NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(Timered:) userInfo:nil repeats:YES];
UIBackgroundTaskIdentifier *backTask = [[UIApplication sharedApplication]beginBackgroundTaskWithExpirationHandler:^(){
        //程序在10分钟内未被系统关闭或者强制关闭，则程序会调用此代码块，可以在这里做一些保存或者清理工作
        NSLog(@"程序关闭");
    [[UIApplication sharedApplication] endBackgroundTask:backTask];
}];
}
- (void)Timered:(NSTimer*)timer
{
    static int a= 0;
    a++;
    NSLog(@"%d",a);
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

#pragma mark    禁止横屏
- (UIInterfaceOrientationMask )application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    if (self.allowRotation)
    {
//        return UIInterfaceOrientationMaskAll;
        return UIInterfaceOrientationMaskLandscapeRight;
    }
    return UIInterfaceOrientationMaskPortrait;
}

@end
