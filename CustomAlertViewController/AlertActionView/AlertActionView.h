//
//  AlertActionView.h
//  Merchant
//
//  Created by syt on 2022/2/28.
//  Copyright © 2022 Alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AlertActionView : UIView

/**cell点击方法，根据标题判断*/
@property (nonatomic, copy) void (^CellClickBlock) (NSString *title);
/**初始化方法，根据type区分（type = 1，修改头像，type = 2，更改登录方式）*/
- (instancetype)initWithFrame:(CGRect)frame titleAry:(NSArray *)titleAry type:(int)type;

- (void)show;

- (void)close;


@end

NS_ASSUME_NONNULL_END
