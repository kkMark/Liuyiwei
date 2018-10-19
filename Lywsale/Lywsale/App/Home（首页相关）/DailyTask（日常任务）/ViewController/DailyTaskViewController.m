//
//  DailyTaskViewController.m
//  Lywsale
//
//  Created by M on 2018/8/28.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "DailyTaskViewController.h"
#import "DailyTaskViewModel.h"
#import "DailyTaskView.h"

@interface DailyTaskViewController ()

@property (nonatomic, strong) DailyTaskView *dailyTaskView;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, assign) int page;

@end

@implementation DailyTaskViewController
@synthesize dailyTaskView;
@synthesize headerView;

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.title = @"日常任务";
    self.page = 1;
    self.dailyTaskView.dataSources = @[@"", @"", @"", @""];
    
    [self initNavRight];
    [self getDataSource];
}

- (void)initNavRight {
    
    [self addNavRightImage:@"AppSearch" complete:^{
        
    }];
}

#pragma mark - lazy
- (UIView *)headerView {
    
    if (!headerView) {
        
        NSArray *titles = @[@"待处理 (10)", @"已处理 (10)"];
        
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 45)];
        headerView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:headerView];
        
        UIView *headerLine = [[UIView alloc] initWithFrame:CGRectMake(0, headerView.height - 2, 100, 2)];
        headerLine.backgroundColor = kMainColor;
        headerLine.centerX = ScreenWidth / titles.count / 2;
        [headerView addSubview:headerLine];
        
        for (int i = 0; i < titles.count; i++) {
            
            UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            titleBtn.tag = i + 10;
            titleBtn.selected = i == 0 ? YES : NO;
            titleBtn.frame = CGRectMake(ScreenWidth / titles.count * i, 0, ScreenWidth / titles.count, headerView.height);
            titleBtn.titleLabel.font = [UIFont systemFontOfSize:14];
            [titleBtn setTitle:titles[i] forState:UIControlStateNormal];
            [titleBtn setTitleColor:[UIColor colorWithHexString:@"0x999999"] forState:UIControlStateNormal];
            [titleBtn setTitleColor:kMainColor forState:UIControlStateSelected];
            [headerView addSubview:titleBtn];
            
            [[titleBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
                
                [UIView animateWithDuration:0.25 animations:^{
                    
                    for (int index = 0; index < titles.count; index++) {
                        
                        UIButton *tempBtn = [self.view viewWithTag:index + 10];
                        if (index == i) tempBtn.selected = YES;
                        else tempBtn.selected = NO;
                    }
                    
                    headerLine.centerX = titleBtn.centerX;
                }];
            }];
        }
    }
    
    return headerView;
}

- (DailyTaskView *)dailyTaskView {
    
    if (!dailyTaskView) {
        
        dailyTaskView = [[DailyTaskView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        dailyTaskView.y = self.headerView.height;
        dailyTaskView.height = self.view.height - self.headerView.height - self.navHeight;
        dailyTaskView.backgroundColor = kPageBgColor;
        [self.view addSubview:dailyTaskView];
        
        @weakify(self);
        [dailyTaskView setGoViewControllerBlock:^(UIViewController *vc) {
            
            @strongify(self);
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }
    
    return dailyTaskView;
}

- (void)getDataSource {
    
    [[DailyTaskViewModel new] getDailyTask:self.page type:@"1" success:^(NSDictionary *dict) {
        
        
    } failure:^(NSError *error) {
        
    }];
}

@end
