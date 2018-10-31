//
//  TrainingEvaluationCell.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/31.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "TrainingEvaluationCell.h"

@interface TrainingEvaluationCell ()

@property (nonatomic, strong) UIImageView *headerImgView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation TrainingEvaluationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {

    // 头像
    self.headerImgView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 30, 30)];
    self.headerImgView.image = [UIImage imageNamed:@"TestHeadImg"];
    [self.contentView addSubview:self.headerImgView];
    
    // 评分
    UIImageView *scoreImgView;
    for (int i = 0; i < 5; i++) {
        
        scoreImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"training_score_sel"]];
        scoreImgView.size = CGSizeMake(12, 12);
        scoreImgView.centerY = self.headerImgView.centerY;
        scoreImgView.x = ScreenWidth - 20 - 15 * i;
        [self.contentView addSubview:scoreImgView];
    }
    
    // 名字
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.headerImgView.maxX + 10, 15, 0, 15)];
    self.nameLabel.text = @"黑马青年";
    self.nameLabel.font = [UIFont systemFontOfSize:12];
    self.nameLabel.textColor = kMainTextColor;
    [self.nameLabel getWidthWithView:scoreImgView maxWidth:ScreenWidth];
    [self.contentView addSubview:self.nameLabel];

    // 日期
    self.dateLabel = [[UILabel alloc] initWithFrame:self.nameLabel.frame];
    self.dateLabel.y = self.nameLabel.maxY;
    self.dateLabel.text = @"2018-03-16";
    self.dateLabel.font = [UIFont systemFontOfSize:10];
    self.dateLabel.textColor = [UIColor colorWithHexString:@"0x999999"];
    [self.contentView addSubview:self.dateLabel];

    // 内容
    self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, self.headerImgView.maxY + 10, ScreenWidth - 30, 0)];
    self.contentLabel.text = @"课程内容很给力 适合中高级继续提高！加油加油↖(^ω^)↗";
    self.contentLabel.font = [UIFont systemFontOfSize:12];
    self.contentLabel.textColor = [UIColor colorWithHexString:@"0x999999"];
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.height = [self.contentLabel getTextHeight];
    [self.contentView addSubview:self.contentLabel];

    self.cellHeight = self.contentLabel.maxY + 15;
}

@end
