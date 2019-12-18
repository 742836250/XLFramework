//
//  XLFactoryPatternCellB.m
//  XLFramework
//
//  Created by Jack Wang on 2018/11/9.
//  Copyright © 2018 Jack Wang. All rights reserved.
//

#import "XLFactoryPatternCellB.h"

@interface XLFactoryPatternCellB ()

@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UIImageView *middleImageView;

@end

@implementation XLFactoryPatternCellB

- (void)configureUI
{
    [super configureUI];
    
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.contentView).offset(5.0f);
    }];
    [self.titleLab setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [self.contentView addSubview:self.middleImageView];
    [self.middleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.titleLab);
        make.top.mas_equalTo(self.titleLab.mas_bottom).offset(5.0f);
        make.bottom.mas_equalTo(self.contentView).offset(-5.0f);
        make.width.mas_equalTo(self.middleImageView.mas_height);
    }];
}

- (void)configureDataSource:(XLFactoryPatternConfigureModel *)model
{
    [super configureDataSource:model];
    self.middleImageView.image = [UIImage imageNamed:@"header"];
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

- (UIImageView *)middleImageView
{
    if (!_middleImageView)
    {
        _middleImageView = [[UIImageView alloc] init];
    }
    return _middleImageView;
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
