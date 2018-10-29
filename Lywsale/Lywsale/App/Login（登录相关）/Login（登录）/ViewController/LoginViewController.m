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
        if (account.length == 0) {
            return [self.view makeToast:@"请输入账号"];
        }
        
        if (![self isPhoneNum:account]) {
            return [self.view makeToast:@"手机号错误，请输入正确的手机号码"];
        }
        
        if (password.length == 0) {
            return [self.view makeToast:@"请输入密码"];
        }
        
        [[LoginViewModel new] loginWithAccount:account password:password success:^(NSDictionary *dict) {
            
            if (dict != nil && ![dict isEqual:[NSNull null]]) {
                
                SetUserDefault(Account, account);
                SetUserDefault(UserName, dict[@"memberName"]);
                SetUserDefault(UserID, dict[@"memberId"]);
                SetUserDefault(Token_Type, dict[@"tokenMsg"][@"token_type"]);
                SetUserDefault(Access_Token, dict[@"tokenMsg"][@"access_token"]);
                SetUserDefault(Refresh_Token, dict[@"tokenMsg"][@"refresh_token"]);
                
                if ([dict[@"type"] isEqualToString:@"6"]) {
                    SetUserDefault(UserType, @"1");
                }
                else SetUserDefault(UserType, @"0");
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

- (BOOL)isPhoneNum:(NSString *)number {
    
    NSString *mobile = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0678])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobile];
    return [regextestmobile evaluateWithObject:number];
}

@end
