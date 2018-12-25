//
//  XLFactoryPatternBaseCell.h
//  XLFramework
//
//  Created by Jack Wang on 2018/11/9.
//  Copyright © 2018 Jack Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLFactoryPatternConfigureModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XLFactoryPatternBaseCell : UITableViewCell


- (void)configureUI;

- (void)configureDataSource:(XLFactoryPatternConfigureModel *)model;

@end

NS_ASSUME_NONNULL_END
