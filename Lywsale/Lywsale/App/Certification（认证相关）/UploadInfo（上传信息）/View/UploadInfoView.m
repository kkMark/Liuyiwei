//
//  UploadInfoView.m
//  Lywsale
//
//  Created by M on 2018/8/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "UploadInfoView.h"
#import "UploadInfoCell.h"

@interface UploadInfoView ()

@property (nonatomic, assign) float cellHeight;

@end

@implementation UploadInfoView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UploadInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UploadInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, ScreenWidth);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
