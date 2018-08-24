//
//  PersonalViewController.m
//  Lywsale
//
//  Created by M on 2018/8/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "PersonalViewController.h"
#import "PersonalView.h"

@interface PersonalViewController ()

@property (nonatomic, strong) PersonalView *personalView;

@end

@implementation PersonalViewController
@synthesize personalView;

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.navigationItem.title = @"个人中心";
    self.personalView.dataSources = @[@"我的足迹", @"我的银行卡", @"我的档案", @"帮助反馈", @"切换为店员", @"更多"];
}

- (PersonalView *)personalView {
    
    if (!personalView) {
        
        personalView = [[PersonalView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.navHeight) style:UITableViewStyleGrouped];
        [self.view addSubview:personalView];
        
        @weakify(self);
        // 前往控制器
        [personalView setGoViewController:^(UIViewController *vc) {
            
            @strongify(self);
            [self.navigationController pushViewController:vc animated:YES];
        }];
        
        // 切换
        [personalView setConversionBlock:^{
           
            @strongify(self);
            [self alertWithTitle:@"温馨提示" msg:@"确定后，由药店模式切换为店员模式" isShowCancel:YES complete:nil];
        }];
    }
    
    return personalView;
}

@end
