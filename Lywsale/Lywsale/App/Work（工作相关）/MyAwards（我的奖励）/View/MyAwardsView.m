//
//  MyAwardsView.m
//  Lywsale
//
//  Created by 尚洋 on 2018/10/12.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "MyAwardsView.h"

@implementation MyAwardsView
@synthesize headerView;

-(void)addTitleList:(NSArray *)array{
    
    self.dataSource = [NSMutableArray arrayWithArray:array];
    
    self.myTable.tableHeaderView = self.headerView;
    
    [self.myTable reloadData];
    
}

- (UIView *)headerView {
    
    if (!headerView) {
        
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth,129)];
        
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 114)];
        backView.backgroundColor = [UIColor whiteColor];
        [headerView addSubview:backView];
        
        [self addHeader];
        
    }
    
    return headerView;
    
}

-(void)addHeader{

    NSArray *titleArray = @[@"总积分",@"总金额",@"可用金额"];
    
    for (int i = 0; i < titleArray.count; i++) {
        
        UIView *view = [UIView new];
        view.userInteractionEnabled = YES;
//        view.tag = i + 100;
//        UITapGestureRecognizer *headTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headTap:)];
//        [view addGestureRecognizer:headTap];
        [self.headerView addSubview:view];
        
        view.sd_layout
        .leftSpaceToView(self.headerView, 18.75 + i * ScreenWidth * 0.3)
        .topSpaceToView(self.headerView, 10)
        .widthIs(ScreenWidth * 0.3)
        .heightIs(42);
        
        UILabel *label = [UILabel new];
        label.text = titleArray[i];
        label.font = [UIFont systemFontOfSize:13];
        [view addSubview:label];
        
        label.sd_layout
        .centerXEqualToView(view)
        .topSpaceToView(view, 0)
        .heightIs(13);
        [label setSingleLineAutoResizeWithMaxWidth:100];
        
        if (i == 0) {
            
            self.totalScoreLabel = [UILabel new];
            self.totalScoreLabel.text = @"300";
            self.totalScoreLabel.font = [UIFont systemFontOfSize:16];
            [view addSubview:self.totalScoreLabel];
            
            self.totalScoreLabel.sd_layout
            .centerXEqualToView(view)
            .topSpaceToView(label, 12)
            .heightIs(16);
            [self.totalScoreLabel setSingleLineAutoResizeWithMaxWidth:ScreenWidth * 0.3];
            
        }else if (i == 1){
            
            self.totalAmountLabel = [UILabel new];
            self.totalAmountLabel.text = @"￥600";
            self.totalAmountLabel.font = [UIFont systemFontOfSize:16];
            [view addSubview:self.totalAmountLabel];
            
            self.totalAmountLabel.sd_layout
            .centerXEqualToView(view)
            .topSpaceToView(label, 12)
            .heightIs(16);
            [self.totalAmountLabel setSingleLineAutoResizeWithMaxWidth:ScreenWidth * 0.3];
            
        }else if (i == 2){
            
            self.amountAvailableLabel = [UILabel new];
            self.amountAvailableLabel.text = @"￥60";
            self.amountAvailableLabel.font = [UIFont systemFontOfSize:16];
            self.amountAvailableLabel.textColor = RGB(81, 103, 241);
            [view addSubview:self.amountAvailableLabel];
            
            self.amountAvailableLabel.sd_layout
            .centerXEqualToView(view)
            .topSpaceToView(label, 12)
            .heightIs(16);
            [self.amountAvailableLabel setSingleLineAutoResizeWithMaxWidth:ScreenWidth * 0.3];
            
        }
        
    }
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = RGB(248, 248, 248);
    [self.headerView addSubview:lineView];
    
    lineView.sd_layout
    .leftSpaceToView(self.headerView, 0)
    .rightSpaceToView(self.headerView, 0)
    .topSpaceToView(self.headerView, 62)
    .heightIs(15);
    
    NSArray *moreArray = @[@"奖励类型",@"周期"];
    
    for (int i = 0; i < moreArray.count; i ++) {
        
        UIView *view = [UIView new];
        [self.headerView addSubview:view];
        
        view.sd_layout
        .leftSpaceToView(self.headerView, i * ScreenWidth / 2)
        .widthIs(ScreenWidth/2)
        .topSpaceToView(lineView, 0)
        .heightIs(40);
        
        UILabel *label = [UILabel new];
        label.text = moreArray[i];
        label.font = [UIFont systemFontOfSize:13];
        [view addSubview:label];
        
        label.sd_layout
        .leftSpaceToView(view, view.width/2 - 50)
        .centerYEqualToView(view)
        .heightIs(13);
        [label setSingleLineAutoResizeWithMaxWidth:100];
        
        UIImageView *imageView = [UIImageView new];
        imageView.image = [UIImage imageNamed:@"more1"];
        [view addSubview:imageView];
        
        imageView.sd_layout
        .leftSpaceToView(label, 7)
        .centerYEqualToView(label)
        .widthIs(17)
        .heightEqualToWidth();
        
    }
    
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
    label.font = [UIFont systemFontOfSize:20];
    [view addSubview:label];
    
    label.sd_layout
    .leftSpaceToView(view, 10)
    .centerYEqualToView(view)
    .heightIs(20);
    [label setSingleLineAutoResizeWithMaxWidth:200];
    
    NSDictionary *dict = self.dataSource[section];
    
    NSArray *keys = [dict allKeys];
    
    NSString *labelString = keys[0];
    
    label.text = labelString;
    
    return view;
    
}

@end
