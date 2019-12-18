//
//  XLFactoryPatternCellC.m
//  XLFramework
//
//  Created by Jack Wang on 2018/11/9.
//  Copyright © 2018 Jack Wang. All rights reserved.
//

#import "XLFactoryPatternCellC.h"

@interface XLFactoryPatternCellC ()

@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UIImageView *rightImageView;

@end

@implementation XLFactoryPatternCellC

- (void)configureUI
{
    [super configureUI];
    [self.contentView addSubview:self.titleLab];
    [self.contentView addSubview:self.rightImageView];
    
    [self.titleLab setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView).offset(-10.0f);
        make.bottom.mas_equalTo(self.contentView).offset(-5.0f);
    }];
    
    [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.titleLab);
        make.bottom.mas_equalTo(self.titleLab.mas_top).offset(-5.0f);
        make.top.mas_equalTo(self.contentView).offset(5.0f);
        make.width.mas_equalTo(self.rightImageView.mas_height);
    }];
  
}

- (void)configureDataSource:(XLFactoryPatternConfigureModel *)model
{
    [super configureDataSource:model];
    self.rightImageView.image = [UIImage imageNamed:@"header"];
    self.titleLab.text = model.identifier;
    self.titleLab.textColor = model.backColor;
}
- (UILabel *)titleLab
{
    if (!_titleLab)
    {
        _titleLab = [[UILabel alloc] init];
        _titleLab.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLab;
}

- (UIImageView *)rightImageView
{
    if (!_rightImageView)
    {
        _rightImageView = [[UIImageView alloc] init];
    }
    return _rightImageView;
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
