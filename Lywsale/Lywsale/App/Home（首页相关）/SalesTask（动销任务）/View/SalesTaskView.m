//
//  SalesTaskView.m
//  Lywsale
//
//  Created by M on 2018/8/28.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "SalesTaskView.h"
#import "SalesTaskCell.h"
@interface SalesTaskView ()

@property (nonatomic, assign) float cellHeight;
@property (nonatomic, strong) UIView *taskTypeView;

@end

@implementation SalesTaskView
@synthesize taskTypeView;

- (UIView *)taskTypeView {
    
    if (!taskTypeView) {
        
        taskTypeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 45)];
        taskTypeView.backgroundColor = kPageBgColor;
        
        UIButton *lookBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        lookBtn.frame = CGRectMake(0, 0, 0, taskTypeView.height);
        lookBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [lookBtn setTitle:@"查看所有动销任务" forState:UIControlStateNormal];
        [lookBtn setTitleColor:kMainColor forState:UIControlStateNormal];
        lookBtn.width = [lookBtn.titleLabel getTextWidth];
        lookBtn.x = taskTypeView.width - lookBtn.width - 20;
        [taskTypeView addSubview:lookBtn];
        
        [[lookBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            
            if (self.goViewControllerBlock) {
                
                UIViewController *vc = [NSClassFromString(@"SalesTaskViewController") new];
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
    
    SalesTaskCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SalesTaskCell"];
    if (cell == nil) {
        cell = [[SalesTaskCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SalesTaskCell"];
        cell.backgroundColor = self.backgroundColor;
    }
    
    self.cellHeight = cell.cellHeight;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellHeight;
}

@end
