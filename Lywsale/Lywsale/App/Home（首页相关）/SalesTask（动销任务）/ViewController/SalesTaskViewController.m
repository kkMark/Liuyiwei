//
//  SalesTaskViewController.m
//  Lywsale
//
//  Created by M on 2018/8/28.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "SalesTaskViewController.h"
#import "SalesTaskView.h"

@interface SalesTaskViewController ()

@property (nonatomic, strong) SalesTaskView *salesTaskView;
@property (nonatomic, strong) UIView *headerView;

@end

@implementation SalesTaskViewController
@synthesize salesTaskView;
@synthesize headerView;

- (void)viewDidLoad {

    [super viewDidLoad];

    self.title = @"动销任务";
    self.salesTaskView.dataSources = @[@"", @"", @""];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    self.salesTaskView.y = self.headerView.height;
    self.salesTaskView.height = self.view.height - self.headerView.height;
}

#pragma mark - lazy
- (UIView *)headerView {
    
    if (!headerView) {
        
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 45)];
        headerView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:headerView];
        
        NSArray *titles = @[@"待处理 (10)", @"已完成 (10)", @"已过期 (10)"];
        for (int i = 0; i < 3; i++) {
            
            UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            titleBtn.frame = CGRectMake(ScreenWidth / 3 * i, 0, ScreenWidth / 3, headerView.height);
            titleBtn.titleLabel.font = [UIFont systemFontOfSize:14];
            [titleBtn setTitle:titles[i] forState:UIControlStateNormal];
            [titleBtn setTitleColor:i == 0 ? kMainColor : [UIColor colorWithHexString:@"0x999999"] forState:UIControlStateNormal];
            [headerView addSubview:titleBtn];
        }
        
        UIView *headerLine = [[UIView alloc] initWithFrame:CGRectMake(0, headerView.height - 2, 100, 2)];
        headerLine.backgroundColor = kMainColor;
        headerLine.centerX = ScreenWidth / 3 / 2;
        [headerView addSubview:headerLine];
    }
    
    return headerView;
}

- (SalesTaskView *)salesTaskView {
    
    if (!salesTaskView) {
        
        salesTaskView = [[SalesTaskView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        salesTaskView.backgroundColor = kPageBgColor;
        [self.view addSubview:salesTaskView];
        
        @weakify(self);
        [salesTaskView setGoViewControllerBlock:^(UIViewController *vc) {
            
            @strongify(self);
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }
    
    return salesTaskView;
}

@end
