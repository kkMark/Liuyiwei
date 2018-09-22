//
//  LearningTaskViewController.m
//  Lywsale
//
//  Created by M on 2018/8/28.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "LearningTaskViewController.h"
#import "LearningTaskView.h"

@interface LearningTaskViewController ()

@property (nonatomic, strong) LearningTaskView *learningTaskView;
@property (nonatomic, strong) UIView *headerView;

@end

@implementation LearningTaskViewController
@synthesize learningTaskView;
@synthesize headerView;

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.title = @"学习任务";
    self.learningTaskView.dataSources = @[@"", @"", @""];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    self.learningTaskView.height = self.view.height;
}

#pragma mark - lazy
- (UIView *)headerView {
    
    if (!headerView) {
        
        NSArray *titles = @[@"未学习 (10)", @"已学习 (10)"];
        
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

- (LearningTaskView *)learningTaskView {
    
    if (!learningTaskView) {
        
        learningTaskView = [[LearningTaskView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        learningTaskView.y = self.headerView.maxY;
        learningTaskView.height = ScreenHeight - self.headerView.height - self.navHeight;
        learningTaskView.backgroundColor = kPageBgColor;
        [self.view addSubview:learningTaskView];
        
        @weakify(self);
        [learningTaskView setGoViewControllerBlock:^(UIViewController *vc) {
            
            @strongify(self);
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }
    
    return learningTaskView;
}

@end
