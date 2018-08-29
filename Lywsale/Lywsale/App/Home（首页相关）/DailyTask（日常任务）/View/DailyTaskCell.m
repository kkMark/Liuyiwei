//
//  DailyTaskCell.m
//  Lywsale
//
//  Created by M on 2018/8/29.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "DailyTaskCell.h"

@interface DailyTaskCell ()

/// 图标
@property (nonatomic, strong) UIImageView *iconImgView;
/// 标题
@property (nonatomic, strong) UILabel *titleLabel;
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
    bgView.layer.borderWidth = 0.3;
    bgView.layer.borderColor = kLineColor.CGColor;
    [self.contentView addSubview:bgView];
    
    // 图标
    self.iconImgView = [[UIImageView alloc] initWithFrame:CGRectMake(spacing, spacing, 20, 18)];
    self.iconImgView.image = [UIImage imageNamed:@"TestTaskImg"];
    [bgView addSubview:self.iconImgView];
    
    // 时间
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 20)];
    self.timeLabel.centerY = self.iconImgView.centerY;
    self.timeLabel.text = @"2018-05-18 18:11";
    self.timeLabel.font = [UIFont systemFontOfSize:9];
    self.timeLabel.textColor = [UIColor lightGrayColor];
    self.timeLabel.width = [self.timeLabel getTextWidth];
    self.timeLabel.x = bgView.width - self.timeLabel.width - 10;
    [bgView addSubview:self.timeLabel];
    
    // 标题
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.iconImgView.maxX + 10, 0, 0, 20)];
    self.titleLabel.centerY = self.iconImgView.centerY;
    self.titleLabel.text = @"博路定动销任务";
    self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    self.titleLabel.textColor = kMainTextColor;
    self.titleLabel.width = bgView.width - self.titleLabel.x - self.timeLabel.width;
    [bgView addSubview:self.titleLabel];
    
    // 分割线
    UIView *lineView = [[UILabel alloc] initWithFrame:CGRectMake(0, self.iconImgView.maxY + spacing, ScreenWidth, 0.3)];
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
