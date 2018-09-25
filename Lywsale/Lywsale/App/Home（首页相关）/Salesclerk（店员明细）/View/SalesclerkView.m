//
//  SalesclerkView.m
//  Lywsale
//
//  Created by M on 2018/9/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "SalesclerkView.h"
#import "SalesclerkCell.h"

@implementation SalesclerkView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 15)];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSources.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SalesclerkCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        
        cell = [[SalesclerkCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    cell.indexPath = indexPath;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return 35;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 45)];
    bgView.backgroundColor = [UIColor whiteColor];
    
    UIImage *taskBgImg = [UIImage imageNamed:@"salesclerk-bgImg"];
    UIImageView *imgBgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 0, 0)];
    imgBgView.image = taskBgImg;
    imgBgView.size = taskBgImg.size;
    [bgView addSubview:imgBgView];
    
    UILabel *taskLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, imgBgView.width, imgBgView.height)];
    taskLabel.text = @"剩余 16 天";
    taskLabel.font = [UIFont systemFontOfSize:12];
    taskLabel.textColor = [UIColor whiteColor];
    taskLabel.textAlignment = NSTextAlignmentCenter;
    [imgBgView addSubview:taskLabel];
    
    return bgView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 30)];
    bgView.backgroundColor = [UIColor whiteColor];
    return bgView;
}

@end
