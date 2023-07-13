//
//  AlertTableCell.m
//  Merchant
//
//  Created by syt on 2022/3/2.
//  Copyright © 2022 Alibaba. All rights reserved.
//

#import "AlertTableCell.h"


@interface AlertTableCell ()

@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UIView *lineV;

@end


@implementation AlertTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews
{
    [self.contentView addSubview:self.titleLab];
    [self.contentView addSubview:self.lineV];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.contentView);
        make.bottom.equalTo(self.lineV.mas_top);
    }];
    [self.lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(1);
    }];
}

- (void)updateContentWithData:(NSString *)data
{
    self.titleLab.text = [NSString stringWithFormat:@"%@", data];
}



#pragma mark - lazy loading

- (UILabel *)titleLab
{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.text = @"";
        _titleLab.textColor = MainBlackColor;
        _titleLab.font = [UIFont systemFontOfSize:16];
        _titleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLab;
}

- (UIView *)lineV
{
    if (!_lineV) {
        _lineV = [[UIView alloc] init];
        _lineV.backgroundColor = Line_Color;
    }
    return _lineV;
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
