//
//  RegisteredViewController.m
//  Lywsale
//
//  Created by M on 2018/9/5.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "RegisteredViewController.h"
#import "RegisteredView.h"

@interface RegisteredViewController ()

@property (nonatomic, strong) RegisteredView *registeredView;

@end

@implementation RegisteredViewController

- (void)viewDidLoad {
 
    [super viewDidLoad];
    [self initRegisteredView];
    [self setBackBtn];
}

// 设置返回按钮
- (void)setBackBtn {
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, self.statusBarHeight, 44, 44);
    [backBtn setImage:[UIImage imageNamed:@"back_nor"] forState:UIControlStateNormal];
    [[backBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [self.view addSubview:backBtn];
}

- (void)initRegisteredView {
    
    self.registeredView = [[RegisteredView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.registeredView];
    
    @weakify(self);
    [self.registeredView setGoViewController:^(UIViewController *vc) {
       
        @strongify(self);
        [self.navigationController pushViewController:vc animated:YES];
    }];
}

@end
