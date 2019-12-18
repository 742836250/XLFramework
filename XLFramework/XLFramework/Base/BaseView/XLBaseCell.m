//
//  XLBaseCell.m
//  XLFramework
//
//  Created by Jack Wang on 2018/12/27.
//  Copyright © 2018 Jack Wang. All rights reserved.
//

#import "XLBaseCell.h"

static  NSString *const xl_reuseIdentifier = @"XLBaseCell";

@implementation XLBaseCell

#pragma mark - public

+ (CGFloat)xl_cellHeight
{
    return 44.0f;
}

+ (NSString *)xl_cellId
{
    return xl_reuseIdentifier;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
