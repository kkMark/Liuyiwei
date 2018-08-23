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
    
    // 输入框
    CustomTextField *textField;
    NSArray *titles = @[@"验证旧密码", @"输入新密码", @"确认新密码"];
    NSArray *imgs = @[@"Login_Password", @"Login_Password", @"Login_Password"];
    for (int i = 0; i < titles.count; i++) {
        
        CGRect rect = CGRectMake(20, 30 + (55 * i), ScreenWidth - 40, 45);
        textField = [[CustomTextField alloc] initWithFrame:rect leftImg:imgs[i] isCaptcha:i == 0];
        textField.placeholder = titles[i];
        textField.keyboardType = UIKeyboardTypeASCIICapable;
        [self.view addSubview:textField];
    }
    
    // 类型按钮
    UIButton *typeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    typeBtn.backgroundColor = kMainColor;
    typeBtn.frame = CGRectMake(textField.x, textField.maxY + 30, textField.width, 40);
    typeBtn.layer.cornerRadius = typeBtn.height / 2;
    typeBtn.layer.masksToBounds = YES;
    typeBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [typeBtn setTitle:@"确定修改" forState:UIControlStateNormal];
    [typeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:typeBtn];
}

@end
