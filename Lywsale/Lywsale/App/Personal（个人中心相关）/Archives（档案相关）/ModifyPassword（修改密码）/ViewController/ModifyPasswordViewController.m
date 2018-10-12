//
//  ModifyPasswordViewController.m
//  Lywsale
//
//  Created by M on 2018/8/23.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "ModifyPasswordViewController.h"
#import "CustomTextField.h"

@interface ModifyPasswordViewController ()

@end

@implementation ModifyPasswordViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"修改密码";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupSubviews];
}

- (void)setupSubviews {
    
    // 账号、密码
    NSArray *titles = @[@"验证旧密码", @"输入新密码", @"请输入确认新密码"];
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(15, 30, ScreenWidth - 30, 45 * titles.count)];
    bgView.layer.borderWidth = 1;
    bgView.layer.borderColor = [UIColor colorWithHexString:@"0xd1d1d1"].CGColor;
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 2;
    [self.view addSubview:bgView];
    
    for (int i = 0; i < titles.count; i++) {
        
        // 文本框
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 45 * i, bgView.width - 20, 45)];
        textField.font = [UIFont systemFontOfSize:14];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.keyboardType = UIKeyboardTypeASCIICapable;
        textField.placeholder = titles[i];
        textField.secureTextEntry = i > 0 ? YES : NO;
        [bgView addSubview:textField];
        
        if (i != 0) {
            
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 45 * i, bgView.width, 1)];
            lineView.backgroundColor = [UIColor colorWithHexString:@"0xd1d1d1"];
            [bgView addSubview:lineView];
        }
        
        if (i == 1) {
            
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
        }
    }
    
    // 保存按钮
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.backgroundColor = kMainColor;
    saveBtn.frame = CGRectMake(15, bgView.maxY + 30, ScreenWidth - 30, 45);
    saveBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [saveBtn setTitle:@"保  存" forState:UIControlStateNormal];
    [saveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(saveBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveBtn];
}

// 保存新密码
- (void)saveBtnClick {
    
    
}

@end
