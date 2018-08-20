//
//  RetrieveOrRegisteredViewController.m
//  Lywsale
//
//  Created by M on 2018/8/18.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "RetrieveOrRegisteredViewController.h"
#import "AddTypeViewController.h"
#import "CustomTextField.h"

@interface RetrieveOrRegisteredViewController ()

@end

@implementation RetrieveOrRegisteredViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    [self setBackBtn];
    [self setupSubviews];
    
}

- (void)setupSubviews {
    
    NSArray *titles = @[@"请输入手机号", @"请输入验证码", @"请输入密码", @"请再次输入密码"];
    NSArray *imgs = @[@"Login_Phone", @"Login_Password", @"Login_Password", @"Login_Password"];
    
    if (self.isReset) {
        
        titles = @[@"请输入手机号", @"请输入验证码", @"请输入新密码"];
        imgs = @[@"Login_Phone", @"Login_Password", @"Login_Password"];
    }
    
    // 输入框
    CustomTextField *textField;
    for (int i = 0; i < titles.count; i++) {
        
        CGRect rect = CGRectMake(35, 30 + 55 * i, ScreenWidth - 70, 45);
        textField = [[CustomTextField alloc] initWithFrame:rect leftImg:imgs[i] isCaptcha:i == 0];
        textField.placeholder = titles[i];
        textField.keyboardType = i < 2 ? UIKeyboardTypeNumberPad : UIKeyboardTypeASCIICapable;
        [self.view addSubview:textField];
    }
    
    // 确定按钮
    UIButton *okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    okBtn.backgroundColor = kMainColor;
    okBtn.frame = CGRectMake(35, 0, ScreenWidth - 70, 40);
    okBtn.y = ScreenHeight - self.navHeight - self.statusBarHeight - okBtn.height - 40;
    okBtn.layer.cornerRadius = okBtn.height / 2;
    okBtn.layer.masksToBounds = YES;
    okBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [okBtn setTitle:self.isReset ? @"确定" : @"注册" forState:UIControlStateNormal];
    [okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [okBtn addTarget:self action:@selector(goViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:okBtn];
    
    // 服务协议
    
}

- (void)goViewController {
    
    if (self.isReset) {
        
        
    }
    else {
        
        AddTypeViewController *viewController = [AddTypeViewController new];
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

@end
