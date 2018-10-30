//
//  KnowledgeView.m
//  Lywsale
//
//  Created by 尚洋 on 2018/9/25.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "KnowledgeView.h"

@implementation KnowledgeView
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
        
        [self addHeader];
        
    }
    
    return headerView;
    
}

-(void)addHeader{
    
    NSArray *imageArray = @[@"Knowlede_CourseSort",@"Knowlede_DrugSort",@"Knowlede_DrugTaboo"];
    NSArray *titleArray = @[@"课程分类",@"药品分类",@"药品禁忌"];
    
    for (int i = 0; i < imageArray.count; i++) {
        
        UIView *view = [UIView new];
        view.userInteractionEnabled = YES;
        view.tag = i + 100;
        UITapGestureRecognizer *headTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headTap:)];
        [view addGestureRecognizer:headTap];
        [self.headerView addSubview:view];
        
        view.sd_layout
        .leftSpaceToView(self.headerView, ScreenWidth * 0.135 + i * ScreenWidth * 0.3)
        .centerYEqualToView(self.headerView)
        .widthEqualToHeight()
        .heightRatioToView(self.headerView, 0.8);
        
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
    
}

-(void)headTap:(UITapGestureRecognizer *)sender{
    
    NSArray *titleArray = @[@"课程分类",@"药品分类",@"药品禁忌"];
    
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
    
    label.text = labelString;
    
    return view;
    
}

@end
