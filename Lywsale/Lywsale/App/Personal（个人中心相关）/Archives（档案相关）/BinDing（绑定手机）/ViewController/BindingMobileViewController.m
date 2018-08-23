//
//  BindingMobileViewController.m
//  Lywsale
//
//  Created by M on 2018/8/23.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BindingMobileViewController.h"
#import "CustomTextField.h"

@interface BindingMobileViewController ()

@end

@implementation BindingMobileViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    if (self.title.length == 0) {
        self.title = @"验证原手机";
    }
    
    [self setupSubviews];
}

- (void)setupSubviews {
    
    // 间距
    int spacing = 20;
    
    // 是否下一步
    BOOL isNext = [self.title isEqualToString:@"验证原手机"];
    
    // 标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(spacing, spacing, ScreenWidth - spacing * 2, 30)];
    titleLabel.text = isNext ? @"您当前已绑定" : @"输入新手机号码进行绑定";
    titleLabel.font = [UIFont boldSystemFontOfSize:16];
    titleLabel.textColor = kMainTextColor;
    titleLabel.numberOfLines = 0;
    [self.view addSubview:titleLabel];

    // 输入框
    CustomTextField *textField;
    NSArray *titles = @[@"请输入手机号码", @"请输入验证码"];
    NSArray *imgs = @[@"Login_Phone", @"Login_Password"];
    for (int i = 0; i < titles.count; i++) {
        
        CGRect rect = CGRectMake(spacing, (titleLabel.maxY + 5) + (55 * i), ScreenWidth - spacing * 2, 45);
        textField = [[CustomTextField alloc] initWithFrame:rect leftImg:imgs[i] isCaptcha:i == 0];
        textField.placeholder = titles[i];
        textField.keyboardType = i < 2 ? UIKeyboardTypeNumberPad : UIKeyboardTypeASCIICapable;
        [self.view addSubview:textField];
        
        if (i == 0 && isNext) {
            textField.textField.text = @"13800138000";
            textField.textField.enabled = NO;
        }
    }
    
    // 类型按钮
    UIButton *typeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    typeBtn.backgroundColor = kMainColor;
    typeBtn.frame = CGRectMake(textField.x, textField.maxY + 30, textField.width, 40);
    typeBtn.layer.cornerRadius = typeBtn.height / 2;
    typeBtn.layer.masksToBounds = YES;
    typeBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [typeBtn setTitle:isNext ? @"下一步" : @"绑定" forState:UIControlStateNormal];
    [typeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [typeBtn addTarget:self action:@selector(goViewController:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:typeBtn];
}

- (void)goViewController:(UIButton *)button {
    
    if ([button.titleLabel.text isEqualToString:@"下一步"]) {
        
        BindingMobileViewController *vc = [BindingMobileViewController new];
        vc.title = @"修改手机";
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
