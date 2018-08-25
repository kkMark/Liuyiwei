//
//  ArchivesView.m
//  Lywsale
//
//  Created by M on 2018/8/23.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "ArchivesView.h"

@interface ArchivesView ()

@property (nonatomic, strong) UIImageView *headerImgView;

@end

@implementation ArchivesView
@synthesize headerImgView;

#pragma mark - lazy
- (UIImageView *)headerImgView {
    
    if (!headerImgView) {
        
        headerImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 45, 45)];
        headerImgView.image = [UIImage imageNamed:@"TestHeadImg"];
        headerImgView.layer.cornerRadius = headerImgView.height / 2;
        headerImgView.layer.masksToBounds = YES;
        headerImgView.contentMode = UIViewContentModeScaleAspectFill;
    }
    
    return headerImgView;
}


#pragma mark - tableview
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *title = self.dataSources[indexPath.row];
    NSString *cellIdentifier = indexPath.row == 0 ? @"HeaderCell" : @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        if ([cellIdentifier isEqualToString:@"HeaderCell"]) {
            cell.accessoryView = self.headerImgView;
        }
    }
    
    NSArray *titles = @[@"绑定手机", @"修改密码"];
    if ([titles containsObject:title]) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.textColor = kMainTextColor;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.text = title;
    cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *title = self.dataSources[indexPath.row];
    NSString *vcName;
    if ([title isEqualToString:@"绑定手机"]) {
        vcName = @"BindingMobileViewController";
    }
    else if ([title isEqualToString:@"修改密码"]) {
        vcName = @"ModifyPasswordViewController";
    }
    
    if (self.goViewController && vcName.length > 0) {
        
        UIViewController *vc = [NSClassFromString(vcName) new];
        self.goViewController(vc);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        return 75;
    }
    
    return 45;
}

@end
