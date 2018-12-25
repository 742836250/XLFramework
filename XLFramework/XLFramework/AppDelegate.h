//
//  AppDelegate.h
//  XLFramework
//
//  Created by Jack Wang on 2018/9/12.
//  Copyright © 2018年 Jack Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/***  是否允许横屏的标记 */
@property (nonatomic, assign, readwrite) BOOL allowRotation;

@end

