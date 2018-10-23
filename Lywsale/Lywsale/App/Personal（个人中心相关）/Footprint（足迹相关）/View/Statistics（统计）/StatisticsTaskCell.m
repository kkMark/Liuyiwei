//
//  StatisticsTaskCell.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/23.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "StatisticsTaskCell.h"

@implementation StatisticsTaskCell

- (instancetype)initWithTask:(TaskType)type reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]) {
        
        [self setupSubviewWithTaskType:type];
    }
    
    return self;
}

- (void)setupSubviewWithTaskType:(TaskType)type {
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(15, 0, ScreenWidth - 30, 0)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 2;
    bgView.layer.shadowColor = [UIColor grayColor].CGColor;
    bgView.layer.shadowOffset = CGSizeMake(3, 3);
    bgView.layer.shadowOpacity = 0.3;
    [self.contentView addSubview:bgView];
    
    NSString *title = @"动销任务执行";
    if (type == DailyTask) {
        title = @"日常任务执行";
    }
    else if (type == LearningTask) {
        title = @"学习任务执行";
    }
    
    CGRect titleFrame = CGRectMake(0, 0, bgView.width, 40);
    UIView *titleView = [self titleViewWithFrame:titleFrame title:title];
    [bgView addSubview:titleView];
}

- (UIView *)titleViewWithFrame:(CGRect)rect title:(NSString *)title {
    
    UIView *titleView = [[UIView alloc] initWithFrame:rect];
    
    UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(15, 0, 3, 18)];
    colorView.centerY = titleView.height / 2;
    colorView.backgroundColor = kMainColor;
    [titleView addSubview:colorView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(colorView.maxX + 5, 0, titleView.width, titleView.height)];
    titleLabel.text = @"时间段";
    titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:17];
    titleLabel.textColor = kMainTextColor;
    [titleView addSubview:titleLabel];
    
    return titleView;
}

- (UIView *)dataViewWithFrame:(CGRect)rect type:(TaskType)type {
    
    UIView *dataView = [[UIView alloc] initWithFrame:rect];
    
    // 圆
    UIView *salesLabel = [[UIView alloc] init];
    salesLabel.frame = CGRectMake(30, 0, 88, 88);
    salesLabel.layer.cornerRadius = salesLabel.height / 2;
    salesLabel.layer.masksToBounds = YES;
    salesLabel.layer.borderWidth = 8;
    salesLabel.layer.borderColor = [UIColor colorWithHexString:@"0xE8E8EE"].CGColor;
    [dataView addSubview:salesLabel];
    
    // 完成百分比
    UILabel *completionLabel = [[UILabel alloc] init];
    completionLabel.frame = CGRectMake(0, 0, salesLabel.width, 60);
    completionLabel.text = @"47%";
    completionLabel.font = [UIFont systemFontOfSize:14];
    completionLabel.textColor = [UIColor colorWithHexString:@"0xF6733E"];
    completionLabel.textAlignment = NSTextAlignmentCenter;
    completionLabel.centerX = salesLabel.width / 2;
    completionLabel.centerY = salesLabel.height / 2;
    [salesLabel addSubview:completionLabel];
    
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:completionLabel.text];
    [attStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:39] range:NSMakeRange(0, 2)];
    completionLabel.attributedText = attStr;
    
    return dataView;
}

@end
