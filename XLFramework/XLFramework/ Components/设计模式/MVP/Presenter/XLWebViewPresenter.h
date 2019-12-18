//
//  XLWebViewPresenter.h
//  XLFramework
//
//  Created by Jack Wang on 2018/12/25.
//  Copyright © 2018 Jack Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
#import "XLWebViewPresenterProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface XLWebViewPresenter : NSObject<WKUIDelegate,WKNavigationDelegate,XLWebViewPresenterProtocol>


@end


NS_ASSUME_NONNULL_END
