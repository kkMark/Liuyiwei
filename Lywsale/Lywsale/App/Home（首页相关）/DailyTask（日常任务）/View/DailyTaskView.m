//
//  DailyTaskView.m
//  Lywsale
//
//  Created by M on 2018/8/28.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "DailyTaskView.h"
#import "DailyTaskCell.h"
#import "DailyTaskManagerCell.h"
#import "ReceptionViewController.h"
#import "DailyTaskManagerDetailsView.h"

@interface DailyTaskView ()

@property (nonatomic, assign) float cellHeight;

@end

@implementation DailyTaskView

#pragma mark - tableview
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 20)];
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
    
    // 店长
    if ([GetUserDefault(UserType) isEqualToString:@"1"]) {
        
        DailyTaskManagerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DailyTaskManagerCell"];
        if (cell == nil) {
            cell = [[DailyTaskManagerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DailyTaskManagerCell"];
            cell.backgroundColor = self.backgroundColor;
        }
        
        self.cellHeight = cell.cellHeight;
        return cell;

    }
    // 店员
    else {
        
        DailyTaskCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DailyTaskCell"];
        if (cell == nil) {
            cell = [[DailyTaskCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DailyTaskCell"];
            cell.backgroundColor = self.backgroundColor;
        }
        
        self.cellHeight = cell.cellHeight;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    if ([GetUserDefault(UserType) isEqualToString:@"1"]) {
        
        DailyTaskManagerDetailsView *vc = [[DailyTaskManagerDetailsView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) title:@"回访标题" data:@[]];
        [[UIApplication sharedApplication].keyWindow addSubview:vc];
    }
    else {
        
        if (self.goViewControllerBlock) {
            
            ReceptionViewController *vc = [ReceptionViewController new];
            self.goViewControllerBlock(vc);
        }
    }
}

@end
