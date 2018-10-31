
//
//  TrainingEvaluationView.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/31.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "TrainingEvaluationView.h"
#import "TrainingEvaluationCell.h"
#import "TrainingEvaluationHeaderView.h"

@interface TrainingEvaluationView ()

@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, strong) TrainingEvaluationHeaderView *headerView;

@end

@implementation TrainingEvaluationView
@synthesize headerView;

#pragma mark - lazy
- (TrainingEvaluationHeaderView *)headerView {
    
    if (!headerView) {
        
        headerView = [[TrainingEvaluationHeaderView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
    }
    
    return headerView;
}

#pragma mark - tableview
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.tableHeaderView = self.headerView;
    }
    
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TrainingEvaluationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[TrainingEvaluationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    self.cellHeight = cell.cellHeight;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

@end
