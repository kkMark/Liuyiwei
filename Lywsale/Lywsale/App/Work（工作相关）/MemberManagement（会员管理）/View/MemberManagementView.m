//
//  MemberManagementView.m
//  Lywsale
//
//  Created by 尚洋 on 2018/10/9.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "MemberManagementView.h"
#import "GradientRound.h"

@implementation MemberManagementView
@synthesize headerView;

-(void)addTitleList:(NSArray *)array{
    
    self.dataSource = [NSMutableArray arrayWithArray:array];
    
    self.myTable.tableHeaderView = self.headerView;
    
    [self.myTable reloadData];
    
}

- (UIView *)headerView {
    
    if (!headerView) {
        
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth,299)];
        
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 284)];
        backView.backgroundColor = [UIColor whiteColor];
        [headerView addSubview:backView];
        
        [self addHeader];
        
    }
    
    return headerView;
    
}

-(void)addHeader{
    
    NSArray *imageArray = @[@"Work_Tag",@"Work_AddMember",@"Work_FSend"];
    NSArray *titleArray = @[@"标签管理",@"添加会员",@"群发消息"];
    
    for (int i = 0; i < imageArray.count; i++) {
        
        UIView *view = [UIView new];
        view.userInteractionEnabled = YES;
        view.tag = i + 100;
        UITapGestureRecognizer *headTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headTap:)];
        [view addGestureRecognizer:headTap];
        [self.headerView addSubview:view];
        
        view.sd_layout
        .leftSpaceToView(self.headerView, 50 + i * ScreenWidth * 0.3)
        .topSpaceToView(self.headerView, 10)
        .widthEqualToHeight()
        .heightIs(50);
        
        UIImageView *imageView = [UIImageView new];
        imageView.image = [UIImage imageNamed:imageArray[i]];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [view addSubview:imageView];
        
        imageView.sd_layout
        .centerXEqualToView(view)
        .topSpaceToView(view, 0)
        .widthIs(34)
        .heightEqualToWidth();
        
        UILabel *label = [UILabel new];
        label.text = titleArray[i];
        label.font = [UIFont systemFontOfSize:10];
        [view addSubview:label];
        
        label.sd_layout
        .centerXEqualToView(view)
        .topSpaceToView(imageView, 5)
        .heightIs(10);
        [label setSingleLineAutoResizeWithMaxWidth:100];
        
    }
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = RGB(248, 248, 248);
    [self.headerView addSubview:lineView];
    
    lineView.sd_layout
    .leftSpaceToView(self.headerView, 0)
    .rightSpaceToView(self.headerView, 0)
    .topSpaceToView(self.headerView, 70)
    .heightIs(15);
    
    GradientRound *gradientRound = [GradientRound new];
    [self.headerView addSubview:gradientRound];
    
    gradientRound.sd_layout
    .leftSpaceToView(self.headerView, 42)
    .topSpaceToView(lineView, 20)
    .widthIs(150)
    .heightEqualToWidth();
    gradientRound.transform = CGAffineTransformRotate (gradientRound.transform, -M_PI_2); //view就是UIView的实例，直接将transform赋值UIView的就会做出相应的旋转处理
    
    gradientRound.didFinishAutoLayoutBlock = ^(CGRect frame) {
        [gradientRound addCircleWithColor:RGB(81, 103, 241)];
        [gradientRound animateToProgress:0.8];
    };
    
    UILabel *totalMemberLabel = [UILabel new];
    totalMemberLabel.text = @"总会员";
    totalMemberLabel.font = [UIFont systemFontOfSize:16];
    [self.headerView addSubview:totalMemberLabel];
    
    totalMemberLabel.sd_layout
    .centerXEqualToView(gradientRound)
    .topSpaceToView(lineView, 75)
    .heightIs(16);
    [totalMemberLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    self.totalLabel = [UILabel new];
    self.totalLabel.text = @"15000";
    self.totalLabel.textColor = RGB(81, 103, 241);
    self.totalLabel.font = [UIFont systemFontOfSize:24];
    [self.headerView addSubview:self.totalLabel];
    
    self.totalLabel.sd_layout
    .centerXEqualToView(gradientRound)
    .topSpaceToView(totalMemberLabel, 5)
    .heightIs(24);
    [self.totalLabel setSingleLineAutoResizeWithMaxWidth:100];
    
    NSArray *memberArray = @[@"有效会员",@"无效会员"];
    
    for (int i = 0; i < memberArray.count; i++) {
        
        UIView * view = [UIView new];
        view.backgroundColor = i == 0 ? RGB(81, 103, 241):RGB(232, 232, 238);
        view.layer.cornerRadius = 5;
        view.layer.masksToBounds = YES;
        [self.headerView addSubview:view];
        
        view.sd_layout
        .leftSpaceToView(gradientRound, 45)
        .topSpaceToView(lineView, 43 + i * 47)
        .widthIs(10)
        .heightEqualToWidth();
        
        UILabel *titleLabel = [UILabel new];
        titleLabel.text = memberArray[i];
        titleLabel.font = [UIFont systemFontOfSize:13];
        titleLabel.textColor = RGB(102, 102, 102);
        [self.headerView addSubview:titleLabel];
        
        titleLabel.sd_layout
        .leftSpaceToView(view, 5)
        .centerYEqualToView(view)
        .heightIs(13);
        [titleLabel setSingleLineAutoResizeWithMaxWidth:100];
        
        if (i == 0) {
            
            self.effectiveLabel = [UILabel new];
            self.effectiveLabel.text = @"13500";
            self.effectiveLabel.font = [UIFont systemFontOfSize:13];
            [self.headerView addSubview:self.effectiveLabel];
            
            self.effectiveLabel.sd_layout
            .leftSpaceToView(view, 5)
            .topSpaceToView(titleLabel, 8)
            .heightIs(13);
            [self.effectiveLabel setSingleLineAutoResizeWithMaxWidth:100];
            
        }else{
            
            self.InvalidLabel = [UILabel new];
            self.InvalidLabel.text = @"1500";
            self.InvalidLabel.font = [UIFont systemFontOfSize:13];
            [self.headerView addSubview:self.InvalidLabel];
            
            self.InvalidLabel.sd_layout
            .leftSpaceToView(view, 5)
            .topSpaceToView(titleLabel, 8)
            .heightIs(13);
            [self.InvalidLabel setSingleLineAutoResizeWithMaxWidth:100];
            
        }
        
    }
    
}

-(void)headTap:(UITapGestureRecognizer *)sender{
    
    NSArray *titleArray = @[@"标签管理",@"添加会员",@"群发消息"];
    
    NSString *pushString = titleArray[sender.view.tag -100];
    
    if (self.pushBlock) {
        self.pushBlock(pushString);
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
