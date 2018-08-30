//
//  LearningTaskView.m
//  Lywsale
//
//  Created by M on 2018/8/28.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "LearningTaskView.h"
#import "LearningTaskCell.h"

@interface LearningTaskView ()

@property (nonatomic, assign) float cellHeight;
@property (nonatomic, strong) UIView *taskTypeView;

@end

@implementation LearningTaskView
@synthesize taskTypeView;

- (UIView *)taskTypeView {
    
    if (!taskTypeView) {
        
        taskTypeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 45)];
        taskTypeView.backgroundColor = kPageBgColor;
        
        UIButton *lookBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        lookBtn.frame = CGRectMake(0, 0, 0, taskTypeView.height);
        lookBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [lookBtn setTitle:@"查看所有学习任务" forState:UIControlStateNormal];
        [lookBtn setTitleColor:kMainColor forState:UIControlStateNormal];
        lookBtn.width = [lookBtn.titleLabel getTextWidth];
        lookBtn.x = taskTypeView.width - lookBtn.width - 20;
        [taskTypeView addSubview:lookBtn];
        
        [[lookBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            
            if (self.goViewControllerBlock) {
                
                UIViewController *vc = [NSClassFromString(@"LearningTaskViewController") new];
                vc.hidesBottomBarWhenPushed = YES;
                [vc setValue:[NSNumber numberWithBool:YES] forKey:@"isLookAll"];
                self.goViewControllerBlock(vc);
            }
        }];
    }
    
    return taskTypeView;
}

- (void)setIsLookAll:(BOOL)isLookAll {
    
    _isLookAll = isLookAll;
    if (isLookAll) {
        self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 20)];
    }
}


#pragma mark - tableview
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.tableHeaderView = self.taskTypeView;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSources.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LearningTaskCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LearningTaskCell"];
    if (cell == nil) {
        cell = [[LearningTaskCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LearningTaskCell"];
        cell.backgroundColor = self.backgroundColor;
    }
    
    self.cellHeight = cell.cellHeight;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellHeight;
}

@end
