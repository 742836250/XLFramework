//
//  XLBaseCell.h
//  XLFramework
//
//  Created by Jack Wang on 2018/12/27.
//  Copyright © 2018 Jack Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLViewProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface XLBaseCell : UITableViewCell<XLViewProtocol>

+ (CGFloat)xl_cellHeight;

+ (NSString *)xl_cellId;

@end

NS_ASSUME_NONNULL_END
