//
//  PersonalHeaderView.m
//  Lywsale
//
//  Created by M on 2018/9/4.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "PersonalHeaderView.h"

@interface PersonalHeaderView ()

/// 头像
@property (nonatomic, strong) UIImageView *headImgView;
/// 昵称
@property (nonatomic, strong) UILabel *nicknameLabel;
/// 设置按钮
@property (nonatomic, strong) UIButton *settingBtn;

@end

@implementation PersonalHeaderView

- (void)setupSubviews {
    
    // 背景
    UIImage *bgImg = [UIImage imageNamed:@"personal_bgImg"];
    UIImageView *bgImgView = [[UIImageView alloc] initWithFrame:CGRectMake(-1, -1, ScreenWidth + 2, bgImg.size.height / bgImg.size.width * ScreenWidth)];
    bgImgView.image = bgImg;
    [self addSubview:bgImgView];
    
    // 头像
    self.headImgView = [[UIImageView alloc] initWithFrame:CGRectMake(20, self.statusBarHeight + 16, 50, 50)];
    self.headImgView.image = [UIImage imageNamed:@"TestHeadImg"];
    [bgImgView addSubview:self.headImgView];
    
    // 用户昵称
    self.nicknameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.headImgView.maxX + 19, 0, 80, 20)];
    self.nicknameLabel.centerY = self.headImgView.centerY - 10;
    self.nicknameLabel.text = GetUserDefault(UserName);
    self.nicknameLabel.font = [UIFont systemFontOfSize:15];
    self.nicknameLabel.textColor = [UIColor whiteColor];
    self.nicknameLabel.height = [self.nicknameLabel getTextHeight];
    [bgImgView addSubview:self.nicknameLabel];
    
    // 星星
    UILabel *xxLabel = [[UILabel alloc] initWithFrame:self.nicknameLabel.frame];
    xxLabel.y = self.nicknameLabel.maxY + 5;
    xxLabel.height = 15;
    xxLabel.text = @"★★★★★";
    xxLabel.font = [UIFont boldSystemFontOfSize:12];
    xxLabel.textColor = [UIColor whiteColor];
    [bgImgView addSubview:xxLabel];
    
    // 设置按钮
    self.settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.settingBtn.frame = CGRectMake(ScreenWidth - 70, 0, 50, 50);
    self.settingBtn.centerY = self.headImgView.centerY;
    [self.settingBtn setImage:[UIImage imageNamed:@"personal_setting"] forState:UIControlStateNormal];
    [bgImgView addSubview:self.settingBtn];
    
    // 用户信息
    UIView *userInfoBgView = [[UIView alloc] initWithFrame:CGRectMake(20, self.headImgView.maxY + 10, ScreenWidth - 40, 140)];
    userInfoBgView.backgroundColor = [UIColor whiteColor];
    userInfoBgView.layer.cornerRadius = 5;
    userInfoBgView.layer.shadowColor = kMainColor.CGColor;
    userInfoBgView.layer.shadowOffset = CGSizeMake(3, 7);
    userInfoBgView.layer.shadowOpacity = 0.1;
    [self addSubview:userInfoBgView];
    
    // 总和
    for (int i = 0; i < 2; i++) {
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth / 2 * i + 25, 16, 100, 0)];
        titleLabel.text = i == 0 ? @"总积分" : @"总金额（元）";
        titleLabel.font = [UIFont systemFontOfSize:12];
        titleLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
        titleLabel.height = [titleLabel getTextHeight];
        [userInfoBgView addSubview:titleLabel];
        
        UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleLabel.x, titleLabel.maxY + 10, userInfoBgView.width / 2, 0)];
        numberLabel.text = i == 0 ? @"300" : @"60000.00";
        numberLabel.font = kNumberFont(22);
        numberLabel.textColor = kMainTextColor;
        numberLabel.height = [numberLabel getTextHeight];
        [userInfoBgView addSubview:numberLabel];
     
        if (i == 1) {
            
            float y = numberLabel.maxY + 20;

            // 可用金额标题
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, y, 100, 0)];
            titleLabel.text = @"可用金额（元）";
            titleLabel.font = [UIFont systemFontOfSize:12];
            titleLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
            titleLabel.height = [titleLabel getTextHeight];
            [userInfoBgView addSubview:titleLabel];
            
            // 金额
            UILabel *amountLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleLabel.x, titleLabel.maxY + 10, userInfoBgView.width / 2, 0)];
            amountLabel.text = @"50000.00";
            amountLabel.font = kNumberFont(22);
            amountLabel.textColor = kMainColor;
            amountLabel.height = [amountLabel getTextHeight];
            [userInfoBgView addSubview:amountLabel];
            
            // 提现按钮
            UIButton *extractBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            extractBtn.frame = CGRectMake(numberLabel.x, 0, 90, 25);
            extractBtn.centerY = titleLabel.centerY + 15;
            extractBtn.layer.borderWidth = 1.5;
            extractBtn.layer.borderColor = kMainColor.CGColor;
            extractBtn.layer.cornerRadius = extractBtn.height / 2;
            extractBtn.layer.masksToBounds = YES;
            extractBtn.titleLabel.font = [UIFont systemFontOfSize:14];
            [extractBtn setTitle:@"申请提现" forState:UIControlStateNormal];
            [extractBtn setTitleColor:kMainColor forState:UIControlStateNormal];
            [userInfoBgView addSubview:extractBtn];
        }
    }
    
    self.viewHeight = userInfoBgView.maxY + 10;
}

@end
