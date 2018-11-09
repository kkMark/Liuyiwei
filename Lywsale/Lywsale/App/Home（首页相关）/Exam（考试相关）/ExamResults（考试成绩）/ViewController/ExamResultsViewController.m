//
//  ExamResultsViewController.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/8.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "ExamResultsViewController.h"

@interface ExamResultsViewController ()

@end

@implementation ExamResultsViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    self.view.backgroundColor = kPageBgColor;
    self.title = @"考试成绩";
    
    [self setupSubviews];
}

- (void)setupSubviews {
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    
    UIImageView *stateImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 30, 60, 60)];
    stateImgView.image = [UIImage imageNamed:@"examResults-through"];
    stateImgView.centerX = bgView.centerX;
    [bgView addSubview:stateImgView];
    
    UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, stateImgView.maxY + 20, ScreenWidth, 30)];
    numberLabel.text = @"100 分";
    numberLabel.font = [UIFont systemFontOfSize:14];
    numberLabel.textColor = kMainTextColor;
    numberLabel.textAlignment = NSTextAlignmentCenter;
    [bgView addSubview:numberLabel];
    
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:numberLabel.text];
    [attStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:36] range:NSMakeRange(0, attStr.length - 2)];
    [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"0xF6733E"] range:NSMakeRange(0, attStr.length - 2)];
    numberLabel.attributedText = attStr;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, numberLabel.maxY + 10, ScreenWidth, 0)];
    titleLabel.text = @"恭喜你";
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textColor = kMainTextColor;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.height = [titleLabel getTextHeight];
    [bgView addSubview:titleLabel];
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, titleLabel.maxY + 10, ScreenWidth, 0)];
    contentLabel.text = @"考试合格，不愧为学霸";
    contentLabel.font = [UIFont systemFontOfSize:14];
    contentLabel.textColor = kMainTextColor;
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.height = [contentLabel getTextHeight];
    [bgView addSubview:contentLabel];
    
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, contentLabel.maxY + 10, ScreenWidth, 0)];
    timeLabel.text = @"耗时: 10:00";
    timeLabel.font = [UIFont systemFontOfSize:12];
    timeLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    timeLabel.height = [contentLabel getTextHeight];
    [bgView addSubview:timeLabel];
    
    NSArray *titles = @[@"答题详情", @"执行任务"];
    for (int i = 0; i < titles.count; i++) {
        
        UIColor *textColor = i == 0 ? kMainColor : [UIColor whiteColor];
        UIColor *bgColor = i == 0 ? [UIColor whiteColor] : kMainColor;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, timeLabel.maxY + 30 + 60 * i, 225, 40);
        btn.centerX = bgView.centerX;
        btn.backgroundColor = bgColor;
        btn.layer.cornerRadius = btn.height / 2;
        btn.layer.masksToBounds = YES;
        btn.layer.borderColor = kMainColor.CGColor;
        btn.layer.borderWidth = 2;
        btn.titleLabel.font = [UIFont systemFontOfSize:17];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:textColor forState:UIControlStateNormal];
        [bgView addSubview:btn];
        
        bgView.height = btn.maxY + 40;
    }
}

@end
