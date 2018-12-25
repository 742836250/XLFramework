//
//  XLTouchID.m
//  XLFramework
//
//  Created by Jack Wang on 2018/11/26.
//  Copyright © 2018 Jack Wang. All rights reserved.
//  http://www.cocoachina.com/ios/20180418/23070.html

#import "XLTouchID.h"
#import <LocalAuthentication/LocalAuthentication.h>

@implementation XLTouchID

/**
 touchID 是否支持
 
 @return BOOL
 */
+ (BOOL)touchIDAvailable
{
    return NSFoundationVersionNumber <NSFoundationVersionNumber_iOS_8_0?NO:YES;
}


/**
 touchID 验证
 
 @param block 回调
 */
+ (void)touchIDVerificationCompleteBlock:(void(^)(BOOL success, NSString *msg))block
{
    if (![XLTouchID touchIDAvailable])
    {
        if (block)
        {
            block(NO,@"系统版本不支持TouchID");
        }
        return;
    }
    LAContext *context = [[LAContext alloc] init];
    context.localizedFallbackTitle = @"输入密码";
    if (@available(iOS 10.0, *))
    {
        context.localizedCancelTitle = @"22222";
    }
    else
    {
        // Fallback on earlier versions
    }
    NSError *error = nil;
    
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error])
    {
        
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"通过Home键验证已有手机指纹" reply:^(BOOL success, NSError * _Nullable error)
         {
            
            if (success)
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    block(YES,@"TouchID 验证成功");
                });
            }
            else if(error)
            {
                
                switch (error.code)
                {
                    case LAErrorAuthenticationFailed:
                    {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            block(NO,@"TouchID 验证失败");
                        });
                        break;
                    }
                    case LAErrorUserCancel:
                    {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            block(NO,@"TouchID 被用户手动取消");
                        });
                    }
                        break;
                    case LAErrorUserFallback:
                    {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            block(NO,@"用户不使用TouchID,选择手动输入密码");
                        });
                    }
                        break;
                    case LAErrorSystemCancel:
                    {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            block(NO,@"TouchID 被系统取消 (如遇到来电,锁屏,按了Home键等)");
                        });
                    }
                        break;
                    case LAErrorPasscodeNotSet:
                    {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            block(NO,@"TouchID 无法启动,因为用户没有设置密码");
                        });
                    }
                        break;
                    case LAErrorTouchIDNotEnrolled:
                    {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            block(NO,@"TouchID 无法启动,因为用户没有设置TouchID");
                        });
                    }
                        break;
                    case LAErrorTouchIDNotAvailable:
                    {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            block(NO,@"TouchID 无效");
                        });
                    }
                        break;
                    case LAErrorTouchIDLockout:
                    {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            block(NO,@"TouchID 被锁定(连续多次验证TouchID失败,系统需要用户手动输入密码)");
                        });
                    }
                        break;
                    case LAErrorAppCancel:
                    {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            block(NO,@"当前软件被挂起并取消了授权 (如App进入了后台等)");
                        });
                    }
                        break;
                    case LAErrorInvalidContext:
                    {
                        dispatch_async(dispatch_get_main_queue(), ^{
                            block(NO,@"当前软件被挂起并取消了授权 (LAContext对象无效)");
                        });
                    }
                        break;
                    default:
                        break;
                }
            }
        }];
        
    }
    else
    {
        NSLog(@"当前设备不支持TouchID");
    }
}


@end
