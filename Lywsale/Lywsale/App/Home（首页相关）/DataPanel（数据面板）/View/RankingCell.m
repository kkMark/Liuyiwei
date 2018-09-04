//
//  RankingCell.m
//  Lywsale
//
//  Created by M on 2018/9/4.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "RankingCell.h"

@interface RankingCell ()

@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) UIImageView *headerImgView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *countLabel;
@property (nonatomic, strong) UIImageView *rankingImgView;

@end

@implementation RankingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupSubviews];
    }
    
    return self;
}


- (void)setupSubviews {
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(25, 0, ScreenWidth - 50, 65)];
    bgView.backgroundColor = [UIColor colorWithHexString:@"0xEEF5FF"];
    [self.contentView addSubview:bgView];
    
    // 数字
    self.numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 40, 40)];
    self.numberLabel.font = kNumberFont(18);
    self.numberLabel.textColor = kMainTextColor;
    self.numberLabel.textAlignment = NSTextAlignmentCenter;
    self.numberLabel.centerY = bgView.height / 2;
    [bgView addSubview:self.numberLabel];
    
    // 排行图片
    self.rankingImgView = [[UIImageView alloc] initWithFrame:self.numberLabel.frame];
    self.rankingImgView.hidden = YES;
    [bgView addSubview:self.rankingImgView];
    
    // 头像
    self.headerImgView = [[UIImageView alloc] initWithFrame:CGRectMake(self.numberLabel.maxX + 5, 0, 40, 40)];
    self.headerImgView.image = [UIImage imageNamed:@"TestHeadImg"];
    self.headerImgView.layer.cornerRadius = self.headerImgView.height / 2;
    self.headerImgView.layer.masksToBounds = YES;
    self.headerImgView.centerY = bgView.height / 2;
    [bgView addSubview:self.headerImgView];
    
    // 昵称
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.headerImgView.maxX + 10, 5, ScreenWidth / 3, 40)];
    self.nameLabel.text = @"刘药师";
    self.nameLabel.font = [UIFont systemFontOfSize:14];
    self.nameLabel.textColor = kMainTextColor;
    self.nameLabel.centerY = bgView.height / 2;
    [bgView addSubview:self.nameLabel];
    
    // 数量
    self.countLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
    self.countLabel.x = bgView.width - 90;
    self.countLabel.centerY = bgView.height / 2;
    self.countLabel.font = kNumberFont(18);
    self.countLabel.textColor = kMainTextColor;
    self.countLabel.textAlignment = NSTextAlignmentRight;
    [bgView addSubview:self.countLabel];
}

- (void)setIndex:(NSInteger)index {
    
    if (index <= 3) {
        
        NSString *imgString = [NSString stringWithFormat:@"homepage_ranking_%zd", index];
        
        self.rankingImgView.hidden = NO;
        self.rankingImgView.image = [UIImage imageNamed:imgString];
    }
    else {
        
        self.rankingImgView.hidden = YES;
    }
    
    self.numberLabel.text = [NSString stringWithFormat:@"%zd", index];
    self.countLabel.text = [NSString stringWithFormat:@"%zd", 5000 - index * 100];
}

@end
