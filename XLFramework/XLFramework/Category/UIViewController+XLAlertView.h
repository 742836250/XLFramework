//
//  UIViewController+JKCategory.h
//  ASWLeaders
//
//  Created by 王锐锋 on 15/11/20.
//  Copyright © 2015年 pengjinwei. All rights reserved.
//
#import <UIKit/UIKit.h>

typedef void(^CancelCallBack)(void);
typedef void(^ConfirmCallBack)(void);

@interface UIViewController (XLAlertView)

- (void)showCancelAlertWithTitle:(NSString *)title
                         message:(NSString *)message
               cancelButtonTitle:(NSString *)cancelTitle
                          cancel:(CancelCallBack)cancelCallBack;

- (void)showCancelAndConfirmAlertWithTitle:(NSString *)title
                                   message:(NSString *)message
                         cancelButtonTitle:(NSString *)cancelTitle
                        confirmButtonTitle:(NSString *) confirmTitle
                                    cancel:(CancelCallBack)cancelCallBack
                                   confirm:(ConfirmCallBack)confirmCallBack;

//.获取当前屏幕中present出来的viewcontroller。
+ (UIViewController *)getPresentedViewController;
//获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC;
@end
