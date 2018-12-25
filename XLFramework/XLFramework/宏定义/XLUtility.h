//
//  XLUtility.h
//  XLFramework
//
//  Created by Jack Wang on 2018/9/13.
//  Copyright © 2018年 Jack Wang. All rights reserved.
//


#ifndef XLUtility_h
#define XLUtility_h

//获取系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]

//屏幕宽度
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
//屏幕高度
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
//屏幕最长边
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
//屏幕最短边
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
//状态栏高度
#define IOS_STATUSBAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height
//导航栏高度
#define IOS_NAVBAR_HEIGHT self.navigationController.navigationBar.frame.size.height
//状态栏高度+导航栏高度有(导航才能使用)
#define STATUS_NAVBAR_HEIGHT (IOS_STATUSBAR_HEIGHT + IOS_NAVBAR_HEIGHT)

#define STATUS_TABAR_HEIGHT (self.navigationController.tabBarController.tabBar.height + [UIApplication sharedApplication].statusBarFrame.size.height)

// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

// link文本颜色
#define kLinkAttributesActive       @{(NSString *)kCTUnderlineStyleAttributeName : [NSNumber numberWithBool:NO],(NSString *)kCTForegroundColorAttributeName : (__bridge id)[[UIColor XRKLinkColor] CGColor]}
#define kLinkAttributes     @{(__bridge NSString *)kCTUnderlineStyleAttributeName : [NSNumber numberWithBool:NO],(NSString *)kCTForegroundColorAttributeName : (__bridge id)[[UIColor XRKLinkColor] CGColor]}

// GCD
#define dispatchGrobal(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define dispatchMain(block) dispatch_async(dispatch_get_main_queue(),block)

//设置圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

//设置圆角和边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

//NSLocalizedString
#define LS(string) NSLocalizedString(string,nil)
//NSString
#define STRING_OR_EMPTY(A)  ({ __typeof__(A) __a = (A); __a ? __a : @""; })

//weakself
#define WEAKSELF __weak __typeof(&*self)weakSelf = self;

//NSLog
#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}
#endif
#define LOGFUN NSLog(@"%s",__func__);





#endif /* XLUtility_h */
