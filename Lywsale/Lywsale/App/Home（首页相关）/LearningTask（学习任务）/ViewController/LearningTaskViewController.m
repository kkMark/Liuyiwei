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

@end

@implementation LearningTaskViewController
@synthesize learningTaskView;

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
- (LearningTaskView *)learningTaskView {
    
    if (!learningTaskView) {
        
        learningTaskView = [[LearningTaskView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
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
