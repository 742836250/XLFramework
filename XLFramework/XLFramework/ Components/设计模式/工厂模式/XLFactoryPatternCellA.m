//
//  XLFactoryPatternCellA.m
//  XLFramework
//
//  Created by Jack Wang on 2018/11/9.
//  Copyright © 2018 Jack Wang. All rights reserved.
//

#import "XLFactoryPatternCellA.h"

@interface XLFactoryPatternCellA ()

@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UIImageView *leftImageView;

@end

@implementation XLFactoryPatternCellA

- (void)configureUI
{
    [super configureUI];
    
    [self.contentView addSubview:self.leftImageView];
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(10.0f);
        make.centerY.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.contentView).offset(5.0f);
        make.bottom.mas_equalTo(self.contentView).offset(-5.0f);
        make.width.mas_equalTo(self.leftImageView.mas_height);
    }];
    
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftImageView.mas_right).offset(5.0f);
        make.top.mas_equalTo(self.leftImageView);
    }];
}

- (void)configureDataSource:(XLFactoryPatternConfigureModel *)model
{
    [super configureDataSource:model];
    self.leftImageView.image = [UIImage imageNamed:@"header"];
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

- (UIImageView *)leftImageView
{
    if (!_leftImageView)
    {
        _leftImageView = [[UIImageView alloc] init];
    }
    return _leftImageView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
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
