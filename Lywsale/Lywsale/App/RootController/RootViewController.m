//
//  RootViewController.m
//  MizheDemo
//
//  Created by Kai on 15/6/25.
//  Copyright (c) 2015年 Kai. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self initViewController];
    
    self.tabBar.translucent = NO;
    self.tabBar.tintColor = kMainColor;
}

#pragma mark - 初始化
- (void)initViewController {
    
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];

    // 控制器名字
    NSArray *viewControllerNames = @[@"LoginViewController", @"LoginViewController", @"LoginViewController", @"PersonalViewController"];
    
    // 标题
    NSArray *titles = @[@"主页", @"工作", @"知识", @"我的"];
    
    // 图标
    NSArray *imgs = @[@"", @"", @"", @""];
    
    // 选中图片
    NSArray *selectImgs = @[@"", @"", @"", @""];
    
    for (int i = 0; i < viewControllerNames.count; i++) {
        
        UINavigationController *nav = [self NavigationControllerWithControllerName:viewControllerNames[i]];
        nav.tabBarItem.image = [[UIImage imageNamed:imgs[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectImgs[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        nav.tabBarItem.title = titles[i];
        [viewControllers addObject:nav];
    }
    
    self.viewControllers = viewControllers;
}

// 创建导航控制器
- (UINavigationController *)NavigationControllerWithControllerName:(NSString *)controllerName {
    
    Class cls = NSClassFromString(controllerName);
    
    UIViewController *vc = [[cls alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.navigationBar.translucent = NO;
    return nav;
    
}

@end
