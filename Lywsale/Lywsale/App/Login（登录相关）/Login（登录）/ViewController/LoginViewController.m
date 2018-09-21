//
//  LoginViewController.m
//  Lywsale
//
//  Created by M on 2018/8/18.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "LoginViewController.h"
#import "RootViewController.h"
#import "LoginView.h"
#import "LoginViewModel.h"

@interface LoginViewController ()

@property (nonatomic, strong) LoginView *loginView;

@end

@implementation LoginViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    [self initLoginView];
}

- (void)initLoginView {
    
    self.loginView = [[LoginView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:self.loginView];

    @weakify(self);
    [self.loginView setGoViewController:^(UIViewController *vc) {
        
        @strongify(self);
        [self presentViewController:vc animated:YES completion:nil];
    }];
    
    [self.loginView setLoginBlock:^(NSString *account, NSString *password) {
    
        @strongify(self);
        if ([self.presentingViewController isKindOfClass:[RootViewController class]]) {
            
            RootViewController *tabbarVC = (RootViewController *)self.presentingViewController;
            tabbarVC.selectedIndex = 0;
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else {
            
            RootViewController *tabbarVC = [RootViewController new];
            [self presentViewController:tabbarVC animated:YES completion:nil];
        }
                
        if (account.length == 0) {
            return [self.view makeToast:@"请输入账号"];
        }
        
        if (password.length == 0) {
            return [self.view makeToast:@"请输入密码"];
        }
        
        [[LoginViewModel new] loginWithAccount:account password:password success:^(NSDictionary *dict) {
            
            if (dict != nil && ![dict isEqual:[NSNull null]]) {
                
                SetUserDefault(UserName, dict [@"memberName"]);
                SetUserDefault(UserID, dict[@"memberId"]);
                SetUserDefault(Token_Type, dict[@"tokenMsg"][@"token_type"]);
                SetUserDefault(Access_Token, dict[@"tokenMsg"][@"access_token"]);
                SetUserDefault(Refresh_Token, dict[@"tokenMsg"][@"refresh_token"]);
            }
            
            if ([self.presentingViewController isKindOfClass:[RootViewController class]]) {
                
                RootViewController *tabbarVC = (RootViewController *)self.presentingViewController;
                tabbarVC.selectedIndex = 0;
                [self dismissViewControllerAnimated:YES completion:nil];
            }
            else {
                
                RootViewController *tabbarVC = [RootViewController new];
                [self presentViewController:tabbarVC animated:YES completion:nil];
            }
            
        } failure:^(NSError *error) {
            
            
        }];
    }];
}

@end
