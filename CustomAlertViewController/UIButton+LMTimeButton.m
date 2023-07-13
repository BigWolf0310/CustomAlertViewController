//
//  UIButton+LMTimeButton.m
//  LiMi
//
//  Created by syt on 2021/4/2.
//  Copyright © 2021 syt. All rights reserved.
//

#import "UIButton+LMTimeButton.h"
#import <objc/runtime.h>

#define k_DefaultInterval   1.0

@implementation UIButton (LMTimeButton)

#pragma mark - 扩大按钮的点击区域
/**
 扩大按钮的点击区域
 */
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect btnBounds = self.bounds;
    btnBounds = CGRectInset(btnBounds, -5, 0); // k_Proportion_W(-20)
    return CGRectContainsPoint(btnBounds, point);
}

#pragma mark - 设置按钮的重复点击

- (NSTimeInterval)interVal {
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}

- (void)setInterVal:(NSTimeInterval)interVal {
    objc_setAssociatedObject(self, @selector(interVal), @(interVal), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isLgnoreEvent {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setIsLgnoreEvent:(BOOL)isLgnoreEvent {
    objc_setAssociatedObject(self, @selector(isLgnoreEvent), @(isLgnoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
//
//- (void)resetState {
//    [self setIsLgnoreEvent:NO];
//}
//
//+ (void)load {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        SEL selA = @selector(sendAction:to:forEvent:);
//        SEL selB = @selector(mySendAction:to:forEvent:);
//        Method methodA = class_getInstanceMethod(self, selA);
//        Method methodB = class_getInstanceMethod(self, selB);
//        // 将methodB的实现添加到系统方法中也就是说将methodA方法指针添加成方法methodB的返回值表示是否添加成功
//        BOOL isAdd = class_addMethod(self, selA, method_getImplementation(methodB), method_getTypeEncoding(methodB));
//        // 添加成功了说明本类中不存在methodB所以此时必须将方法b的实现指针换成方法A的，否则b方法将没有实现。
//        if(isAdd) {
//            class_replaceMethod(self, selB, method_getImplementation(methodA), method_getTypeEncoding(methodA));
//        } else {
//            //添加失败了说明本类中有methodB的实现，此时只需要将methodA和methodB的IMP互换一下即可。
//            method_exchangeImplementations(methodA, methodB);
//        }
//    });
//}

//- (void)mySendAction:(SEL)action to:(id)target forEvent:(UIEvent*)event{
//    if([NSStringFromClass(self.class)isEqualToString:@"UIButton"]) {
//        self.interVal = self.interVal == 0 ? k_DefaultInterval : self.interVal;
//        if(self.isLgnoreEvent) {
//            return;
//        } else if(self.interVal > 0) {
//            [self performSelector:@selector(resetState)withObject:nil afterDelay:self.interVal];
//        }
//    }
//    //此处methodA和methodB方法IMP互换了，实际上执行sendAction；所以不会死循环
//    self.isLgnoreEvent = YES;
//    [self mySendAction:action to:target forEvent:event];
//}

- (void)setImagePosition:(JKImagePosition)postion spacing:(CGFloat)spacing {
  CGFloat imageWith = self.imageView.image.size.width;
  CGFloat imageHeight = self.imageView.image.size.height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
  CGFloat labelWidth = [self.titleLabel.text sizeWithFont:self.titleLabel.font].width;
  CGFloat labelHeight = [self.titleLabel.text sizeWithFont:self.titleLabel.font].height;
#pragma clang diagnostic pop
  
  CGFloat imageOffsetX = (imageWith + labelWidth) / 2 - imageWith / 2;//image中心移动的x距离
  CGFloat imageOffsetY = imageHeight / 2 + spacing / 2;//image中心移动的y距离
  CGFloat labelOffsetX = (imageWith + labelWidth / 2) - (imageWith + labelWidth) / 2;//label中心移动的x距离
  CGFloat labelOffsetY = labelHeight / 2 + spacing / 2;//label中心移动的y距离
  
  switch (postion) {
    case LXMImagePositionLeft:
      self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
      self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
      break;
    case LXMImagePositionRight:
      self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing/2, 0, -(labelWidth + spacing/2));
      self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageHeight + spacing/2), 0, imageHeight + spacing/2);
      break;
      
    case LXMImagePositionTop:
      self.imageEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, imageOffsetX, labelOffsetY, -imageOffsetX); // 上左下右
      self.titleEdgeInsets = UIEdgeInsetsMake(imageOffsetY, -labelOffsetX, -imageOffsetY, labelOffsetX);
      break;
      
    case LXMImagePositionBottom:
      self.imageEdgeInsets = UIEdgeInsetsMake(labelOffsetY, imageOffsetX, -labelOffsetY, -imageOffsetX);
      self.titleEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, -labelOffsetX, imageOffsetY, labelOffsetX);
      break;
      
    default:
      break;
  }
}










@end
