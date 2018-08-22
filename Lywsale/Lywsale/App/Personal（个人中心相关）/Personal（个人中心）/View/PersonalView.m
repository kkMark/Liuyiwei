//
//  PersonalView.m
//  Lywsale
//
//  Created by M on 2018/8/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "PersonalView.h"

@interface PersonalView ()

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIImageView *headImgView;
@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation PersonalView
@synthesize headerView;

#pragma mark - lazy
- (UIView *)headerView {
    
    if (!headerView) {
        
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
        headerView.backgroundColor = [UIColor whiteColor];
        
        // 头像
        self.headImgView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 60, 60)];
        self.headImgView.height = self.headImgView.width = 50;
        self.headImgView.layer.cornerRadius = self.headImgView.height / 2;
        self.headImgView.layer.masksToBounds = YES;
        self.headImgView.backgroundColor = [UIColor redColor];
        [headerView addSubview:self.headImgView];
        
        // 昵称
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.headImgView.maxX + 15, 25, ScreenWidth - (self.headImgView.maxX + 30), 15)];
        self.nameLabel.text = @"用户昵称";
        self.nameLabel.font = [UIFont boldSystemFontOfSize:14];
        self.nameLabel.textColor = kMainTextColor;
        [headerView addSubview:self.nameLabel];
        
        // 线
        UIView *lineView = [[UILabel alloc] initWithFrame:CGRectMake(0, self.headImgView.maxY + 15, ScreenWidth, 0.5)];
        lineView.backgroundColor = kLineColor;
        [headerView addSubview:lineView];
        
        NSArray *titles = @[@"总积分", @"总金额", @"可用金额"];
        UIButton *bgBtn;
        for (int i = 0; i < 3; i++) {
            
            bgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            bgBtn.frame = CGRectMake(ScreenWidth / 3 * i, lineView.maxY, ScreenWidth / 3, 0);
            [headerView addSubview:bgBtn];
            
            UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, bgBtn.width, 15)];
            numberLabel.text = @"300";
            numberLabel.font = [UIFont boldSystemFontOfSize:14];
            numberLabel.textColor = kMainTextColor;
            numberLabel.textAlignment = NSTextAlignmentCenter;
            [bgBtn addSubview:numberLabel];
            
            UILabel *typeNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, numberLabel.maxY + 5, bgBtn.width, 15)];
            typeNameLabel.text = titles[i];
            typeNameLabel.font = [UIFont systemFontOfSize:14];
            typeNameLabel.textColor = kMainTextColor;
            typeNameLabel.textAlignment = NSTextAlignmentCenter;
            [bgBtn addSubview:typeNameLabel];
            
            bgBtn.height = typeNameLabel.maxY + 15;
            if (i != 0) {
                
                UIView *lineView = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 0.5, bgBtn.height - 20)];
                lineView.backgroundColor = kLineColor;
                [bgBtn addSubview:lineView];
            }
        }
        
        // 底部线条
        UIView *bottomlineView = [[UILabel alloc] initWithFrame:CGRectMake(0, bgBtn.maxY, ScreenWidth, 0.5)];
        bottomlineView.backgroundColor = kLineColor;
        [headerView addSubview:bottomlineView];
        
        headerView.height = self.headImgView.maxY + self.headImgView.x + bgBtn.height;
    }
    
    return headerView;
}

#pragma mark - tableview
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    if (self = [super initWithFrame:frame style:style]) {
        
        self.tableHeaderView = self.headerView;
    }
    
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

@end
