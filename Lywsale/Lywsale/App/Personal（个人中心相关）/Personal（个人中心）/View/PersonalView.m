//
//  PersonalView.m
//  Lywsale
//
//  Created by M on 2018/8/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "PersonalView.h"

@implementation PersonalView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *imgs = @[@"personal_footprint", @"personal_bank", @"personal_archives", @"personal_help", @"personal_conversion", @"personal_more"];
    
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = self.dataSources[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:imgs[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    NSString *title = self.dataSources[indexPath.row];
    NSString *vcName;
    if ([title containsString:@"足迹"]) {
        vcName = @"FootprintViewController";
    }
    else if ([title containsString:@"档案"]) {
        vcName = @"ArchivesViewController";
    }
    else if ([title containsString:@"银行卡"]) {
        vcName = @"MyCardViewController";
    }
    else if ([title containsString:@"帮助"]) {
        vcName = @"HelpViewController";
    }
    else if ([title containsString:@"更多"]) {
        vcName = @"MoreViewController";
    }
    else if ([title containsString:@"切换"] && self.conversionBlock) {
        
        return self.conversionBlock();
    }
    
    if (self.goViewController && vcName.length > 0) {
        
        UIViewController *vc = [NSClassFromString(vcName) new];
        vc.title = title;
        vc.hidesBottomBarWhenPushed = YES;
        self.goViewController(vc);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

@end
