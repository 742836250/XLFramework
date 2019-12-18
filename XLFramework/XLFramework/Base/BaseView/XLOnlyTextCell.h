//
//  XLOnlyTextCell.h
//  XLFramework
//
//  Created by Jack Wang on 2018/12/27.
//  Copyright © 2018 Jack Wang. All rights reserved.
//

#import "XLBaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface XLOnlyTextCell : XLBaseCell

@property (nonatomic, strong) UILabel *xl_textLab;

@property (nonatomic, strong) void(^xl_longPressGestureBlock)(void);

@end

NS_ASSUME_NONNULL_END
