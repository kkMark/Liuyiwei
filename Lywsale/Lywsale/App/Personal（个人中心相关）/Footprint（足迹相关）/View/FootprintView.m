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

@implementation FootprintView

#pragma mark - set
- (void)setCurrentIndex:(NSInteger)currentIndex {
    
    _currentIndex = currentIndex;
    [self reloadData];
}


#pragma mark - tableview
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.currentIndex == 0) {
        
        FootprintCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FootprintCell"];
        if (cell == nil) {
            cell = [[FootprintCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FootprintCell"];
        }
        
        return cell;
    }
    
    FootprintCourseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FootprintCourseCell"];
    if (cell == nil) {
        cell = [[FootprintCourseCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FootprintCourseCell"];
    }
    
    cell.isCollect = self.currentIndex == 1 ? NO : YES;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

@end
