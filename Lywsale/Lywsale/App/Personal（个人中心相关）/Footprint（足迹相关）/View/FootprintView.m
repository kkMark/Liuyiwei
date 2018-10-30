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
#import "FootprintCell.h"

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
        self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 10)];
    }
    
    return self;
}


#pragma mark - tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (self.currentIndex == 0) {
        return 4;
    }
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.currentIndex == 0) {
        return 1;
    }
    
    return self.dataSources.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.currentIndex == 0) {
        
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
    else {
        
        FootprintCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FootprintCell"];
        if (cell == nil) {
            cell = [[FootprintCell alloc] initWithReuseIdentifier:@"FootprintCell"];
        }
        
        if (self.currentIndex == 1) {
            cell.statusBtn.hidden = NO;
        }
        else cell.statusBtn.hidden = YES;
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.currentIndex == 0) {
        
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
    }
    else {
        
        return 125;
    }
}

@end
