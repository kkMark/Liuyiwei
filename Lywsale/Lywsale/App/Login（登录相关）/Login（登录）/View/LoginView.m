//
//  LoginView.m
//  Lywsale
//
//  Created by M on 2018/8/18.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "LoginView.h"
#import "CustomTextField.h"
#import "RetrieveOrRegisteredViewController.h"

@interface LoginView ()

@property (nonatomic, copy) NSString *account;
@property (nonatomic, copy) NSString *password;

@property (nonatomic, strong) UIImageView *logoImgView;
@property (nonatomic, strong) UILabel *appNameLabel;
@property (nonatomic, strong) UIButton *loginBtn;

@end

@implementation LoginView

- (void)setupSubviews {
    
    NSLog(@"%.2f", ScreenWidth);
    NSLog(@"%.2f", ScreenHeight);
    
    int spacing = 0;
    if (ScreenWidth == 320 && ScreenHeight == 480) {
        spacing = 20;
    }
    
    // logo
    self.logoImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.statusBarHeight + 50 - spacing, 120, 120)];
    self.logoImgView.centerX = self.centerX;
    self.logoImgView.layer.masksToBounds = YES;
    self.logoImgView.layer.cornerRadius = 5;
    self.logoImgView.image = [UIImage imageNamed:@"AppLogo"];
    [self addSubview:self.logoImgView];
    
    // app名字
    self.appNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.logoImgView.frame) + 20 - spacing, ScreenWidth, 20)];
    self.appNameLabel.text = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
    self.appNameLabel.font = [UIFont boldSystemFontOfSize:16];
    self.appNameLabel.textColor = kMainTextColor;
    self.appNameLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.appNameLabel];
    
    // 账号、密码
    NSArray *titles = @[@"请输入账号", @"请输入密码"];
    NSArray *imgs = @[@"Login_Phone", @"Login_Password"];
    CustomTextField *textField;
    for (int i = 0; i < 2; i++) {
        
        CGRect rect = CGRectMake(35, CGRectGetMaxY(self.appNameLabel.frame) + 60 + 55 * i - spacing, ScreenWidth - 70, 45);
        textField = [[CustomTextField alloc] initWithFrame:rect leftImg:imgs[i] isCaptcha:NO];
        textField.placeholder = titles[i];
        textField.keyboardType = i == 0 ? UIKeyboardTypeNumberPad : UIKeyboardTypeASCIICapable;
        [self addSubview:textField];
    }
    
    // 登录按钮
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginBtn.backgroundColor = kMainColor;
    self.loginBtn.frame = CGRectMake(35, CGRectGetMaxY(textField.frame) + 40 - spacing, ScreenWidth - 70, 40);
    self.loginBtn.layer.cornerRadius = self.loginBtn.height / 2;
    self.loginBtn.layer.masksToBounds = YES;
    self.loginBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.loginBtn];
    
    // 注册、忘记密码
    titles = @[@"注册", @"忘记密码?"];
    float buttonWidth = self.loginBtn.width / 2;
    for (int i = 0; i < 2; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(self.loginBtn.x + buttonWidth * i, CGRectGetMaxY(self.loginBtn.frame) + 20, buttonWidth, 25);
        [self addSubview:button];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, buttonWidth, button.height)];
        titleLabel.text = titles[i];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = i == 0 ? kMainColor : kMainTextColor;
        titleLabel.textAlignment = i == 0 ? NSTextAlignmentLeft : NSTextAlignmentRight;
        [button addSubview:titleLabel];
        [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
           
            RetrieveOrRegisteredViewController *vc = [RetrieveOrRegisteredViewController new];
            vc.isReset = i == 0 ? NO : YES;
            vc.title = i == 0 ? @"快速注册" : @"忘记密码";
            self.goViewController([[UINavigationController alloc] initWithRootViewController:vc]);
        }];
    }
}

// 点击登录按钮
- (void)loginBtnClick {
    
    if (self.loginBlock) {
        self.loginBlock(self.account, self.password);
    }
}

@end
