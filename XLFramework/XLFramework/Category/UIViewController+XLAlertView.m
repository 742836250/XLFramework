//
//  UIViewController+JKCategory.m
//  ASWLeaders
//
//  Created by 王锐锋 on 15/11/20.
//  Copyright © 2015年 pengjinwei. All rights reserved.
//

#import "UIViewController+XLAlertView.h"
#import "XLAlertView.h"
#define JK_IOS_VERSION_8_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)? (YES):(NO))
#define dispatchMain(block) dispatch_async(dispatch_get_main_queue(),block)
@implementation UIViewController (XLAlertView)
- (void)showCancelAlertWithTitle:(NSString *)title
                         message:(NSString *)message
               cancelButtonTitle:(NSString *)cancelTitle
                          cancel:(CancelCallBack)cancelCallBack
{
    if (JK_IOS_VERSION_8_OR_ABOVE)
    {
        UIAlertController*alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            if (cancelCallBack)
            {
               cancelCallBack ();
            }
            
        }];
        [alertController addAction:cancelAction];
        if ([NSThread isMainThread])
        {
            [self presentViewController:alertController animated:YES completion:nil];
        }
        else
        {
            dispatchMain(^{
                [self presentViewController:alertController animated:YES completion:nil];
            });
        }

    }
    else
    {
        [XLAlertView showCancelAlertWithTitle:title message:message cancelButtonTitle:cancelTitle cancel:^{
            
            if (cancelCallBack)
            {
                cancelCallBack ();
            }
        }];
    }
}
- (void)showCancelAndConfirmAlertWithTitle:(NSString *)title
                                   message:(NSString *)message
                         cancelButtonTitle:(NSString *)cancelTitle
                        confirmButtonTitle:(NSString *) confirmTitle
                                    cancel:(CancelCallBack)cancelCallBack
                                   confirm:(ConfirmCallBack)confirmCallBack
{
      if (JK_IOS_VERSION_8_OR_ABOVE)
      {
          UIAlertController*alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
          UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
              if (cancelCallBack)
              {
                  cancelCallBack ();
              }
              
          }];
          UIAlertAction *otherAction = [UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
              if (confirmCallBack)
              {
                  confirmCallBack ();
              }
          }];
          [alertController addAction:cancelAction];
          [alertController addAction:otherAction];
        
          if ([NSThread isMainThread])
          {
              [self presentViewController:alertController animated:YES completion:nil];
          }
          else
          {
              dispatchMain(^{
                  [self presentViewController:alertController animated:YES completion:nil];
              });
          }
        

      }
    else
    {
        [XLAlertView showCancelAndConfirmAlertWithTitle:title message:message cancelButtonTitle:cancelTitle confirmButtonTitle:confirmTitle cancel:^{
            
            if (cancelCallBack)
            {
                cancelCallBack ();
            }
            
        } confirm:^{
            
            if (confirmCallBack)
            {
                  confirmCallBack ();
            }
            
        }];
    }
    
}
//获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    return result;
}
//.获取当前屏幕中present出来的viewcontroller。
+ (UIViewController *)getPresentedViewController
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    if (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    
    return topVC;
}
@end
