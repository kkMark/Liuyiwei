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

@end

@implementation LearningTaskView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 15)];
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
