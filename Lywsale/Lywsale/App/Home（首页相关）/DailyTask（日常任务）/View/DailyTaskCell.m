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
@property (nonatomic, strong) UILabel *titleLabel;
/// 时间
@property (nonatomic, strong) UILabel *timeLabel;
/// 执行方式
@property (nonatomic, strong) UILabel *wayLabel;
/// 执行收益
@property (nonatomic, strong) UILabel *earningsLabel;
/// 截止时间
@property (nonatomic, strong) UILabel *stopTImeLabel;
/// 状态图标
@property (nonatomic, strong) UIImageView *stateImgView;

@end

@implementation DailyTaskCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    float spacing = 15;
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(15, 0, ScreenWidth - 30, 0)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 2;
    bgView.layer.shadowColor = [UIColor grayColor].CGColor;
    bgView.layer.shadowOffset = CGSizeMake(3, 3);
    bgView.layer.shadowOpacity = 0.3;
    [self.contentView addSubview:bgView];
    
    int taskBgImgx = 10;
    int taskBgImgMaxY = 0;
    for (int i = 0; i < 3; i++) {
        
        NSString *imgString = [NSString stringWithFormat:@"taskBgImg_%d", i + 1];
        UIImage *taskBgImg = [UIImage imageNamed:imgString];
        UIImageView *taskBgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(taskBgImgx, 0, 0, 0)];
        taskBgImgView.image = taskBgImg;
        taskBgImgView.size = taskBgImg.size;
        [bgView addSubview:taskBgImgView];
        
        UILabel *taskLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, taskBgImgView.width, taskBgImgView.height)];
        taskLabel.text = @"内部任务";
        taskLabel.font = [UIFont systemFontOfSize:12];
        taskLabel.textColor = [UIColor whiteColor];
        taskLabel.textAlignment = NSTextAlignmentCenter;
        [taskBgImgView addSubview:taskLabel];
        
        taskBgImgx = taskBgImgView.maxX + 10;
        taskBgImgMaxY = taskBgImgView.maxY + 10;
    }
    
    // 标题
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(spacing, taskBgImgMaxY, 0, 20)];
    self.titleLabel.text = @"陈小姐";
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
    self.timeLabel.width = [self.timeLabel getTextWidth];
    self.timeLabel.x = bgView.width - self.timeLabel.width - 10;
    [bgView addSubview:self.timeLabel];
    
    // 分割线
    UIView *lineView = [[UILabel alloc] initWithFrame:CGRectMake(0, self.titleLabel.maxY + 10, bgView.width, 0.3)];
    lineView.backgroundColor = kLineColor;
    [bgView addSubview:lineView];
    
    NSArray *titles = @[@"药品：", @"时间："];
    NSArray *contents = @[@"博路定", @"2018-06-18 24:00"];
    for (int i = 0; i < 2; i++) {
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(spacing, (lineView.maxY + spacing) + (25 * i), 0, 15)];
        titleLabel.text = titles[i];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
        titleLabel.width = [titleLabel getTextWidth];
        [bgView addSubview:titleLabel];
        
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleLabel.maxX, titleLabel.y, 0, 15)];
        contentLabel.text = contents[i];
        contentLabel.font = [UIFont systemFontOfSize:14];
        contentLabel.textColor = kMainTextColor;
        contentLabel.width = [contentLabel getTextWidth];
        [bgView addSubview:contentLabel];
        bgView.height = titleLabel.maxY + spacing;
    }
    
    int imgWidth = bgView.height - lineView.maxY - 10;
    UIImage *stateImg = [UIImage imageNamed:@"task_dispose"];
    self.stateImgView = [[UIImageView alloc] initWithImage:stateImg];
    self.stateImgView.frame = CGRectMake(0, bgView.height - imgWidth - 5, imgWidth, imgWidth);
    self.stateImgView.image = stateImg;
    self.stateImgView.x = bgView.width - self.stateImgView.width - 15;
    [bgView addSubview:self.stateImgView];
    
    self.cellHeight = bgView.height;
}

@end
