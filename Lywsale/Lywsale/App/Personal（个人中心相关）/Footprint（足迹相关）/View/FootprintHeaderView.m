//
//  FootprintHeaderView.m
//  Lywsale
//
//  Created by M on 2018/8/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "FootprintHeaderView.h"

@implementation FootprintHeaderView

- (void)setupSubviews {
    
    NSArray *titles = @[@"任务统计", @"我的学习", @"我的收藏"];
    for (int i = 0; i < 3; i++) {
        
        UIButton *bgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        bgBtn.frame = CGRectMake(ScreenWidth / 3 * i, 0, ScreenWidth / 3, 0);
        [self addSubview:bgBtn];
        
        UIImage *img = [UIImage imageNamed:@"TestImg"];
        UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
        imgView.size = CGSizeMake(img.size.width * 2, img.size.height * 2);
        imgView.centerX = bgBtn.width / 2;
        imgView.y = 15;
        [bgBtn addSubview:imgView];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, imgView.maxY + 15, bgBtn.width, 15)];
        titleLabel.tag = i + 10;
        titleLabel.text = titles[i];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = i == 0 ? kMainColor : [UIColor lightGrayColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [bgBtn addSubview:titleLabel];
        
        [[bgBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
           
            for (int index = 0; index < 3; index++) {
                
                UILabel *titleLabel = [self viewWithTag:index + 10];
                titleLabel.textColor = [UIColor lightGrayColor];
            }
            
            titleLabel.textColor = kMainColor;
            if (self.selectIndex) self.selectIndex(i);
        }];
        
        bgBtn.height = titleLabel.maxY + 15;
        self.viewHeight = bgBtn.height;
    }
    
    // 底部线条
    UIView *bottomlineView = [[UILabel alloc] initWithFrame:CGRectMake(0, self.viewHeight, ScreenWidth, 0.3)];
    bottomlineView.backgroundColor = kLineColor;
    [self addSubview:bottomlineView];
}

@end
