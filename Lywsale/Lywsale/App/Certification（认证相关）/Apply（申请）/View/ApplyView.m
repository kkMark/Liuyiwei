//
//  ApplyView.m
//  Lywsale
//
//  Created by M on 2018/8/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "ApplyView.h"
#import "ApplyCell.h"

@implementation ApplyView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ApplyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        
        cell = [[ApplyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        if ([self.dataSources[indexPath.row] isEqualToString:@"请选择所在省市区"] ||
            [self.dataSources[indexPath.row] isEqualToString:@"请选择所在街道"])
        {
            UIImageView *moreImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 17, 17)];
            moreImgView.image = [UIImage imageNamed:@"more"];
            cell.accessoryView = moreImgView;
            cell.textField.enabled = NO;
        }
    }
    
    cell.textField.placeholder = self.dataSources[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    [self endEditing:YES];
}

@end
