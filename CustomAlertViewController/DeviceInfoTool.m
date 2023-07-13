//
//  DeviceInfoTool.m
//  MobileBank
//
//  Created by YeKongStar on 2022/12/23.
//

#import "DeviceInfoTool.h"

@implementation DeviceInfoTool

/// 顶部安全区高度
+(CGFloat)vg_safeDistanceTop{
    if(@available(ios 13.0,*)) {
        NSSet *set=[UIApplication sharedApplication].connectedScenes;
        UIWindowScene *windowScene =[set anyObject];
        UIWindow *window =windowScene.windows.firstObject;
        return window.safeAreaInsets.top;
        
    }
    else if (@available(ios 11.0,*)) {
        UIWindow*window=[UIApplication sharedApplication].windows.firstObject;
        return window.safeAreaInsets.top;
        
    }
    return 0;
}

/// 底部安全区高度
+(CGFloat)vg_safeDistanceBottom {
    if(@available(ios 13.0,*)){
        NSSet *set=[UIApplication sharedApplication].connectedScenes;
        UIWindowScene *windowScene =[set anyObject];
        UIWindow *window =windowScene.windows.firstObject;
        return window.safeAreaInsets.bottom;
        
    }
    else if(@available(ios 11.0,*)) {
        UIWindow *window=[UIApplication sharedApplication].windows.firstObject;
        return window.safeAreaInsets.bottom;
    }

    return 0;
}

/// 顶部状态栏高度(包括安全区)
+(CGFloat)vg_statusBarHeight {
    if(@available(ios 13.0,*)){
        NSSet *set=[UIApplication sharedApplication].connectedScenes;
        UIWindowScene *windowScene = [set anyObject];
        UIStatusBarManager *statusBarManager =windowScene.statusBarManager;
        return statusBarManager.statusBarFrame.size.height;
    } else {
        return [UIApplication sharedApplication].statusBarFrame.size.height;
    }
}

/// 导航栏高度
+(CGFloat)vg_navigationBarHeight {
    return 44.0f;
}

/// 状态栏+导航栏的高度
+(CGFloat)vg_navigationFullHeight {
    return [DeviceInfoTool vg_statusBarHeight] + [DeviceInfoTool vg_navigationBarHeight];
}

/// 底部导航栏高度
+(CGFloat)vg_tabBarHeight{
    return 49.0f;
}

/// 底部导航栏高度(包括安全区)
+(CGFloat)vg_tabBarFullHeight {
    return [DeviceInfoTool vg_tabBarHeight] + [DeviceInfoTool vg_safeDistanceBottom];
}

@end
