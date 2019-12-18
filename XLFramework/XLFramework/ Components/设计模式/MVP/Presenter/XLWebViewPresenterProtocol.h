//
//  XLWebViewPresenterProtocol.h
//  XLFramework
//
//  Created by Jack Wang on 2018/12/25.
//  Copyright © 2018 Jack Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol XLWebViewPresenterProtocol <NSObject>

@optional

// 处理View视图相关操作 -- 协议的遵守者
- (void)setView:(NSObject *)view;

// 处理事件的相关响应
- (void)setViewController:(UIViewController *)viewController;

// 展示
- (void)present;

// 加载model
- (void)presentWithModel:(id)model viewController:(UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
