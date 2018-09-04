//
//  DailyTaskViewController.m
//  Lywsale
//
//  Created by M on 2018/8/28.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "DailyTaskViewController.h"
#import "DailyTaskView.h"

@interface DailyTaskViewController ()

@property (nonatomic, strong) DailyTaskView *dailyTaskView;

@end

@implementation DailyTaskViewController
@synthesize dailyTaskView;

- (void)viewDidLoad {

    [super viewDidLoad];

    self.title = @"日常任务";
    self.dailyTaskView.dataSources = @[@"", @"", @""];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    self.dailyTaskView.height = self.view.height;
}

#pragma mark - lazy
- (DailyTaskView *)dailyTaskView {
    
    if (!dailyTaskView) {
        
        dailyTaskView = [[DailyTaskView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
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

@end
