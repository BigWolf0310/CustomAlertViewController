//
//  AlertImgTableCell.m
//  Merchant
//
//  Created by syt on 2022/5/13.
//  Copyright © 2022 Alibaba. All rights reserved.
//

#import "AlertImgTableCell.h"
#import "LoginStyleModel.h"
#import "Masonry.h"

@interface AlertImgTableCell ()

@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UIView *lineV;

@end

@implementation AlertImgTableCell

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
    [self.contentView addSubview:self.btn];
    [self.contentView addSubview:self.lineV];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.contentView);
        make.bottom.equalTo(self.lineV.mas_top);
    }];
    [self.lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(1);
    }];
}

- (void)updateContentWithData:(id)data
{
    if ([data isKindOfClass:[LoginStyleModel class]]) {
        LoginStyleModel *model = (LoginStyleModel *)data;
        [self.btn setImage:[UIImage imageNamed:model.imgName] forState:UIControlStateNormal];
        [self.btn setTitle:model.title forState:UIControlStateNormal];
        [self.btn setImagePosition:LXMImagePositionLeft spacing:5];
    }
}



#pragma mark - lazy loading

// account_login    face_login / touch_login     phone_login
- (UIButton *)btn
{
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn setTitleColor:MainBlackColor forState:UIControlStateNormal];
        _btn.titleLabel.font = [UIFont systemFontOfSize:16];
        _btn.userInteractionEnabled = NO;
        _btn.adjustsImageWhenHighlighted = NO;
    }
    return _btn;
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
