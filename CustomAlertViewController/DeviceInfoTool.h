//
//  DeviceInfoTool.h
//  MobileBank
//
//  Created by YeKongStar on 2022/12/23.
//
//  https://blog.csdn.net/weixin_42292229/article/details/124054651
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DeviceInfoTool : UIDevice

/// 顶部安全区高度
+(CGFloat)vg_safeDistanceTop;

/// 底部安全区高度
+(CGFloat)vg_safeDistanceBottom;

/// 顶部状态栏高度(包括安全区)
+(CGFloat)vg_statusBarHeight;

/// 导航栏高度
+(CGFloat)vg_navigationBarHeight;

/// 状态栏+导航栏的高度
+(CGFloat)vg_navigationFullHeight;

/// 底部导航栏高度
+(CGFloat)vg_tabBarHeight;

/// 底部导航栏高度(包括安全区)
+(CGFloat)vg_tabBarFullHeight;

@end

NS_ASSUME_NONNULL_END
