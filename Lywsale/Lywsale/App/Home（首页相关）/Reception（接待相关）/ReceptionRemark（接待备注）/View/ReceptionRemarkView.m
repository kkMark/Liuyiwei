
//
//  ReceptionRemarkView.m
//  Lywsale
//
//  Created by M on 2018/9/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "ReceptionRemarkView.h"
#import "ReceptionRemarkCell.h"
#import "RemarkMenuView.h"

@interface ReceptionRemarkView ()

/// 原因
@property (nonatomic, copy) NSString *reason;
/// 状态
@property (nonatomic, copy) NSString *state;

@end

@implementation ReceptionRemarkView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 2) {
        
        ReceptionRemarkCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReceptionRemarkCell"];
        if (cell == nil) {
            cell = [[ReceptionRemarkCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
        }
        
        cell.title = @"接待备注";
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
        
        NSArray *titles = @[@"请选择处理状态", @"请选择原因"];
        cell.detailTextLabel.text = titles[indexPath.row];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
        cell.detailTextLabel.textColor = [UIColor colorWithHexString:@"0x999999"];
        
        if (self.state.length > 0 && indexPath.row == 0) {
            cell.detailTextLabel.text = self.state;
            cell.detailTextLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
        }
        else if (self.reason.length > 0 && indexPath.row == 1) {
            cell.detailTextLabel.text = self.reason;
            cell.detailTextLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
        }
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 2) {
        return 200;
    }
    
    return 45;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    if (indexPath.row < 2) {
        
        RemarkMenuView *menuView = [[RemarkMenuView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        [[UIApplication sharedApplication].keyWindow addSubview:menuView];

        if (indexPath.row == 0) {
            
            menuView.title = @"接待状态";
            menuView.currentType = self.state;
            menuView.dataSources = @[@"简单咨询", @"顾虑质量问题", @"新品", @"配送问题", @"其他"];
        }
        else {
            
            menuView.title = @"未成交原因";
            menuView.currentType = self.reason;
            menuView.dataSources = @[@"简单咨询", @"顾虑质量问题", @"新品", @"配送问题", @"其他"];
        }
        
        @weakify(self);
        [menuView setSelectTypeBlock:^(NSString * _Nonnull type) {
            
            @strongify(self);
            if (indexPath.row == 0) {
                self.state = type;
            }
            else self.reason = type;
            
            [self reloadData];
        }];
    }
}

@end
