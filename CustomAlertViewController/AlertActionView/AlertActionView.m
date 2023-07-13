//
//  AlertActionView.m
//  Merchant
//
//  Created by syt on 2022/2/28.
//  Copyright © 2022 Alibaba. All rights reserved.
//

#import "AlertActionView.h"
#import "AlertTableCell.h"
#import "AlertImgTableCell.h"
#import "LoginStyleModel.h"
#import "Masonry.h"

@interface AlertActionView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) NSArray *titleAry;
@property (nonatomic, strong) UITableView *tableV;

@property (nonatomic, assign) int type;

@end

static NSString *const AlertCell = @"AlertCell";
static NSString *const AlertImgCell = @"AlertImgCell";

@implementation AlertActionView


- (instancetype)initWithFrame:(CGRect)frame titleAry:(NSArray *)titleAry type:(int)type
{
    self = [super initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    if (self) {
        self.backgroundColor = RGBA(0, 0, 0, .3);
        self.titleAry = titleAry;
        self.type = type;
        [self createSubViews];
    }
    return self;
}

- (void)createSubViews
{
    [self addSubview:self.bgView];
    [self.bgView addSubview:self.tableV];
}



#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.type == 2 || self.type == 5) {
        AlertImgTableCell *cell = [tableView dequeueReusableCellWithIdentifier:AlertImgCell];
        if (!cell) {
            cell = [[AlertImgTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AlertImgCell];
        }
        if (self.titleAry.count) {
            [cell updateContentWithData:self.titleAry[indexPath.row]];
        }
        return cell;
    } else {
        AlertTableCell *cell = [tableView dequeueReusableCellWithIdentifier:AlertCell];
        if (!cell) {
            cell = [[AlertTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AlertCell];
        }
        if (self.titleAry.count) {
            [cell updateContentWithData:self.titleAry[indexPath.row]];
        }
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 50 + kBottomSafeHeight)];
    if (self.type == 2) {
        UIView *bgV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 50 + kBottomSafeHeight)];
        bgV.backgroundColor = UIColor.whiteColor;
        UIButton *cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        cancleBtn.frame = CGRectMake(0, 0, ScreenWidth, 50);
        [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        [cancleBtn setTitleColor:FontRedColor forState:UIControlStateNormal];
        cancleBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [cancleBtn addTarget:self action:@selector(cancleBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [bgV addSubview:cancleBtn];
        [view addSubview:bgV];
    } else {
        UIView *bgV = [[UIView alloc] initWithFrame:CGRectMake(0, 10, ScreenWidth, 40 + kBottomSafeHeight)];
        bgV.backgroundColor = UIColor.whiteColor;
        UIButton *cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        cancleBtn.frame = CGRectMake(0, 0, ScreenWidth, 40);
        [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        [cancleBtn setTitleColor:FontRedColor forState:UIControlStateNormal];
        cancleBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [cancleBtn addTarget:self action:@selector(cancleBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [bgV addSubview:cancleBtn];
        [view addSubview:bgV];
    }
    return view;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.titleAry.count) {
        NSString *title = @"";
        if (self.type == 2 || self.type == 5) {
            LoginStyleModel *model = self.titleAry[indexPath.row];
            title = model.title;
        } else {
            title = self.titleAry[indexPath.row];
        }
        if (self.CellClickBlock) {
            self.CellClickBlock(title);
        }
        [self close];
    }
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
    UITouch *touch = [touches anyObject];
    if (touch.view == self) {
        [self close];
    }
}

#pragma mark - cancleBtnAction
- (void)cancleBtnAction
{
    [self close];
}


#pragma mark - 显示

- (void)show
{
    [UIView animateWithDuration:.25f animations:^{
        self.bgView.top = ScreenHeight - (self.titleAry.count + 1) * 50 - kBottomSafeHeight;
    }];
}

- (void)close
{
    [UIView animateWithDuration:.25f animations:^{
        self.bgView.top = self.height;
    } completion:^(BOOL finished) {
        if (finished) {
            [self.bgView removeAllSubviews];
            [self removeAllSubviews];
            [self removeFromSuperview];
        }
    }];
}






#pragma mark - lazy loading

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height, ScreenWidth, (self.titleAry.count + 1) * 50 + kBottomSafeHeight)];
    }
    return _bgView;
}

- (UITableView *)tableV
{
    if (!_tableV) {
        _tableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, (self.titleAry.count + 1) * 50 + kBottomSafeHeight) style:UITableViewStylePlain];
        _tableV.backgroundColor = HexColor(0xE1E1E1);
        UIBezierPath *cornerRadiusPath = [UIBezierPath bezierPathWithRoundedRect:_tableV.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerTopLeft cornerRadii:CGSizeMake(16, 16)];
        CAShapeLayer *cornerRadiusLayer = [ [CAShapeLayer alloc ] init];
        cornerRadiusLayer.frame = _tableV.bounds;
        cornerRadiusLayer.path = cornerRadiusPath.CGPath;
        _tableV.layer.mask = cornerRadiusLayer;
        _tableV.delegate = self;
        _tableV.dataSource = self;
        _tableV.scrollEnabled = NO;
        _tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableV registerClass:[AlertTableCell class] forCellReuseIdentifier:AlertCell];
        [_tableV registerClass:[AlertImgTableCell class] forCellReuseIdentifier:AlertImgCell];
    }
    return _tableV;
}





@end
