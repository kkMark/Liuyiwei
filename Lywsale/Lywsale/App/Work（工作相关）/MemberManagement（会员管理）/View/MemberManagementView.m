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
        
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth,309)];
        
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 294)];
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
    .leftSpaceToView(self.headerView, 20)
    .topSpaceToView(lineView, 20)
    .widthIs(150)
    .heightEqualToWidth();
    gradientRound.transform = CGAffineTransformRotate (gradientRound.transform, -M_PI_2); //view就是UIView的实例，直接将transform赋值UIView的就会做出相应的旋转处理
    
    gradientRound.didFinishAutoLayoutBlock = ^(CGRect frame) {
        [gradientRound addCircleWithColor:RGB(97, 75, 243)];
        [gradientRound animateToProgress:0.8];
    };
    
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
