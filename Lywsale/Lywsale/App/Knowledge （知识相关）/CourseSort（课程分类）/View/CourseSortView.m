
//
//  CourseSortView.m
//  Lywsale
//
//  Created by 尚洋 on 2018/10/8.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "CourseSortView.h"
#import "CourseSortTableViewCell.h"

@implementation CourseSortView
@synthesize headerView;

-(void)addTitleList:(NSArray *)array{
    
    self.dataSource = [NSMutableArray arrayWithArray:array];
    
    self.myTable.tableHeaderView = self.headerView;
    
    [self.myTable reloadData];
    
}

- (UIView *)headerView {
    
    if (!headerView) {
        
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth,20)];
        headerView.backgroundColor = kPageBgColor;
        
    }
    
    return headerView;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
    return 1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 40;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    NSArray *imageArray = @[@"MedicineBottle",@"MedicalRecord",@"Bottle"];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 10, ScreenWidth - 25, 30)];
    
    UIView *BGView = [UIView new];
    BGView.backgroundColor = [UIColor whiteColor];
    [view addSubview:BGView];
    
    BGView.sd_layout
    .centerXEqualToView(view)
    .topSpaceToView(view, 0)
    .bottomSpaceToView(view, 0)
    .widthIs(ScreenWidth - 25);
    
    UIImageView *imageView = [UIImageView new];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = [UIImage imageNamed:imageArray[section]];
    [view addSubview:imageView];
    
    imageView.sd_layout
    .leftSpaceToView(view, 12.5 + 10)
    .centerYEqualToView(view)
    .widthIs(24)
    .heightEqualToWidth();
    
    UILabel *label = [UILabel new];
    label.font = [UIFont systemFontOfSize:17];
    [view addSubview:label];
    
    label.sd_layout
    .leftSpaceToView(imageView, 10)
    .centerYEqualToView(view)
    .heightIs(17);
    [label setSingleLineAutoResizeWithMaxWidth:200];
    
    NSDictionary *dict = self.dataSource[section];
    
    NSArray *keys = [dict allKeys];
    
    NSString *labelString = keys[0];
    
    label.text = labelString;
    
    return view;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"CourseSortTableViewCell";
    
    CourseSortTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell)
    {
        cell = [[CourseSortTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.backgroundColor = kPageBgColor;
    
    NSDictionary *dict = self.dataSource[indexPath.section];
    
    NSArray *keys = [dict allKeys];
    
    NSArray *array = dict[keys[0]];
    
    cell.courseSortArray = array;
    
    return cell;
}

@end
