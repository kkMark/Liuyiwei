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
/// 时间
@property (nonatomic, strong) UILabel *timeLabel;
/// 备注
@property (nonatomic, strong) UILabel *remarkLabel;
/// 课程
@property (nonatomic, strong) UIImageView *learningBgImgView;
/// 状态图标
@property (nonatomic, strong) UIImageView *stateImgView;
/// 背景
@property (nonatomic, strong) UIView *bgView;

@end

@implementation LearningTaskCell
@synthesize bgView;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    float spacing = 15;
    
    bgView = [[UIView alloc] initWithFrame:CGRectMake(15, 0, ScreenWidth - 30, 0)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 2;
    bgView.layer.shadowColor = [UIColor grayColor].CGColor;
    bgView.layer.shadowOffset = CGSizeMake(3, 3);
    bgView.layer.shadowOpacity = 0.3;
    [self.contentView addSubview:bgView];
    
    // 新课程
    UIImage *taskBgImg = [UIImage imageNamed:@"taskBgImg_2"];
    self.learningBgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 0, 0)];
    self.learningBgImgView.image = taskBgImg;
    self.learningBgImgView.size = taskBgImg.size;
    [bgView addSubview:self.learningBgImgView];
    
    UILabel *taskLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.learningBgImgView.width, self.learningBgImgView.height)];
    taskLabel.text = @"新课程";
    taskLabel.font = [UIFont systemFontOfSize:12];
    taskLabel.textColor = [UIColor whiteColor];
    taskLabel.textAlignment = NSTextAlignmentCenter;
    [self.learningBgImgView addSubview:taskLabel];
    
    // 标题
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(spacing, self.learningBgImgView.maxY + 10, 0, 20)];
    self.titleLabel.text = @"博路定用药培训";
    self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    self.titleLabel.textColor = kMainTextColor;
    self.titleLabel.width = bgView.width - self.titleLabel.x - self.timeLabel.width;
    [bgView addSubview:self.titleLabel];
    
    // 时间
    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 20)];
    self.timeLabel.centerY = self.titleLabel.centerY;
    self.timeLabel.text = @"2018-05-18 18:11";
    self.timeLabel.font = [UIFont systemFontOfSize:12];
    self.timeLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
    self.timeLabel.width = [self.timeLabel getTextWidth] + 30;
    self.timeLabel.textAlignment = NSTextAlignmentRight;
    self.timeLabel.x = bgView.width - self.timeLabel.width - 10;
    [bgView addSubview:self.timeLabel];
    
    // 分割线
    UIView *lineView = [[UILabel alloc] initWithFrame:CGRectMake(0, self.titleLabel.maxY + 10, bgView.width, 0.3)];
    lineView.backgroundColor = kLineColor;
    [bgView addSubview:lineView];
    
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
    
    // 备注
    self.remarkLabel = [[UILabel alloc] initWithFrame:CGRectMake(spacing, lineView.maxY + spacing, 0, 35)];
    self.remarkLabel.text = @"完成博路定知识培训，即可参与博路定动销活动！";
    self.remarkLabel.font = [UIFont systemFontOfSize:13];
    self.remarkLabel.textColor = kMainTextColor;
    self.remarkLabel.numberOfLines = 0;
    self.remarkLabel.width = bgView.width - self.dayLabel.width - spacing * 2;
    self.dayLabel.centerY = self.remarkLabel.centerY;
    [bgView addSubview:self.remarkLabel];
    
    // 获取高度
    bgView.height = self.remarkLabel.maxY + spacing;
    
    // 状态图
    UIImage *stateImg = [UIImage imageNamed:@"task_complete"];
    self.stateImgView = [[UIImageView alloc] initWithImage:stateImg];
    self.stateImgView.image = stateImg;
    self.stateImgView.size = stateImg.size;
    self.stateImgView.x = bgView.width - stateImg.size.width - 10;
    self.stateImgView.y = bgView.height - stateImg.size.height - 10;
    [bgView addSubview:self.stateImgView];
    
    self.cellHeight = bgView.height;
    
    self.dayLabel.hidden = arc4random() % 2;
    self.stateImgView.hidden = !self.dayLabel.hidden;
}

- (void)setModel:(LearningTaskModel *)model {
    
    _model = model;
    
    self.titleLabel.text = model.trainName;
    self.timeLabel.text = model.startDate;
    self.remarkLabel.text = model.description;
    
    float height = [self.remarkLabel getTextHeight];
    self.remarkLabel.height = height > 35 ? height : 35;
    
    self.dayLabel.centerY = self.remarkLabel.centerY;
    self.bgView.height = self.remarkLabel.maxY + 15;
    self.cellHeight = bgView.height;
    self.stateImgView.centerY = self.cellHeight / 2;
    
    self.dayLabel.hidden = model.taskType;
    self.stateImgView.hidden = !self.dayLabel.hidden;
}

@end
