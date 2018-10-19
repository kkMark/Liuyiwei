//
//  RetrieveViewController.m
//  Lywsale
//
//  Created by M on 2018/9/5.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "RetrieveViewController.h"
#import "RetrieveViewModel.h"

@interface RetrieveViewController ()

/// 验证码
@property (nonatomic, copy) NSString *code;
/// 手机号
@property (nonatomic, copy) NSString *phone;
/// 密码
@property (nonatomic, copy) NSString *password;
/// 确认密码
@property (nonatomic, copy) NSString *confirmPassword;
/// 验证码按钮
@property (nonatomic, strong) UIButton *sendCodeBtn;

@end

@implementation RetrieveViewController
@synthesize sendCodeBtn;

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.title = @"忘记密码";
    
    [self setBackBtn];
    [self setupSubviews];
}

- (void)setupSubviews {

    // 账号、密码
    NSArray *titles = @[@"请输入账号", @"请输入验证码", @"请输入登录密码", @"请输入确认新密码"];
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
        
        [[textField rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
           
            if (i == 0) self.phone = x;
            else if (i == 1) self.code = x;
            else if (i == 2) self.password = x;
            else if (i == 3) self.confirmPassword = x;
        }];
        
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
    
    // 登录按钮
    UIButton *retrieveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    retrieveBtn.backgroundColor = kMainColor;
    retrieveBtn.frame = CGRectMake(15, bgView.maxY + 30, ScreenWidth - 30, 45);
    retrieveBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [retrieveBtn setTitle:@"保  存" forState:UIControlStateNormal];
    [retrieveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [retrieveBtn addTarget:self action:@selector(retrieveBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:retrieveBtn];
}

// 找回密码
- (void)retrieveBtnClick {
    
    NSArray *arr = @[self.phone, self.code, self.password, self.confirmPassword];
    for (int i = 0; i < arr.count; i++) {
        
        if ([arr[i] length] == 0) {
            return [self.view makeToast:@"请将以上信息填写完整"];
        }
    }
    
    if (![self.password isEqualToString:self.confirmPassword]) {
        return [self.view makeToast:@"两次输入的密码不一致"];
    }
    
    [[RetrieveViewModel new] forgetPasswordAccount:self.phone password:self.password code:self.code success:^(NSDictionary *dict) {
        
        [[UIApplication sharedApplication].keyWindow makeToast:@"修改成功，请返回登陆"];
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        
    } failure:^(NSError *error) {
       
        [self.view makeToast:@"找回密码失败，请稍后再试"];
    }];
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
        
        @weakify(self);
        [[sendCodeBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            
            @strongify(self);
            if (self.phone.length > 0) {
                
                [[RetrieveViewModel new] sendCode:self.phone success:^(NSDictionary *dict) {
                    
                    NSLog(@"%@", dict);
                    [self openCountdown];
                    
                } failure:^(NSError *error) {
                    
                    [self.view makeToast:@"获取验证码失败"];
                }];
            }
            else {
                
                [self.view makeToast:@"请输入找回的账号"];
            }
        }];
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
                
                [self.sendCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
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
