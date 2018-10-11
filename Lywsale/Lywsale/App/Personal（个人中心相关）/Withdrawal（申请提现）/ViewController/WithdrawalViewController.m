//
//  WithdrawalViewController.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/9.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "WithdrawalViewController.h"
#import "WithdrawalView.h"

@interface WithdrawalViewController ()

@property (nonatomic, strong) WithdrawalView *withdrawalView;
@property (nonatomic, strong) UIButton *okBtn;

@end

@implementation WithdrawalViewController
@synthesize withdrawalView;
@synthesize okBtn;

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.title = @"申请提现";
    
    [self setupSubviews];
}

- (void)setupSubviews {

    withdrawalView = [[WithdrawalView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 64 - self.okBtn.height) style:UITableViewStyleGrouped];
    [self.view addSubview:withdrawalView];
}

- (UIButton *)okBtn {
    
    if (!okBtn) {
        
        // 确定按钮
        okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        okBtn.backgroundColor = kMainColor;
        okBtn.frame = CGRectMake(0, ScreenHeight - self.navHeight - 40, ScreenWidth, 40);
        okBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [okBtn setTitle:@"确定提现" forState:UIControlStateNormal];
        [okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.view addSubview:okBtn];
        
        @weakify(self);
        [[okBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            
            @strongify(self);
            
        }];
    }
    
    return okBtn;
}

@end
