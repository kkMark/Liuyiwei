//
//  MemberManagementView.m
//  Lywsale
//
//  Created by 尚洋 on 2018/10/9.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "MemberManagementView.h"

@implementation MemberManagementView
@synthesize headerView;

-(void)addTitleList:(NSArray *)array{
    
    self.dataSource = [NSMutableArray arrayWithArray:array];
    
    self.myTable.tableHeaderView = self.headerView;
    
    [self.myTable reloadData];
    
}

- (UIView *)headerView {
    
    if (!headerView) {
        
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth,79)];
        
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 64)];
        backView.backgroundColor = [UIColor whiteColor];
        [headerView addSubview:backView];
        
//        [self addHeader];
        
    }
    
    return headerView;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 40;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 10, ScreenWidth, 30)];
    view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [UILabel new];
    label.font = [UIFont systemFontOfSize:17];
    [view addSubview:label];
    
    label.sd_layout
    .leftSpaceToView(view, 10)
    .centerYEqualToView(view)
    .heightIs(17);
    [label setSingleLineAutoResizeWithMaxWidth:200];
    
    NSDictionary *dict = self.dataSource[section];
    
    NSArray *keys = [dict allKeys];
    
    NSString *labelString = keys[0];
    
    NSArray *array = dict[keys[0]];
    
    label.text = [NSString stringWithFormat:@"%@（%ld）",labelString,array.count];
    
    return view;
    
}

@end
