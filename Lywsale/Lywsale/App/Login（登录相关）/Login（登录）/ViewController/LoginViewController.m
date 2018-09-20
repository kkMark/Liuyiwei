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
            
            [[LoginViewModel new] loginWithAccount:account password:password success:^(NSDictionary *dict) {
  
            } failure:^(NSError *error) {
                
            }];
            
        }
    }];
}

@end
