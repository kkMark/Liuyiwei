//
//  UploadInfoView.m
//  Lywsale
//
//  Created by M on 2018/8/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "UploadInfoView.h"
#import "UploadInfoCell.h"
#import "UploadInfoAddressCell.h"

@implementation UploadInfoView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 1 && self.userType == PharmacyType) {
        
        UploadInfoAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddressCell"];
        if (cell == nil) {
            cell = [[UploadInfoAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AddressCell"];
        }
        
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, ScreenWidth);
        return cell;
    }
    else {
        
        UploadInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (cell == nil) {
            cell = [[UploadInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        }
        
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, ScreenWidth);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 1 && self.userType == PharmacyType) {
        return 160;
    }
    
    return (ScreenWidth - 60) / 2 + 65;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

@end
