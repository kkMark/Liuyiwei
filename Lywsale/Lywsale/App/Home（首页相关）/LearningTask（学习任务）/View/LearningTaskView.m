//
//  LearningTaskView.m
//  Lywsale
//
//  Created by M on 2018/8/28.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "LearningTaskView.h"
#import "LearningTaskCell.h"
#import "LearningTaskDeatailsView.h"

@interface LearningTaskView ()

@property (nonatomic, assign) float cellHeight;

@end

@implementation LearningTaskView

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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    if ([GetUserDefault(UserType) isEqualToString:@"1"]) {
        
        LearningTaskDeatailsView *vc = [[LearningTaskDeatailsView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) title:@"回访标题" data:@[]];
        [[UIApplication sharedApplication].keyWindow addSubview:vc];
    }
}

@end
