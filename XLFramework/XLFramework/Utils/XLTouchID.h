//
//  XLTouchID.h
//  XLFramework
//
//  Created by Jack Wang on 2018/11/26.
//  Copyright © 2018 Jack Wang. All rights reserved.
//  http://www.cocoachina.com/ios/20180418/23070.html

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XLTouchID : NSObject


/**
 touchID 是否支持

 @return BOOL
 */
+ (BOOL)touchIDAvailable;

/**
 touchID 验证

 @param block 回调
 */
+ (void)touchIDVerificationCompleteBlock:(void(^)(BOOL success, NSString *msg))block;

@end

NS_ASSUME_NONNULL_END
