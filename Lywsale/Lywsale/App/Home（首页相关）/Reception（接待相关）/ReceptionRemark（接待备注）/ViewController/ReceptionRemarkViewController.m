//
//  ReceptionRemarkViewController.m
//  Lywsale
//
//  Created by M on 2018/9/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "ReceptionRemarkViewController.h"
#import "ReceptionRemarkView.h"

@interface ReceptionRemarkViewController ()

@property (nonatomic, strong) ReceptionRemarkView *remarkView;

@end

@implementation ReceptionRemarkViewController
@synthesize remarkView;

- (void)viewDidLoad {

    [super viewDidLoad];

    [self setTitle:@"接待备注"];
    [self okBtn];
}

- (ReceptionRemarkView *)remarkView {
    
    if (!remarkView) {
        
        remarkView = [[ReceptionRemarkView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        remarkView.height = ScreenHeight - self.navHeight - 45;
        remarkView.dataSources = @[@"接待状态", @"未成交原因", @"接待备注"];
        [self.view addSubview:remarkView];
    }
    
    return remarkView;
}

- (void)okBtn {
    
    UIButton *okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    okBtn.backgroundColor = kMainColor;
    okBtn.frame = CGRectMake(0, self.remarkView.maxY, ScreenWidth, 45);
    okBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [okBtn setTitle:@"确  定" forState:UIControlStateNormal];
    [okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[okBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
    }];
    [self.view addSubview:okBtn];
}

@end
