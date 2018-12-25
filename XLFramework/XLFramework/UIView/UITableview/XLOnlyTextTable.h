//
//  XLOnlyTextTab.h
//  XLFramework
//
//  Created by Jack Wang on 2018/9/18.
//  Copyright © 2018年 Jack Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XLOnlyTextTable : UITableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder;
- (instancetype)init;
- (instancetype)initWithFrame:(CGRect)frame;


@end

NS_ASSUME_NONNULL_END
