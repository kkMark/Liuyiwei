//
//  LoginView.m
//  Lywsale
//
//  Created by M on 2018/8/18.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "LoginView.h"

@interface LoginView ()

@property (nonatomic, copy) NSString *account;
@property (nonatomic, copy) NSString *password;

@property (nonatomic, strong) UIButton *loginBtn;

@end

@implementation LoginView

- (void)setupSubviews {

    int spacing = 0;
    if (ScreenWidth == 320 && ScreenHeight == 480) {
        spacing = 20;
    }
    
    // logo
    UIImage *logoImg = [UIImage imageNamed:@"AppLogo"];
    UIImageView *logoImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.statusBarHeight + 55 - spacing, 0, 0)];
    logoImgView.size = logoImg.size;
    logoImgView.centerX = self.centerX;
    logoImgView.layer.masksToBounds = YES;
    logoImgView.layer.cornerRadius = 5;
    logoImgView.image = logoImg;
    [self addSubview:logoImgView];

    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, logoImgView.maxY + 35, ScreenWidth, 20)];
    titleLabel.text = @"登  录";
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textColor = kMainTextColor;
    [self addSubview:titleLabel];
    
    // 账号、密码
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(15, titleLabel.maxY + 20, ScreenWidth - 30, 90)];
    bgView.layer.borderWidth = 1;
    bgView.layer.borderColor = [UIColor colorWithHexString:@"0xd1d1d1"].CGColor;
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 2;
    [self addSubview:bgView];
    
    NSArray *titles = @[@"请输入账号", @"请输入登录密码"];
    for (int i = 0; i < 2; i++) {

        // 文本框
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 45 * i, bgView.width - 20, 45)];
        textField.font = [UIFont systemFontOfSize:14];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.keyboardType = UIKeyboardTypeASCIICapable;
        textField.placeholder = titles[i];
        textField.tag = i + 100;
        [textField addTarget:self action:@selector(textFieldTextChange:) forControlEvents:UIControlEventEditingChanged];
        [bgView addSubview:textField];
        
        if (i == 1) {
            
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, bgView.width, 1)];
            lineView.centerY = bgView.height / 2;
            lineView.backgroundColor = [UIColor colorWithHexString:@"0xd1d1d1"];
            [bgView addSubview:lineView];
            
            UIButton *passwordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            passwordBtn.frame = CGRectMake(0, 0, 45, 45);
            [passwordBtn setImage:[UIImage imageNamed:@"login_show"] forState:UIControlStateNormal];
            [[passwordBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
                
                passwordBtn.selected = !passwordBtn.selected;
                [passwordBtn setImage:[UIImage imageNamed:passwordBtn.selected ? @"login_hidden" : @"login_show"] forState:UIControlStateNormal];
                
                textField.secureTextEntry = !passwordBtn.selected;
            }];
            
            textField.rightView = passwordBtn;
            textField.rightViewMode = UITextFieldViewModeAlways;
            textField.secureTextEntry = YES;
        }
    }
    
    // 登录按钮
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginBtn.backgroundColor = kMainColor;
    self.loginBtn.frame = CGRectMake(15, bgView.maxY + 30, ScreenWidth - 30, 45);
    self.loginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.loginBtn setTitle:@"登  录" forState:UIControlStateNormal];
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
            
            NSString *vcName = @"RegisteredViewController";
            if (i == 1) {
                vcName = @"RetrieveViewController";
            }
            
            self.goViewController([[UINavigationController alloc] initWithRootViewController:[NSClassFromString(vcName) new]]);
        }];
    }
}

-(void)textFieldTextChange:(UITextField *)sender{
    
    if (sender.tag - 100 == 0) {
        self.account = sender.text;
    }else{
        self.password = sender.text;
    }
    
}

// 点击登录按钮
- (void)loginBtnClick {
    
    if (self.loginBlock) {
        self.loginBlock(self.account, self.password);
    }
}

@end
