//
//  FootprintView.m
//  Lywsale
//
//  Created by M on 2018/8/25.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "FootprintView.h"
#import "FootprintCell.h"
#import "FootprintCourseCell.h"
#import "StatisticsTimeCell.h"

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
        else if (indexPath.section == 1) {
            
            
        }
        else if (indexPath.section == 2) {
            
            
        }
        else if (indexPath.section == 3) {
            
            
        }
    }
    
    FootprintCourseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FootprintCourseCell"];
    if (cell == nil) {
        cell = [[FootprintCourseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FootprintCourseCell"];
    }
    
    cell.isCollect = self.currentIndex == 1 ? NO : YES;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 45;
    }
    
    return 100;
}

@end
