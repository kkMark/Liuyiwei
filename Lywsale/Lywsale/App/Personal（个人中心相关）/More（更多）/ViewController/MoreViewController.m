//
//  MoreViewController.m
//  Lywsale
//
//  Created by M on 2018/8/24.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "MoreViewController.h"
#import "LoginViewController.h"
#import "MoreView.h"

@interface MoreViewController ()

@property (nonatomic, strong) MoreView *moreView;
@property (nonatomic, strong) UIButton *exitBtn;

@end

@implementation MoreViewController
@synthesize moreView;
@synthesize exitBtn;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"设置";
    self.moreView.dataSources = @[@"关于我们", @"本站声明"];
}

#pragma mark - lazy
- (MoreView *)moreView {
    
    if (!moreView) {
        
        moreView = [[MoreView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.navHeight - self.exitBtn.height) style:UITableViewStyleGrouped];
        [self.view addSubview:moreView];
        
        @weakify(self);
        [moreView setGoViewController:^(UIViewController *vc) {
            
            @strongify(self);
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }
    
    return moreView;
}

- (UIButton *)exitBtn {
    
    if (!exitBtn) {
        
        exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        exitBtn.backgroundColor = kMainColor;
        exitBtn.frame = CGRectMake(0, ScreenHeight - self.navHeight - 45, ScreenWidth, 45);
        exitBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [exitBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [exitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.view addSubview:exitBtn];
        
        @weakify(self);
        [[exitBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
           
            @strongify(self);
            [self alertWithTitle:@"温馨提示" msg:@"确定要退出吗？" isShowCancel:YES complete:^{
                
                [self clearUserDefaultsData];
                [self logOut];
            }];
        }];
    }
    
    return exitBtn;
}

- (void)logOut {
    
    if ([self.presentingViewController isKindOfClass:[LoginViewController class]]) {
        [self.tabBarController dismissViewControllerAnimated:YES completion:nil];
    }
    else {
        
        LoginViewController *loginVC = [LoginViewController new];
        [self presentViewController:loginVC animated:YES completion:^{
            
            if (self.navigationController.viewControllers.count > 1) {
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }];
    }
}

- (void)clearUserDefaultsData {
    
    NSString *account = GetUserDefault(Account);
    
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    
    SetUserDefault(Account, account);
}

@end
