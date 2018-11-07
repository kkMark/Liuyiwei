//
//  LearningTaskViewController.m
//  Lywsale
//
//  Created by M on 2018/8/28.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "LearningTaskViewController.h"
#import "LearningTaskView.h"
#import "LearningTaskViewModel.h"
#import "LearningTaskModel.h"

@interface LearningTaskViewController ()

@property (nonatomic, strong) LearningTaskView *learningTaskView;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, assign) int page;
@property (nonatomic, assign) int type;

@end

@implementation LearningTaskViewController
@synthesize learningTaskView;
@synthesize headerView;

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.title = @"学习任务";
    self.page = 1;
    self.type = 0;
    
    [self request];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
}

#pragma mark - lazy
- (UIView *)headerView {
    
    if (!headerView) {
        
        NSArray *titles = @[@"未学习 (0)", @"已学习 (0)"];
        
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
                
                self.page = 0;
                self.type = i;
                [self request];
                
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
        learningTaskView.height = ScreenHeight - self.headerView.maxY - self.navHeight;
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


#pragma mark - request
- (void)request {
    
    [self getTask];
}

- (void)getCount {
    
    [[LearningTaskViewModel new] getCountWithSuccess:^(NSDictionary *dict) {
        
        NSArray *count = @[dict[@"totalPending"], dict[@"totalStudied"]];
        NSArray *titles = @[@"未学习 (%@)", @"已学习 (%@)"];
        for (int i = 0; i < titles.count; i++) {
            
            NSString *title = [NSString stringWithFormat:titles[i], count[i]];
            UIButton *titleBtn = [self.view viewWithTag:i + 10];
            [titleBtn setTitle:title forState:UIControlStateNormal];
        }
        
    } failure:^(NSError *error) {
        
    }];
}


- (void)getTask {
    
    [[LearningTaskViewModel new] getTask:self.page type:self.type success:^(NSDictionary *dict) {
        
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *tempDict in dict[@"list"]) {
            
            LearningTaskModel *model = [LearningTaskModel new];
            [model setValuesForKeysWithDictionary:tempDict];
            
            model.taskType = self.type;
            [arr addObject:model];
        }
        
        self.learningTaskView.dataSources = arr;
        
        [self getCount];
        
    } failure:^(NSError *error) {
        
    }];
}



@end
