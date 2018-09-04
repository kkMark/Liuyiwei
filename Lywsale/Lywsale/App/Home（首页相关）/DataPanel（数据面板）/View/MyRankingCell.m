//
//  MyRankingCell.m
//  Lywsale
//
//  Created by M on 2018/9/4.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "MyRankingCell.h"

@interface MyRankingCell ()

/// 头像
@property (nonatomic, strong) UIImageView *headImgView;
/// 排名
@property (nonatomic, strong) UILabel *rankingLabel;
/// 昵称
@property (nonatomic, strong) UILabel *nicknameLabel;
/// 分数
@property (nonatomic, strong) UILabel *numberLabel;

@end

@implementation MyRankingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(15, 0, ScreenWidth - 30, 65)];
    [self.contentView addSubview:bgView];
    
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0, 0, bgView.width, bgView.height);
    gl.startPoint = CGPointMake(0, 0);
    gl.endPoint = CGPointMake(1, 1);
    gl.colors = @[(__bridge id)RGB(66, 133, 254).CGColor, (__bridge id)RGB(89, 88, 234).CGColor];
    gl.locations = @[@(0.0),@(1.0f)];
    [bgView.layer addSublayer:gl];
    
    // 排名
    self.rankingLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 13, 45, 0)];
    self.rankingLabel.text = @"4";
    self.rankingLabel.font = kNumberFont(22);
    self.rankingLabel.textColor = [UIColor whiteColor];
    self.rankingLabel.textAlignment = NSTextAlignmentCenter;
    self.rankingLabel.height = [self.rankingLabel getTextHeight] + 2;
    [bgView addSubview:self.rankingLabel];
    
    // 排名文本
    UILabel *rankingTitleLabel = [[UILabel alloc] initWithFrame:self.rankingLabel.frame];
    rankingTitleLabel.text = @"我的排名";
    rankingTitleLabel.font = [UIFont systemFontOfSize:10];
    rankingTitleLabel.textColor = [UIColor whiteColor];
    rankingTitleLabel.textAlignment = NSTextAlignmentCenter;
    rankingTitleLabel.y = self.rankingLabel.maxY + 2;
    rankingTitleLabel.height = [rankingTitleLabel getTextHeight];
    [bgView addSubview:rankingTitleLabel];

    // 头像
    self.headImgView = [[UIImageView alloc] initWithFrame:CGRectMake(rankingTitleLabel.maxX + 10, 0, 48, 48)];
    self.headImgView.centerY = bgView.height / 2;
    self.headImgView.layer.masksToBounds = YES;
    self.headImgView.layer.cornerRadius = self.headImgView.height / 2;
    self.headImgView.image = [UIImage imageNamed:@"TestHeadImg"];
    self.headImgView.contentMode = UIViewContentModeScaleAspectFill;
    [bgView addSubview:self.headImgView];
    
    // 用户昵称
    self.nicknameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.headImgView.maxX + 15, 0, 100, 20)];
    self.nicknameLabel.centerY = self.headImgView.centerY;
    self.nicknameLabel.text = GetUserDefault(UserName);
    self.nicknameLabel.font = [UIFont systemFontOfSize:15];
    self.nicknameLabel.textColor = [UIColor whiteColor];
    [bgView addSubview:self.nicknameLabel];
    
    // 分数
    self.numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 20)];
    self.numberLabel.x = bgView.width - self.numberLabel.width - 37;
    self.numberLabel.centerY = self.headImgView.centerY;
    self.numberLabel.text = @"25000";
    self.numberLabel.font = kNumberFont(18);
    self.numberLabel.textColor = [UIColor whiteColor];
    self.numberLabel.textAlignment = NSTextAlignmentRight;
    [bgView addSubview:self.numberLabel];
}

@end
