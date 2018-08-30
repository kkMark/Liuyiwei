//
//  LearningTaskCell.m
//  Lywsale
//
//  Created by M on 2018/8/30.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "LearningTaskCell.h"

@interface LearningTaskCell ()

/// 图标
@property (nonatomic, strong) UIImageView *iconImgView;
/// 标题
@property (nonatomic, strong) UILabel *titleLabel;
/// 天数
@property (nonatomic, strong) UILabel *dayLabel;
/// 备注
@property (nonatomic, strong) UILabel *remarkLabel;

@end

@implementation LearningTaskCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
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
    
    // 天数
    self.dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(bgView.width - 80 - spacing, 0, 80, 30)];
    self.dayLabel.text = @"10 天";
    self.dayLabel.font = [UIFont boldSystemFontOfSize:16];
    self.dayLabel.textColor = kMainTextColor;
    self.dayLabel.textAlignment = NSTextAlignmentRight;
    [bgView addSubview:self.dayLabel];
    
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:self.dayLabel.text];
    [attStr addAttribute:NSForegroundColorAttributeName value:kMainColor range:NSMakeRange(0, 2)];
    [attStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:30] range:NSMakeRange(0, 2)];
    self.dayLabel.attributedText = attStr;
    
    // 图标
    self.iconImgView = [[UIImageView alloc] initWithFrame:CGRectMake(spacing, spacing, 20, 18)];
    self.iconImgView.image = [UIImage imageNamed:@"TestTaskImg"];
    [bgView addSubview:self.iconImgView];
    
    // 标题
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.iconImgView.maxX + 10, 0, 0, 20)];
    self.titleLabel.centerY = self.iconImgView.centerY;
    self.titleLabel.text = @"博路定动销任务";
    self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    self.titleLabel.textColor = kMainTextColor;
    self.titleLabel.width = bgView.width - self.titleLabel.x - self.dayLabel.width - spacing * 2;
    [bgView addSubview:self.titleLabel];
 
    self.remarkLabel = [[UILabel alloc] initWithFrame:CGRectMake(spacing, self.titleLabel.maxY + 5, 0, 0)];
    self.remarkLabel.text = @"完成博路定知识培训，即可参与博路定动销活动！";
    self.remarkLabel.font = [UIFont systemFontOfSize:13];
    self.remarkLabel.textColor = kMainTextColor;
    self.remarkLabel.numberOfLines = 0;
    self.remarkLabel.width = bgView.width - self.dayLabel.width - spacing * 2;
    self.remarkLabel.height = [self.remarkLabel getTextHeight];
    [bgView addSubview:self.remarkLabel];
    
    bgView.height = self.remarkLabel.maxY + spacing;
    self.dayLabel.centerY = bgView.height / 2;
    self.cellHeight = bgView.height;
}

@end
