//
//  ActivityDetailsView.m
//  Lywsale
//
//  Created by M on 2018/9/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "ActivityDetailsView.h"

@interface ActivityDetailsView ()

@property (nonatomic, strong) UIScrollView *bgScrollView;

@end

@implementation ActivityDetailsView
@synthesize bgScrollView;

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {

    UIView *headerView = [self headerViewWithFrame:CGRectMake(10, 0, self.bgScrollView.width - 20, 45) title:@"雷易得满减活动"];
    [self.bgScrollView addSubview:headerView];
    
    UIView *remarkView = [self remarkViewWithFrame:CGRectMake(10, headerView.maxY, self.bgScrollView.width - 20, 0)];
    [self.bgScrollView addSubview:remarkView];
    
    self.bgScrollView.contentSize = CGSizeMake(0, remarkView.maxY);
}

#pragma mark - lazy
- (UIScrollView *)bgScrollView {
    
    if (!bgScrollView) {
        
        bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        bgScrollView.size = self.size;
        bgScrollView.backgroundColor = kPageBgColor;
        [self addSubview:bgScrollView];
    }
    
    return bgScrollView;
}

#pragma mark - UI初始化
/// 头部
- (UIView *)headerViewWithFrame:(CGRect)rect title:(NSString *)title {
    
    UIView *headerView = [[UIView alloc] initWithFrame:rect];
    
    UIImageView *headerImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    headerImgView.centerY = headerView.height / 2;
    headerImgView.image = [UIImage imageNamed:@"task_salesDetails"];
    [headerView addSubview:headerImgView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(headerImgView.maxX + 10, 0, 0, headerView.height)];
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textColor = kMainTextColor;
    titleLabel.width = headerView.width - titleLabel.x;
    [headerView addSubview:titleLabel];
    
    return headerView;
}

/// 标题文本
- (UIView *)titleViewWithFrame:(CGRect)rect title:(NSString *)title {
    
    UIView *titleView = [[UIView alloc] initWithFrame:rect];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = kMainColor;
    titleLabel.width = [titleLabel getTextWidth];
    titleLabel.height = [titleLabel getTextHeight];
    titleLabel.center = CGPointMake(titleView.width / 2, titleView.height / 2);
    [titleView addSubview:titleLabel];
    
    for (int i = 0; i < 2; i++) {
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 25, 1)];
        lineView.x = i == 0 ? titleLabel.x - 35 : titleLabel.maxX + 10;
        lineView.centerY = titleLabel.centerY;
        lineView.backgroundColor = kMainColor;
        [titleView addSubview:lineView];
    }
    
    return titleView;
}

/// 介绍
- (UIView *)remarkViewWithFrame:(CGRect)rect {
    
    UIView *bgView = [[UIView alloc] initWithFrame:rect];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 3;
    bgView.layer.shadowColor = [UIColor grayColor].CGColor;
    bgView.layer.shadowOffset = CGSizeMake(3, 3);
    bgView.layer.shadowOpacity = 0.3;
    
    // 标题
    UIView *titleView = [self titleViewWithFrame:CGRectMake(0, 15, bgView.width, 20) title:@"活动说明"];
    [bgView addSubview:titleView];
    
    float y = titleView.maxY + 15;
    NSArray *titles = @[@"发布厂商", @"执行方式", @"活动时间", @"活动简介"];
    for (int i = 0; i < titles.count; i++) {
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, y, 0, 0)];
        titleLabel.text = titles[i];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
        titleLabel.width = [titleLabel getTextWidth];
        titleLabel.height = [titleLabel getTextHeight];
        [bgView addSubview:titleLabel];
        
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleLabel.maxX + 20, y, 0, 0)];
        contentLabel.text = titles[i];
        contentLabel.font = [UIFont systemFontOfSize:14];
        contentLabel.textColor = kMainTextColor;
        contentLabel.numberOfLines = 0;
        
        if ([contentLabel.text isEqualToString:@"活动简介"]) {
            
            contentLabel.text = @"活动是由共同目的联合起来并完成一定社会职能的动作的总和。活动由目的、动机和动作构成，具有完整的结构系统。苏联心理学家从20年代起就对活动进行了一系列研究。";
        }
        
        contentLabel.width = bgView.width - contentLabel.x - 10;
        contentLabel.height = [contentLabel getTextHeight];
        contentLabel.textAlignment = contentLabel.height > titleLabel.height ? NSTextAlignmentLeft : NSTextAlignmentRight;
        [bgView addSubview:contentLabel];
        
        y = contentLabel.maxY + 15;
    }
    
    bgView.height = y;
    return bgView;
}

@end
