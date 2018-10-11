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

@property (nonatomic, strong) UIButton *sendCodeBtn;

@end

@implementation BindingMobileViewController
@synthesize sendCodeBtn;

- (void)viewDidLoad {

    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    if (self.title.length == 0) {
        self.title = @"验证原手机";
    }
    
    [self setupSubviews];
}

- (void)setupSubviews {
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 30, ScreenWidth - 60, 0)];
    titleLabel.text = @"您当前已绑定";
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = kMainTextColor;
    titleLabel.height = [titleLabel getTextHeight];
    [self.view addSubview:titleLabel];
    
    // 账号、密码
    NSArray *titles = @[@"请输入账号", @"请输入验证码"];
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(15, titleLabel.maxY + 15, ScreenWidth - 30, 45 * titles.count)];
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
            
            textField.rightView = self.sendCodeBtn;
            textField.rightViewMode = UITextFieldViewModeAlways;
        }
    }
    
    // 登录按钮
    UIButton *retrieveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    retrieveBtn.backgroundColor = kMainColor;
    retrieveBtn.frame = CGRectMake(15, bgView.maxY + 30, ScreenWidth - 30, 45);
    retrieveBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [retrieveBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [retrieveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [retrieveBtn addTarget:self action:@selector(goViewController:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:retrieveBtn];
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

- (void)goViewController:(UIButton *)button {
    
    if ([button.titleLabel.text isEqualToString:@"下一步"]) {
        
        BindingMobileViewController *vc = [BindingMobileViewController new];
        vc.title = @"修改手机";
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
