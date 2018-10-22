//
//  AddMembersView.m
//  Lywsale
//
//  Created by 尚洋 on 2018/10/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "AddMembersView.h"
#import "AddMembersTableViewCell.h"

@implementation AddMembersView

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

/**< 每个分组下边预留的空白高度*/
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"AddMembersTableViewCell";
    
    AddMembersTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell)
    {
        cell = [[AddMembersTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (self.dataSource.count > 0) {
        
        NSDictionary *dict = self.dataSource[indexPath.row];
        
        cell.titleLabel.text = [dict allKeys][0];
        
        cell.contentLabel.text = dict[[dict allKeys][0]];
        
    }
    
    if (indexPath.row == 0 || indexPath.row == 8 || indexPath.row == 9 || indexPath.row == 10) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dict = self.dataSource[indexPath.row];
    
    NSString *pushString = [dict allKeys][0];
    
    if (self.pushBlock) {
        self.pushBlock(pushString);
    }
    
}

@end
