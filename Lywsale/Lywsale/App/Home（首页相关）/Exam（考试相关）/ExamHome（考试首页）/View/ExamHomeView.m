//
//  ExamHomeView.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/7.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "ExamHomeView.h"

@implementation ExamHomeView

- (void)setModel:(ExamTaskModel *)model {
    
    _model = model;
    [self reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    }
    
    NSInteger row = indexPath.row;
    cell.textLabel.text = self.dataSources[row];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
    
    NSArray *texts = @[@"examPaperName", @"questionCount", @"examDuration", @"passingPercent", @"maxExamTimes"];
    NSString *text = [self.model valueForKey:texts[row]];
    cell.detailTextLabel.text = text;
    cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    cell.detailTextLabel.textColor = kMainTextColor;
    if ([texts[row] isEqualToString:@"examDuration"]) {
        
        if ([text intValue] == 0) {
            cell.detailTextLabel.text = @"无限制";
        }
        else cell.detailTextLabel.text = [NSString stringWithFormat:@"%@分钟", text];
    }
    else if ([texts[row] isEqualToString:@"maxExamTimes"]) {
        
        if ([text intValue] == 0) {
            cell.detailTextLabel.text = @"无限制";
        }
    }
    else if ([texts[row] isEqualToString:@"passingPercent"]) {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"满分100分，及格%@分", text];
    }
    
    return cell;
}

@end
