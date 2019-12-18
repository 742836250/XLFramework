//
//  XLViewPresenter.h
//  XLFramework
//
//  Created by Jack Wang on 2018/12/27.
//  Copyright © 2018 Jack Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol XLViewProtocol <NSObject>

- (void)initLocalData;

- (void)setUpSubviews;

@end

NS_ASSUME_NONNULL_END
