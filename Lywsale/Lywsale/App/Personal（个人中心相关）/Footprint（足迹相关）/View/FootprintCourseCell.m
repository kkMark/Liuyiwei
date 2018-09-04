//
//  FootprintCourseCell.m
//  Lywsale
//
//  Created by M on 2018/8/25.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "FootprintCourseCell.h"

@interface FootprintCourseCell ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *countLabel;
@property (nonatomic, strong) UIView *progressView;
@property (nonatomic, strong) UIView *readStateView;
@property (nonatomic, strong) UILabel *readTimeLabel;

@end

@implementation FootprintCourseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    UIImage *img = [UIImage imageNamed:@"TestImg"];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
    imgView.frame = CGRectMake(20, 15, 70 * 1.16, 70);
    [self.contentView addSubview:imgView];
    
    // 学习进度
    self.progressView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 35)];
    self.progressView.x = ScreenWidth - 15 - self.progressView.width;
    self.progressView.centerY = imgView.centerY;
    [self.contentView addSubview:self.progressView];
    for (int i = 0; i < 2; i++) {
        
        UIView *tempVieww = [[UIView alloc] initWithFrame:CGRectMake((5 + self.progressView.height) * i, 0, 0, 0)];
        tempVieww.width = tempVieww.height = self.progressView.height;
        tempVieww.backgroundColor = i == 0 ? kMainColor : kMainTextColor;
        tempVieww.layer.cornerRadius = tempVieww.height / 2;
        tempVieww.layer.masksToBounds = YES;
        [self.progressView addSubview:tempVieww];
    }
    
    // 阅读状态
    self.readStateView = [[UIView alloc] initWithFrame:self.progressView.frame];
    self.readStateView.hidden = YES;
    [self.contentView addSubview:self.readStateView];
    
    // 阅读图片
    UIImage *readImg = [UIImage imageNamed:@"ReadTime"];
    UIImageView *readImgView = [[UIImageView alloc] initWithImage:readImg];
    readImgView.frame = CGRectMake(0, 0, 15, 15);
    readImgView.centerY = self.readStateView.height / 2;
    [self.readStateView addSubview:readImgView];
    
    // 阅读时间
    self.readTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(readImgView.maxX + 5, 0, 0, self.readStateView.height)];
    self.readTimeLabel.width = self.readStateView.width - self.readTimeLabel.x;
    self.readTimeLabel.text = @"17分钟";
    self.readTimeLabel.font = [UIFont systemFontOfSize:14];
    self.readTimeLabel.textColor = kMainTextColor;
    [self.readStateView addSubview:self.readTimeLabel];
    
    // 名称
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(imgView.maxX + 10, 17.5, 0, 15)];
    self.nameLabel.width = ScreenWidth - self.nameLabel.x - (self.progressView.width + 15);
    self.nameLabel.text = @"博路定单品学习课件";
    self.nameLabel.font = [UIFont systemFontOfSize:14];
    self.nameLabel.textColor = kMainTextColor;
    [self.contentView addSubview:self.nameLabel];
    
    // 更新时间
    self.timeLabel = [[UILabel alloc] initWithFrame:self.nameLabel.frame];
    self.timeLabel.y = self.nameLabel.maxY + 15;
    self.timeLabel.text = @"1天前更新";
    self.timeLabel.font = [UIFont systemFontOfSize:14];
    self.timeLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.timeLabel];
    
    // 查看次数
    self.countLabel = [[UILabel alloc] initWithFrame:self.nameLabel.frame];
    self.countLabel.y = self.timeLabel.maxY + 5;
    self.countLabel.text = @"查看次数 1000";
    self.countLabel.font = [UIFont systemFontOfSize:14];
    self.countLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.countLabel];
}

- (void)setIsCollect:(BOOL)isCollect {
    
    self.readStateView.hidden = !isCollect;
    self.progressView.hidden = isCollect;
}

@end
