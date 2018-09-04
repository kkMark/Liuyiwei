//
//  HomePageMenuView.m
//  Lywsale
//
//  Created by M on 2018/8/25.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "HomePageMenuView.h"

@interface HomePageMenuView ()

/// 头像
@property (nonatomic, strong) UIImageView *headImgView;
/// 昵称
@property (nonatomic, strong) UILabel *nicknameLabel;
/// 线条
@property (nonatomic, strong) UIView *lineView;

@end

@implementation HomePageMenuView

- (void)setupSubviews {
    
    // 头像
    self.headImgView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 45, 45)];
    self.headImgView.layer.masksToBounds = YES;
    self.headImgView.layer.cornerRadius = self.headImgView.height / 2;
    self.headImgView.image = [UIImage imageNamed:@"TestHeadImg"];
    self.headImgView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:self.headImgView];
    
    // 用户昵称
    self.nicknameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.headImgView.maxX + 15, self.headImgView.y + 15, 100, 20)];
    self.nicknameLabel.text = GetUserDefault(UserName);
    self.nicknameLabel.font = [UIFont boldSystemFontOfSize:14];
    self.nicknameLabel.textColor = kMainTextColor;
    [self addSubview:self.nicknameLabel];
    
    // 星星
    UILabel *xxLabel = [[UILabel alloc] initWithFrame:self.nicknameLabel.frame];
    xxLabel.x = self.nicknameLabel.maxX + 5;
    xxLabel.text = @"★★★★★";
    xxLabel.font = [UIFont boldSystemFontOfSize:16];
    xxLabel.textColor = kMainColor;
    [self addSubview:xxLabel];
    
    self.headerHeight = self.headImgView.maxY + 10;
    UIView *lineView = [[UILabel alloc] initWithFrame:CGRectMake(0, self.headerHeight - 0.3, ScreenWidth, 0.3)];
    lineView.backgroundColor = kLineColor;
    [self addSubview:lineView];
}

@end
