//
//  DailyTaskManagerCell.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/8.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "DailyTaskManagerCell.h"

@interface DailyTaskManagerCell ()

/// 标题
@property (nonatomic, strong) UILabel *titleLabel;
/// 任务数量
@property (nonatomic, strong) UILabel *numberLabel;
/// 状态图标
@property (nonatomic, strong) UIImageView *stateImgView;

@end

@implementation DailyTaskManagerCell

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
    UIImage *taskBgImg = [UIImage imageNamed:@"taskBgImg_2"];
    UIImageView *taskBgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(taskBgImgx, 0, 0, 0)];
    taskBgImgView.image = taskBgImg;
    taskBgImgView.size = taskBgImg.size;
    [bgView addSubview:taskBgImgView];
    
    UILabel *taskLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, taskBgImgView.width, taskBgImgView.height)];
    taskLabel.text = @"新任务";
    taskLabel.font = [UIFont systemFontOfSize:12];
    taskLabel.textColor = [UIColor whiteColor];
    taskLabel.textAlignment = NSTextAlignmentCenter;
    [taskBgImgView addSubview:taskLabel];
    
    taskBgImgx = taskBgImgView.maxX + 10;
    taskBgImgMaxY = taskBgImgView.maxY + 10;
    
    // 标题
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(spacing, taskBgImgMaxY, bgView.width / 2, 20)];
    self.titleLabel.text = @"增值服务";
    self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    self.titleLabel.textColor = kMainTextColor;
    [bgView addSubview:self.titleLabel];
    
    // 数量
    self.numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.titleLabel.maxX, 0, 0, 30)];
    self.numberLabel.text = @"待跟进 10 个";
    self.numberLabel.font = [UIFont systemFontOfSize:14];
    self.numberLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
    self.numberLabel.textAlignment = NSTextAlignmentRight;
    self.numberLabel.centerY = self.titleLabel.centerY;
    self.numberLabel.width = bgView.width - self.numberLabel.x - 15;
    [bgView addSubview:self.numberLabel];
    
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:self.numberLabel.text];
    NSRange range = NSMakeRange(attStr.length - 4, 2);
    [attStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:25] range:range];
    [attStr addAttribute:NSForegroundColorAttributeName value:kMainColor range:range];
    self.numberLabel.attributedText = attStr;
    self.numberLabel.height = [self.numberLabel getTextHeight];
    
    bgView.height = self.numberLabel.maxY + 20;
    int imgWidth = bgView.height - 15;
    UIImage *stateImg = [UIImage imageNamed:@"task_dispose"];
    self.stateImgView = [[UIImageView alloc] initWithImage:stateImg];
    self.stateImgView.frame = CGRectMake(0, bgView.height - imgWidth - 5, imgWidth, imgWidth);
    self.stateImgView.image = stateImg;
    self.stateImgView.x = bgView.width - self.stateImgView.width * 2;
    [bgView addSubview:self.stateImgView];
    
    self.cellHeight = bgView.height;
}

@end
