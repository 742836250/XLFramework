//
//  XLOnlyTextCell.m
//  XLFramework
//
//  Created by Jack Wang on 2018/12/27.
//  Copyright © 2018 Jack Wang. All rights reserved.
//

#import "XLOnlyTextCell.h"

@implementation XLOnlyTextCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setUpSubviews];
    }
    return self;
}

- (void)setUpSubviews
{
    [self.contentView addSubview:self.xl_textLab];
    [self.xl_textLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView).offset(18.0f);
        make.right.mas_equalTo(self.contentView).offset(-18.0f);
    }];
    
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handelLongPressGesture:)];
    
    [self.contentView addGestureRecognizer:longPressGesture];
}

- (void)handelLongPressGesture:(UIGestureRecognizer *)gesture
{
    if (self.xl_longPressGestureBlock)
    {
        self.xl_longPressGestureBlock();
    }
}

#pragma mark - getter
- (UILabel *)xl_textLab
{
    if (!_xl_textLab)
    {
        _xl_textLab = [[UILabel alloc] init];
        _xl_textLab.textAlignment = NSTextAlignmentLeft;
    }
    return _xl_textLab;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
