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
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
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
    
    CGRect frame = CGRectMake(0, 0, bgView.width, 40);
    UIView *titleView = [self titleViewWithFrame:frame title:title];
    [bgView addSubview:titleView];
    
    frame.origin.y = titleView.maxY;
    UIView *dataView = [self dataViewWithFrame:frame type:type];
    [bgView addSubview:dataView];
    
    bgView.height = dataView.maxY;
    self.cellHeight = dataView.maxY;
}

- (UIView *)titleViewWithFrame:(CGRect)rect title:(NSString *)title {
    
    UIView *titleView = [[UIView alloc] initWithFrame:rect];
    
    UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(15, 0, 3, 18)];
    colorView.centerY = titleView.height / 2;
    colorView.backgroundColor = kMainColor;
    [titleView addSubview:colorView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(colorView.maxX + 5, 0, titleView.width, titleView.height)];
    titleLabel.text = title;
    titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:17];
    titleLabel.textColor = kMainTextColor;
    [titleView addSubview:titleLabel];
    
    return titleView;
}

- (UIView *)dataViewWithFrame:(CGRect)rect type:(TaskType)type {
    
    UIView *dataView = [[UIView alloc] initWithFrame:rect];
    
    // 圆
    UIView *salesView = [[UIView alloc] init];
    salesView.frame = CGRectMake(30, 5, 136, 136);
    salesView.centerX = dataView.width / 4;
    salesView.layer.cornerRadius = salesView.height / 2;
    salesView.layer.masksToBounds = YES;
    salesView.layer.borderWidth = 8;
    salesView.layer.borderColor = [UIColor colorWithHexString:@"0xE8E8EE"].CGColor;
    [dataView addSubview:salesView];
    
    // 完成百分比
    UILabel *completionLabel = [[UILabel alloc] init];
    completionLabel.frame = CGRectMake(0, 0, salesView.width, 60);
    completionLabel.text = @"47%";
    completionLabel.font = [UIFont systemFontOfSize:14];
    completionLabel.textColor = [UIColor colorWithHexString:@"0xF6733E"];
    completionLabel.textAlignment = NSTextAlignmentCenter;
    completionLabel.centerX = salesView.width / 2;
    completionLabel.centerY = salesView.height / 2;
    [salesView addSubview:completionLabel];
    
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:completionLabel.text];
    [attStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:39] range:NSMakeRange(0, 2)];
    completionLabel.attributedText = attStr;
    
    // 内容
    NSArray *titles = @[@"花式堆头", @"晒陈列", @"晒票数", @"晒POP", @"晒朋友圈"];
    if (type == DongXiaoTask) {
        
        NSMutableArray *tempArr = [NSMutableArray array];
        for (NSString *title in titles) {
            
            NSString *tempString = [NSString stringWithFormat:@"%@/审核通过数", title];
            [tempArr addObject:tempString];
        }
        
        titles = tempArr;
    }
    else {
        
        titles = @[@"已完成/未完成"];
    }
    
    CGFloat maxY = 0;
    for (int i = 0; i < titles.count; i++) {
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(salesView.maxX + 30, maxY, 0, 0)];
        titleLabel.text = titles[i];
        titleLabel.font = [UIFont systemFontOfSize:11];
        titleLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
        titleLabel.height = [titleLabel getTextHeight];
        titleLabel.width = [titleLabel getTextWidth];
        [dataView addSubview:titleLabel];
        
        for (int a = 0; a < 2; a++) {
            
            if (titles.count == 1) {

                titleLabel.centerY = salesView.centerY - 10;
            }
            
            UILabel *totalLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleLabel.x + 5, titleLabel.maxY + 5, 35, 0)];
            totalLabel.text = @"60";
            totalLabel.font = [UIFont systemFontOfSize:11];
            totalLabel.textColor = kMainTextColor;
            totalLabel.textAlignment = NSTextAlignmentCenter;
            totalLabel.height = [totalLabel getTextHeight];
            [dataView addSubview:totalLabel];
            
            if (a == 1) {
                
                totalLabel.x += 35;
                totalLabel.textColor = [UIColor colorWithHexString:@"0xF6733E"];
            }
            
            maxY = totalLabel.maxY + 15;
        }
    }
    
    if (titles.count == 1) {
        
        dataView.height = salesView.maxY + 15;
    }
    else {
        
        dataView.height = maxY;
        salesView.centerY = dataView.height / 2;
    }

    return dataView;
}

@end
