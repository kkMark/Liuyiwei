//
//  FootprintView.m
//  Lywsale
//
//  Created by M on 2018/8/25.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "FootprintView.h"
#import "StatisticsTimeCell.h"
#import "StatisticsTaskCell.h"

@interface FootprintView ()

@property (nonatomic, assign) CGFloat dongxiaoHeight;
@property (nonatomic, assign) CGFloat dailyHeight;
@property (nonatomic, assign) CGFloat learningHeight;

@end

@implementation FootprintView

#pragma mark - set
- (void)setCurrentIndex:(NSInteger)currentIndex {
    
    _currentIndex = currentIndex;
    [self reloadData];
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 15)];
    }
    
    return self;
}


#pragma mark - tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        StatisticsTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StatisticsTimeCell"];
        if (cell == nil) {
            cell = [[StatisticsTimeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"StatisticsTimeCell"];
            cell.backgroundColor = self.backgroundColor;
        }
        
        return cell;
    }
    else {
        
        NSString *cellIdentifier = [NSString stringWithFormat:@"task_%zd", indexPath.section];
        StatisticsTaskCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            
            cell = [[StatisticsTaskCell alloc] initWithTask:indexPath.section - 1 reuseIdentifier:cellIdentifier];
            cell.backgroundColor = self.backgroundColor;
            
            NSArray *values = @[@"dongxiaoHeight", @"dailyHeight", @"learningHeight"];
            [self setValue:@(cell.cellHeight) forKey:values[indexPath.section - 1]];
        }
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 90;
    }
    else if (indexPath.section == 1) {
        return self.dongxiaoHeight;
    }
    else if (indexPath.section == 2) {
        return self.dailyHeight;
    }
    else {
        return self.learningHeight;
    }
    
    return 80;
}

@end
