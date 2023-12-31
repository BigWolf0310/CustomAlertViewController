//
//  UIButton+LMTimeButton.h
//  LiMi
//
//  Created by syt on 2021/4/2.
//  Copyright © 2021 syt. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JKImagePosition) {
    LXMImagePositionLeft = 0,              //图片在左，文字在右，默认
    LXMImagePositionRight = 1,             //图片在右，文字在左
    LXMImagePositionTop = 2,               //图片在上，文字在下
    LXMImagePositionBottom = 3,            //图片在下，文字在上
};

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (LMTimeButton)

/**重复点击时间间隔*/
@property (nonatomic, assign) NSTimeInterval interVal;
/**yes不允许点击，no允许点击*/
@property (nonatomic, assign) BOOL isLgnoreEvent;

/**
 *  利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
 *  注意：这个方法需要在设置图片和文字之后才可以调用，且button的大小要大于 图片大小+文字大小+spacing
 *
 *  @param spacing 图片和文字的间隔
 */
- (void)setImagePosition:(JKImagePosition)postion spacing:(CGFloat)spacing;




@end

NS_ASSUME_NONNULL_END
