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
    self.headImgView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 60, 60)];
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

    [self initMenu];
}

- (void)initMenu {
    
    UIView *menuBgView = [[UIView alloc] initWithFrame:CGRectMake(0, self.nicknameLabel.maxY + 5, ScreenWidth, 45)];
    menuBgView.backgroundColor = kMainColor;
    [self insertSubview:menuBgView atIndex:0];
    
    self.headerHeight = menuBgView.maxY;
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, menuBgView.height - 2, 80, 2)];
    self.lineView.backgroundColor = [UIColor whiteColor];
    [menuBgView addSubview:self.lineView];
    
    for (int i = 0; i < 2; i++) {
        
        UIButton *menuTitleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        menuTitleBtn.tag = i + 100;
        menuTitleBtn.frame = CGRectMake(0, 0, 80, menuBgView.height - 2);
        menuTitleBtn.x = menuBgView.centerX - (i == 0 ? menuTitleBtn.width : 0);
        menuTitleBtn.titleLabel.font = i == 0 ? [UIFont boldSystemFontOfSize:14] : [UIFont systemFontOfSize:14];
        [menuTitleBtn setTitle:i == 0 ? @"数据看板" : @"任务看板" forState:UIControlStateNormal];
        [menuTitleBtn setTitleColor:i == 0 ? [UIColor whiteColor] : kMainTextColor forState:UIControlStateNormal];
        [menuBgView addSubview:menuTitleBtn];
        
        // 默认线条在数据看版下
        if (i == 0) self.lineView.x = menuTitleBtn.x;
        
        // 点击事件
        [[menuTitleBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {

            [self setIndex:i];
            if (self.selectIndex) {
                self.selectIndex(i);
            }
        }];
    }
}

- (void)setIndex:(NSInteger)index {
    
    _index = index;
    [UIView animateWithDuration:0.25 animations:^{
        
        for (int i = 0; i < 2; i++) {
            
            UIButton *tempBtn = [self viewWithTag:i + 100];
            tempBtn.titleLabel.font = index == i ? [UIFont boldSystemFontOfSize:14] : [UIFont systemFontOfSize:14];
            [tempBtn setTitleColor:index == i ? [UIColor whiteColor] : kMainTextColor forState:UIControlStateNormal];
        }
        
        self.lineView.x = ScreenWidth / 2 - (80 * !index);
    }];
}


@end
