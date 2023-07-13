//
//  AlertView.h
//  Merchant
//
//  Created by syt on 2022/2/24.
//  Copyright © 2022 Alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AlertView : UIView

/**底部按钮的点击方法（tag：3001，左边按钮，tag：3002，右边按钮） isHide：设置的是否移除该视图*/
@property (nonatomic, copy) void (^BtnClickBlock) (NSInteger tag, BOOL isHide);

/**提示文字*/
@property (nonatomic, copy) NSString *tipString;
/**提示文字颜色*/
@property (nonatomic, strong) UIColor *titleColor;
/**左侧按钮名称*/
@property (nonatomic, copy) NSString *leftTitle;
/**左边字体颜色*/
@property (nonatomic, strong) UIColor *leftColor;
/**右侧按钮名称*/
@property (nonatomic, copy) NSString *rightTitle;
/**右边字体颜色*/
@property (nonatomic, strong) UIColor *rightColor;



/**
 content：提示的内容
 btnCount：按钮的个数（1个或者2个，1个的话只用设置左边按钮title）
 leftTitle：左边按钮名称
 rightTitle：右边按钮名称
 isHide：点击按钮之后是否移除该视图
 */
- (instancetype)initWithFrame:(CGRect)frame content:(NSString *)content btnCount:(int)btnCount leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle isHide:(BOOL)isHide;


@end

NS_ASSUME_NONNULL_END
