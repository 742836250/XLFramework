//
//  UINavigationController+StatusBar.m
//  Gamebox7724
//
//  Created by Jack Wang on 2018/5/11.
//  Copyright © 2018年 pipaw. All rights reserved.
//

#import "UINavigationController+StatusBar.h"

@implementation UINavigationController (StatusBar)


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return [[self topViewController] preferredStatusBarStyle];
}
@end
