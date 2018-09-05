//
//  BaseViewController.m
//  GanLuXiangBan
//
//  Created by M on 2018/4/30.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BaseViewController.h"
#import <MBProgressHUD.h>

@interface BaseViewController () <UIActionSheetDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIActionSheet *sheet;
@property (nonatomic, strong) MBProgressHUD *hud;

@end

@implementation BaseViewController
@synthesize hud;

- (void)viewDidLoad {

    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavigationItem];
    
    // 导航栏高度
    self.navBarHeight = self.navigationController.navigationBar.frame.size.height;
    // 状态栏高度
    self.statusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    // 导航总高度
    self.navHeight = self.navBarHeight + self.statusBarHeight;
    // tabBar高度
    self.tabBarHeight = self.tabBarController.tabBar.frame.size.height;
    
    if (self.navigationController.viewControllers.count != 1) {
        [self setBackBtn];
    }
}

// 设置返回按钮
- (void)setBackBtn {
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 30, 30);
    [backBtn setImage:[UIImage imageNamed:@"back_one"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = left;
}

- (void)backClick {
    
    if (self.navigationController.viewControllers.count == 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 状态栏
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


#pragma mark - 导航
- (void)setNavigationItem {
    
    self.navigationController.navigationBar.barTintColor = kMainColor;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont boldSystemFontOfSize:18]};
}

- (void)addNavRightTitle:(NSString *)titleString complete:(void (^)())complete {
    
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.frame = CGRectMake(0, 0, 45, 45);
    saveBtn.backgroundColor = kMainColor;
    saveBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [saveBtn setTitle:titleString forState:UIControlStateNormal];
    [saveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[saveBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
        if (complete) {
            complete();
        }
    }];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:saveBtn];
}

#pragma mark - 提示框
- (void)alertWithTitle:(NSString *)title msg:(NSString *)msg isShowCancel:(BOOL)isShowCancel complete:(void (^)())complete {
    
    dispatch_async(dispatch_get_main_queue(), ^{
    
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
        {
            if (complete) {
                complete();
            }
        }];
        [alertController addAction:action];
        
        if (isShowCancel) {
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:cancelAction];
        }
        
        [self presentViewController:alertController animated:YES completion:nil];
    });
}

#pragma mark - ActionSheet
- (void)actionSheetWithTitle:(NSString *)title titles:(NSArray *)titles isCan:(BOOL)isCan completeBlock:(ActionSheetCompleteBlock)actionSheetComplete {
    
    dispatch_async(dispatch_get_main_queue(), ^{
    
        self.complete = actionSheetComplete;
        self.sheet = [[UIActionSheet alloc] initWithTitle:title delegate:self cancelButtonTitle:isCan ? @"取消" : nil destructiveButtonTitle:nil otherButtonTitles:nil];
        self.sheet.actionSheetStyle = UIActionSheetStyleDefault;
        
        for (int i = 0; i < titles.count; i++) {
            [self.sheet addButtonWithTitle:titles[i]];
        }
        
        [self.sheet showInView:self.view];
    });
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (self.complete) {
        self.complete(buttonIndex);
    }
    
    [self.sheet dismissWithClickedButtonIndex:0 animated:YES];
}

- (void)showHudAnimated:(BOOL)animated {
    
    @weakify(self);
    dispatch_async(dispatch_get_main_queue(), ^{
     
        @strongify(self);
        if (self.hud && self.hud.superview == self.view) {
            return;
        }
        
        self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:animated];
        self.hud.label.text = @"正在加载中";
    });
    
}

- (void)hideHudAnimated
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
}

@end
