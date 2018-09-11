//
//  MaintenanceView.m
//  Lywsale
//
//  Created by M on 2018/9/11.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "MaintenanceView.h"
#import "MaintenanceCell.h"

@interface MaintenanceView ()

@property (nonatomic, assign) float cellHeight;

@end

@implementation MaintenanceView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MaintenanceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MaintenanceCell"];
    if (cell == nil) {
        cell = [[MaintenanceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MaintenanceCell"];
    }
    
    self.cellHeight = cell.cellHeight;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellHeight;
}

@end
