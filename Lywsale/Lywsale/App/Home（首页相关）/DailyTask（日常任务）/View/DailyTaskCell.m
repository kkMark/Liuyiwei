//
//  DailyTaskCell.m
//  Lywsale
//
//  Created by M on 2018/8/29.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "DailyTaskCell.h"

@interface DailyTaskCell ()

/// 标题
@property (nonatomic, strong) UILabel *nameLabel;
/// 类型
@property (nonatomic, strong) UILabel *typeLabel;
/// 时间
@property (nonatomic, strong) UILabel *timeLabel;
/// 执行方式
@property (nonatomic, strong) UILabel *wayLabel;
/// 执行收益
@property (nonatomic, strong) UILabel *earningsLabel;
/// 截止时间
@property (nonatomic, strong) UILabel *stopTImeLabel;
/// 操作按钮
@property (nonatomic, strong) UIButton *operationBtn;

@end

@implementation DailyTaskCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    float spacing = 15;
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(20, 0, ScreenWidth - 40, 0)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 5;
    bgView.layer.masksToBounds = YES;
    bgView.layer.borderWidth = 1;
    bgView.layer.borderColor = kLineColor.CGColor;
    [self.contentView addSubview:bgView];
    
    // 标题
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(spacing, spacing, 0, 20)];
    self.nameLabel.text = @"某小姐";
    self.nameLabel.font = [UIFont boldSystemFontOfSize:14];
    self.nameLabel.textColor = kMainTextColor;
    self.nameLabel.width = [self.nameLabel getTextWidth];
    self.nameLabel.height = [self.nameLabel getTextHeight];
    [bgView addSubview:self.nameLabel];
    
    // 类型
    self.typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.nameLabel.maxX + 5, 0, 0, 20)];
    self.typeLabel.text = @"购药回访";
    self.typeLabel.font = [UIFont systemFontOfSize:10];
    self.typeLabel.textColor = kMainColor;
    self.typeLabel.width = [self.typeLabel getTextWidth];
    self.typeLabel.height = [self.typeLabel getTextHeight];
    self.typeLabel.y = self.nameLabel.maxY - self.typeLabel.height;
    [bgView addSubview:self.typeLabel];
    
    // 时间
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 20)];
    self.timeLabel.centerY = self.nameLabel.centerY;
    self.timeLabel.text = @"2018-05-18 18:11";
    self.timeLabel.font = [UIFont systemFontOfSize:12];
    self.timeLabel.textColor = [UIColor lightGrayColor];
    self.timeLabel.width = [self.timeLabel getTextWidth];
    self.timeLabel.x = bgView.width - self.timeLabel.width - 10;
    [bgView addSubview:self.timeLabel];
    
    // 分割线
    UIView *lineView = [[UILabel alloc] initWithFrame:CGRectMake(0, self.nameLabel.maxY + spacing, ScreenWidth, 0.3)];
    lineView.backgroundColor = kLineColor;
    [bgView addSubview:lineView];
    
    // 操作按钮
    self.operationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.operationBtn.frame = CGRectMake(bgView.width - spacing - 70, 0, 70, 30);
    self.operationBtn.backgroundColor = kMainColor;
    self.operationBtn.layer.cornerRadius = 5;
    self.operationBtn.layer.masksToBounds = YES;
    self.operationBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [self.operationBtn setTitle:@"回访" forState:UIControlStateNormal];
    [self.operationBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bgView addSubview:self.operationBtn];
    
    NSArray *titles = @[@"药品：博路定、美能", @"日期：2018-05-13  18:11"];
    for (int i = 0; i < titles.count; i++) {
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(spacing, (lineView.maxY + spacing) + (25 * i), bgView.width / 3 * 2, 15)];
        titleLabel.text = titles[i];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = kMainTextColor;
        [bgView addSubview:titleLabel];
        
        bgView.height = titleLabel.maxY + spacing;
    }
    
    self.operationBtn.centerY = (bgView.height - lineView.maxY) / 2 + lineView.maxY;
    self.cellHeight = bgView.height;
}

@end
