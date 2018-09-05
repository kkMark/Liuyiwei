//
//  RegisteredView.m
//  Lywsale
//
//  Created by M on 2018/9/5.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "RegisteredView.h"

@interface RegisteredView ()

@property (nonatomic, strong) UIButton *registeredBtn;
@property (nonatomic, strong) UIButton *sendCodeBtn;

@end

@implementation RegisteredView
@synthesize sendCodeBtn;

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
    titleLabel.text = @"注 册";
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textColor = kMainTextColor;
    [self addSubview:titleLabel];
    
    // 账号、密码
    NSArray *titles = @[@"请输入账号", @"请输入验证码", @"请输入登录密码", @"请输入确认新密码"];
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(15, titleLabel.maxY + 20, ScreenWidth - 30, 45 * titles.count)];
    bgView.layer.borderWidth = 1;
    bgView.layer.borderColor = [UIColor colorWithHexString:@"0xd1d1d1"].CGColor;
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 2;
    [self addSubview:bgView];
    
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
            
            textField.rightView = self.sendCodeBtn;
            textField.rightViewMode = UITextFieldViewModeAlways;
        }
        else if (i == 2) {
            
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
    
    // 注册按钮
    self.registeredBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.registeredBtn.backgroundColor = kMainColor;
    self.registeredBtn.frame = CGRectMake(15, bgView.maxY + 30, ScreenWidth - 30, 45);
    self.registeredBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.registeredBtn setTitle:@"注 册" forState:UIControlStateNormal];
    [self.registeredBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.registeredBtn addTarget:self action:@selector(registeredClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.registeredBtn];
    
    // 服务协议
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:@"点击注册表示同意《六医卫网络服务协议》"];
    [attStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, attStr.length)];
    [attStr addAttribute:NSForegroundColorAttributeName value:kMainColor range:NSMakeRange(8, attStr.length - 8)];
    
    UIButton *agreementBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    agreementBtn.frame = CGRectMake(15, self.registeredBtn.maxY + 15, ScreenWidth - 30, 15);
    [agreementBtn setTitle:@"点击注册表示同意《六医卫网络服务协议》" forState:UIControlStateNormal];
    [agreementBtn setTitleColor:kMainTextColor forState:UIControlStateNormal];
    agreementBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    agreementBtn.titleLabel.attributedText = attStr;
    agreementBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self addSubview:agreementBtn];
    
    [[agreementBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
        UIViewController *vc = [NSClassFromString(@"WebHelpViewController") new];
        vc.title = @"服务协议";
        self.goViewController(vc);
    }];
}

// 点击注册按钮
- (void)registeredClick {
    
    UIViewController *vc = [NSClassFromString(@"AddTypeViewController") new];
    self.goViewController(vc);
}


#pragma mark - lazy
- (UIButton *)sendCodeBtn {
    
    if (!sendCodeBtn) {
        
        sendCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sendCodeBtn.frame = CGRectMake(0, 0, 100, 15);
        sendCodeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [sendCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [sendCodeBtn setTitleColor:kMainColor forState:UIControlStateNormal];
        [sendCodeBtn addTarget:self action:@selector(openCountdown) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return sendCodeBtn;
}

// 开启倒计时效果
- (void)openCountdown {
    
    __block NSInteger time = 59; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(timer, ^{
        
        if (time <= 0) {
            
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.sendCodeBtn setTitle:@"重新发送" forState:UIControlStateNormal];
                self.sendCodeBtn.userInteractionEnabled = YES;
            });
            
        }
        else {
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.sendCodeBtn setTitle:[NSString stringWithFormat:@"重新发送(%.2d)", seconds] forState:UIControlStateNormal];
                self.sendCodeBtn.userInteractionEnabled = NO;
            });
            
            time--;
        }
    });
    
    dispatch_resume(timer);
}

@end
