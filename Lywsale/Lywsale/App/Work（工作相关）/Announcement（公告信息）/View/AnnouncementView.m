//
//  AnnouncementView.m
//  Lywsale
//
//  Created by 尚洋 on 2018/9/24.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "AnnouncementView.h"
#import "AnnouncenmentTableViewCell.h"
#import "AnnouncementModel.h"

@implementation AnnouncementView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"AnnouncenmentTableViewCell";
    
    AnnouncenmentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell)
    {
        cell = [[AnnouncenmentTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    AnnouncementModel *model = [AnnouncementModel new];
    [model setValuesForKeysWithDictionary:self.dataSource[indexPath.section]];
    
    cell.model = model;
    cell.backgroundColor = kPageBgColor;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

@end
