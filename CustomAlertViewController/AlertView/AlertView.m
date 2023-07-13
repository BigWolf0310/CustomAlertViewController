//
//  AlertView.m
//  Merchant
//
//  Created by syt on 2022/2/24.
//  Copyright © 2022 Alibaba. All rights reserved.
//

#import "AlertView.h"

@interface AlertView ()

@property (nonatomic, strong) UIView *bigV;
@property (nonatomic, strong) UILabel *contentLab;
// 横线
@property (nonatomic, strong) UIView *h_lineV;
// 竖线
@property (nonatomic, strong) UIView *s_lineV;

@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;

@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) int btnCount;
@property (nonatomic, assign) BOOL isHide;

@end


@implementation AlertView

- (instancetype)initWithFrame:(CGRect)frame content:(NSString *)content btnCount:(int)btnCount leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle isHide:(BOOL)isHide
{
    self = [super initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    if (self) {
        self.backgroundColor = RGBA(0, 0, 0, .3);
        self.content = content;
        self.btnCount = btnCount;
        self.leftTitle = leftTitle;
        self.rightTitle = rightTitle;
        self.isHide = isHide;
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews
{
    [self addSubview:self.bigV];
    [self.bigV addSubview:self.contentLab];
    [self.bigV addSubview:self.h_lineV];
    if (self.btnCount >= 2) { // 两个按钮
        [self.bigV addSubview:self.s_lineV];
        [self.bigV addSubview:self.leftBtn];
        [self.bigV addSubview:self.rightBtn];
    } else { // 1个按钮
        [self.bigV addSubview:self.leftBtn];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.bigV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.left.equalTo(self).offset(52);
        make.right.equalTo(self).offset(-52);
    }];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bigV).offset(40);
        make.left.equalTo(self.bigV).offset(25);
        make.right.equalTo(self.bigV).offset(-25);
    }];
    [self.h_lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLab.mas_bottom).offset(30);
        make.left.right.equalTo(self.bigV);
        make.height.mas_equalTo(1);
        make.bottom.equalTo(self.leftBtn.mas_top);
    }];
    if (self.btnCount >= 2) {
        [self.s_lineV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.h_lineV.mas_bottom);
            make.bottom.centerX.equalTo(self.bigV);
            make.width.mas_equalTo(1);
            make.height.mas_equalTo(40);
        }];
        [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.s_lineV);
            make.left.equalTo(self.bigV);
            make.right.equalTo(self.s_lineV.mas_left);
        }];
        [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.s_lineV);
            make.right.equalTo(self.bigV);
            make.left.equalTo(self.s_lineV.mas_right);
        }];
    } else {
        [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.bigV);
            make.height.mas_equalTo(40);
        }];
    }
}


#pragma mark - btnAction
- (void)btnAction:(UIButton *)btn
{
    if (self.BtnClickBlock) {
        self.BtnClickBlock(btn.tag, self.isHide);
    }
}

#pragma mark - setter方法

- (void)setTipString:(NSString *)tipString
{
    _tipString = tipString;
    self.contentLab.text = tipString;
    [self setTipText];
}

- (void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    self.contentLab.textColor = titleColor;
}

- (void)setLeftTitle:(NSString *)leftTitle
{
    _leftTitle = leftTitle;
    [self.leftBtn setTitle:leftTitle forState:UIControlStateNormal];
}

- (void)setLeftColor:(UIColor *)leftColor
{
    _leftColor = leftColor;
    [self.leftBtn setTitleColor:leftColor forState:UIControlStateNormal];
}

- (void)setRightTitle:(NSString *)rightTitle
{
    _rightTitle = rightTitle;
    [self.rightBtn setTitle:rightTitle forState:UIControlStateNormal];
}

- (void)setRightColor:(UIColor *)rightColor
{
    _rightColor = rightColor;
    [self.rightBtn setTitleColor:rightColor forState:UIControlStateNormal];
}








// 设置提示文本的行间距
- (void)setTipText {
    NSString *tipStr = self.contentLab.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:tipStr];
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:[[attributedString string] rangeOfString:tipStr]];
    [attributedString addAttribute:NSForegroundColorAttributeName value:MainBlackColor range:[[attributedString string] rangeOfString:tipStr]];
    // 设置间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 8;// 字体的行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:[[attributedString string] rangeOfString:tipStr]];
    self.contentLab.attributedText = attributedString;
    self.contentLab.textAlignment = NSTextAlignmentCenter;
}






#pragma mark - lazy loading

- (UIView *)bigV
{
    if (!_bigV) {
        _bigV = [[UIView alloc] init];
        _bigV.backgroundColor = UIColor.whiteColor;
        _bigV.layer.masksToBounds = YES;
        _bigV.layer.cornerRadius = 10;
    }
    return _bigV;
}

- (UILabel *)contentLab
{
    if (!_contentLab) {
        _contentLab = [[UILabel alloc] init];
        _contentLab.text = self.content;
        _contentLab.textColor = MainBlackColor;
        _contentLab.font = [UIFont systemFontOfSize:14];
        _contentLab.numberOfLines = 0;
        [self setTipText];
    }
    return _contentLab;
}

- (UIView *)h_lineV
{
    if (!_h_lineV) {
        _h_lineV = [[UIView alloc] init];
        _h_lineV.backgroundColor = Line_Color;
    }
    return _h_lineV;
}

- (UIView *)s_lineV
{
    if (!_s_lineV) {
        _s_lineV = [[UIView alloc] init];
        _s_lineV.backgroundColor = Line_Color;
    }
    return _s_lineV;
}

- (UIButton *)leftBtn
{
    if (!_leftBtn) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftBtn setTitle:self.leftTitle forState:UIControlStateNormal];
        [_leftBtn setTitleColor:AlertGrayColor forState:UIControlStateNormal];
        _leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _leftBtn.tag = 3001;
        [_leftBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}

- (UIButton *)rightBtn
{
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBtn setTitle:self.rightTitle forState:UIControlStateNormal];
        [_rightBtn setTitleColor:FontRedColor forState:UIControlStateNormal];
        _rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _rightBtn.tag = 3002;
        [_rightBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}



@end
