//
//  TrainingSelectionView.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/30.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "TrainingSelectionView.h"
#import "TrainingSelectionCell.h"

@interface TrainingSelectionView ()

@property (nonatomic, assign) CGFloat cellHeight;

@end

@implementation TrainingSelectionView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TrainingSelectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[TrainingSelectionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
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
