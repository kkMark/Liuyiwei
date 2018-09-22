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
/// 签到按钮
@property (nonatomic, strong) UIButton *signInBtn;

@end

@implementation HomePageMenuView

- (void)setupSubviews {

    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = self.frame;
    gl.startPoint = CGPointMake(0, 0);
    gl.endPoint = CGPointMake(1, 1);
    gl.colors = @[(__bridge id)RGB(66, 133, 254).CGColor, (__bridge id)RGB(89, 88, 234).CGColor];
    gl.locations = @[@(0.0),@(1.0f)];
    [self.layer addSublayer:gl];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.statusBarHeight + 15, ScreenWidth, 0)];
    titleLabel.text = @"首页";
    titleLabel.font = [UIFont boldSystemFontOfSize:18];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.height = [titleLabel getTextHeight];
    [self addSubview:titleLabel];
    
    // 头像
    self.headImgView = [[UIImageView alloc] initWithFrame:CGRectMake(16, titleLabel.maxY + 19, 48, 48)];
    self.headImgView.layer.masksToBounds = YES;
    self.headImgView.layer.cornerRadius = self.headImgView.height / 2;
    self.headImgView.image = [UIImage imageNamed:@"TestHeadImg"];
    self.headImgView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:self.headImgView];
    
    // 签到按钮
    self.signInBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.signInBtn.frame = CGRectMake(self.width - 16 - 55, 0, 55, 25);
    self.signInBtn.centerY = self.headImgView.centerY;
    self.signInBtn.layer.cornerRadius = self.signInBtn.height / 2;
    self.signInBtn.layer.masksToBounds = YES;
    self.signInBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.signInBtn.layer.borderWidth = 1;
    self.signInBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.signInBtn setTitle:@"签到" forState:UIControlStateNormal];
    [self.signInBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[self.signInBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [self goViewController:@""];
    }];
    [self addSubview:self.signInBtn];
    
    // 用户昵称
    self.nicknameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.headImgView.maxX + 19, 0, 80, 20)];
    self.nicknameLabel.centerY = self.headImgView.centerY - 10;
    self.nicknameLabel.text = GetUserDefault(UserName);
    self.nicknameLabel.font = [UIFont systemFontOfSize:15];
    self.nicknameLabel.textColor = [UIColor whiteColor];
    self.nicknameLabel.height = [self.nicknameLabel getTextHeight];
    [self addSubview:self.nicknameLabel];
    
    // 星星
    UILabel *xxLabel = [[UILabel alloc] initWithFrame:self.nicknameLabel.frame];
    xxLabel.y = self.nicknameLabel.maxY + 5;
    xxLabel.height = 15;
    xxLabel.text = @"★★★★★";
    xxLabel.font = [UIFont boldSystemFontOfSize:12];
    xxLabel.textColor = [UIColor whiteColor];
    [self addSubview:xxLabel];
    
    if ([GetUserDefault(UserType) isEqualToString:@"1"]) {
    
        // 店员明细
        UIButton *detailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        detailBtn.frame = CGRectMake(0, 0, 70, 30);
        detailBtn.centerX = self.signInBtn.centerX;
        detailBtn.centerY = titleLabel.centerY;
        detailBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [detailBtn setTitle:@"店员明细" forState:UIControlStateNormal];
        [detailBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [[detailBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [self goViewController:@"SalesclerkViewController"];
        }];
        [self addSubview:detailBtn];
    }
}

- (void)goViewController:(NSString *)vcName {
    
    if (self.goViewControllerBlock) {
        self.goViewControllerBlock([NSClassFromString(vcName) new]);
    }
}

@end
