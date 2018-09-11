//
//  SalesTaskCell.m
//  Lywsale
//
//  Created by M on 2018/8/28.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "SalesTaskCell.h"

@interface SalesTaskCell ()

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

@implementation SalesTaskCell

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
    
    UIImage *taskBgImg = [UIImage imageNamed:@"taskBgImg_1"];
    UIImageView *taskBgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 0, 0)];
    taskBgImgView.image = taskBgImg;
    taskBgImgView.size = taskBgImg.size;
    [bgView addSubview:taskBgImgView];
    
    UILabel *taskLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, taskBgImgView.width, taskBgImgView.height)];
    taskLabel.text = @"内部任务";
    taskLabel.font = [UIFont systemFontOfSize:12];
    taskLabel.textColor = [UIColor whiteColor];
    taskLabel.textAlignment = NSTextAlignmentCenter;
    [taskBgImgView addSubview:taskLabel];
    
    UIImage *newTaskBgImg = [UIImage imageNamed:@"taskBgImg_2"];
    UIImageView *newTaskBgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(taskBgImgView.maxX + 10, 0, 0, 0)];
    newTaskBgImgView.image = newTaskBgImg;
    newTaskBgImgView.size = newTaskBgImg.size;
    [bgView addSubview:newTaskBgImgView];
    
    UILabel *newTaskLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, newTaskBgImgView.width, newTaskBgImgView.height)];
    newTaskLabel.text = @"新任务";
    newTaskLabel.font = [UIFont systemFontOfSize:12];
    newTaskLabel.textColor = [UIColor whiteColor];
    newTaskLabel.textAlignment = NSTextAlignmentCenter;
    [newTaskBgImgView addSubview:newTaskLabel];
    
    // 标题
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(spacing, taskBgImgView.maxY + 10, 0, 20)];
    self.titleLabel.text = @"博路定动销任务";
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
    
    UIImage *stateImg = [UIImage imageNamed:@"task_complete"];
    self.stateImgView = [[UIImageView alloc] initWithImage:stateImg];
    self.stateImgView.image = stateImg;
    self.stateImgView.size = stateImg.size;
    self.stateImgView.x = bgView.width - stateImg.size.width - 15;
    [bgView addSubview:self.stateImgView];
    
    // 分割线
    UIView *lineView = [[UILabel alloc] initWithFrame:CGRectMake(0, self.titleLabel.maxY + 10, bgView.width, 0.3)];
    lineView.backgroundColor = kLineColor;
    [bgView addSubview:lineView];
    
    NSArray *titles = @[@"执行收益：", @"执行方式：", @"截止时间："];
    NSArray *contents = @[@"1-3元/张", @"晒票", @"2018-06-18 24:00"];
    for (int i = 0; i < 3; i++) {
        
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
        
        if (i == 1) {
            self.stateImgView.centerY = titleLabel.centerY;
        }
        
        bgView.height = titleLabel.maxY + spacing;
    }
    
    self.cellHeight = bgView.height;
}

@end
