//
//  BuyView.m
//  Lywsale
//
//  Created by M on 2018/9/11.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BuyView.h"
#import "BuyCell.h"

@implementation BuyView

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSources.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 3) {
        
        BuyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BuyCell"];
        if (cell == nil) {
            cell = [[BuyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BuyCell"];
        }
        
        return cell;
    }
    
    NSString *cellIdentifier = indexPath.row == 0 ? @"Cell-01" : @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if ([cellIdentifier isEqualToString:@"Cell-01"]) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, 0, 70, 25);
            button.layer.cornerRadius = button.height / 2;
            button.layer.masksToBounds = YES;
            button.layer.borderColor = kMainColor.CGColor;
            button.layer.borderWidth = 1;
            button.titleLabel.font = [UIFont systemFontOfSize:14];
            [button setTitle:@"复购" forState:UIControlStateNormal];
            [button setTitleColor:kMainColor forState:UIControlStateNormal];
            cell.accessoryView = button;
        }
    }
    
    if (indexPath.row == 0) {
        
        cell.textLabel.text = @"2018-07-04";
        cell.textLabel.font = [UIFont systemFontOfSize:16];
        cell.textLabel.textColor = kMainTextColor;
    }
    else {
        
        cell.textLabel.text = @"博路定 (恩替卡韦片)";
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
        
        cell.detailTextLabel.text = @"1mg*7片X5";
        cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
        cell.detailTextLabel.textColor = cell.textLabel.textColor;
    }

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        return 45;
    }
    else if (indexPath.row == 3) {
        return 55;
    }
    else {
        return 25;
    }
}

@end
