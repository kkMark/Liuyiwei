//
//  MoreView.m
//  Lywsale
//
//  Created by M on 2018/8/24.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "MoreView.h"
#import "WebHelpViewController.h"

@implementation MoreView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    NSString *title = self.dataSources[indexPath.row];
    if ([title isEqualToString:@"关于我们"]) {
        
        WebHelpViewController *vc = [WebHelpViewController new];
        vc.title = title;
        self.goViewController(vc);
    }
}

@end
