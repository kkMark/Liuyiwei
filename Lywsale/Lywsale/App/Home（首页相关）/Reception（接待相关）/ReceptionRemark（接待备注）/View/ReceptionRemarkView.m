
//
//  ReceptionRemarkView.m
//  Lywsale
//
//  Created by M on 2018/9/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "ReceptionRemarkView.h"
#import "ReceptionRemarkCell.h"

@implementation ReceptionRemarkView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 2) {
        
        ReceptionRemarkCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReceptionRemarkCell"];
        if (cell == nil) {
            cell = [[ReceptionRemarkCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
        }
        
        return cell;
    }
    else {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (cell == nil) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
            
            UIImageView *moreImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
            moreImgView.image = [UIImage imageNamed:@"more"];
            cell.accessoryView = moreImgView;
        }
        
        cell.backgroundColor = [UIColor whiteColor];
        cell.textLabel.text = self.dataSources[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.textColor = kMainTextColor;
        
        NSArray *titles = @[@"请选择处理状态", @"简单咨询"];
        cell.detailTextLabel.text = titles[indexPath.row];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
        cell.detailTextLabel.textColor = [UIColor colorWithHexString:@"0x999999"];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 2) {
        return 200;
    }
    
    return 45;
}

@end
