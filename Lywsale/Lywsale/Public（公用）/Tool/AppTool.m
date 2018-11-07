//
//  AppTool.m
//  DingBell
//
//  Created by M on 2018/6/8.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "AppTool.h"

@implementation AppTool

/** 获取当前控制器 */
+ (UIViewController *)getCurrentViewController {
    
    UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1) {

        // 判断是否跳转过去的
        if (viewController.presentedViewController) {
            viewController = viewController.presentedViewController;
        }
        else break;
    }
    
    while ([viewController isKindOfClass:[UITabBarController class]] ||
           [viewController isKindOfClass:[UINavigationController class]])
    {
        // 判断是否tabBar
        if ([viewController isKindOfClass:[UITabBarController class]]) {
            viewController = ((UITabBarController *)viewController).selectedViewController;
        }
        
        // 判断是否导航
        if ([viewController isKindOfClass:[UINavigationController class]]) {
            viewController = ((UINavigationController *)viewController).visibleViewController;
        }
        
        // 判断是否跳转过去的
        if (viewController.presentedViewController) {
            viewController = viewController.presentedViewController;
        }
    }
    
    return viewController;
}


@end
