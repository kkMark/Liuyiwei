//
//  PersonalViewController.m
//  Lywsale
//
//  Created by M on 2018/8/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "PersonalViewController.h"
#import "PersonalView.h"
#import "PersonalHeaderView.h"

@interface PersonalViewController ()

@property (nonatomic, strong) PersonalView *personalView;
@property (nonatomic, strong) PersonalHeaderView *headerView;

@end

@implementation PersonalViewController
@synthesize personalView;
@synthesize headerView;

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.navigationItem.title = @"个人中心";
    self.view.backgroundColor = [UIColor whiteColor];
    self.personalView.dataSources = @[@"我的足迹", @"我的银行卡", @"我的档案", @"帮助反馈", @"切换为店员", @"更多"];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    if (self.navigationController.viewControllers.count > 1) {
        [self.navigationController setNavigationBarHidden:NO animated:animated];
    }
}

- (PersonalView *)personalView {
    
    if (!personalView) {
        
        personalView = [[PersonalView alloc] initWithFrame:CGRectMake(0, self.headerView.height, ScreenWidth, ScreenHeight - self.tabBarHeight - self.headerView.height) style:UITableViewStyleGrouped];
        personalView.separatorStyle = UITableViewCellSeparatorStyleNone;
        personalView.backgroundColor = [UIColor whiteColor];
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

- (PersonalHeaderView *)headerView {
    
    if (!headerView) {
        
        headerView = [[PersonalHeaderView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
        headerView.height = headerView.viewHeight;
        [self.view addSubview:headerView];
    }
    
    return headerView;
}

@end
