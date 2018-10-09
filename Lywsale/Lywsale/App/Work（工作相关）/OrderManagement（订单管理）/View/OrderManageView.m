//
//  OrderManageView.m
//  Lywsale
//
//  Created by 尚洋 on 2018/10/9.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "OrderManageView.h"
#import "OrderManageTableViewCell.h"
#import "OrderManageModel.h"

@implementation OrderManageView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"OrderManageTableViewCell";
    
    OrderManageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell)
    {
        cell = [[OrderManageTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    OrderManageModel *model = [OrderManageModel new];
    [model setValuesForKeysWithDictionary:self.dataSource[indexPath.section]];
    
    cell.model = model;
    cell.backgroundColor = kPageBgColor;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

@end
