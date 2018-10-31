//
//  TrainingEvaluationHeaderView.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/31.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "TrainingEvaluationHeaderView.h"

@interface TrainingEvaluationHeaderView ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation TrainingEvaluationHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, ScreenWidth - 30, 15)];
    self.titleLabel.text = @"学员评论（329）";
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textColor = kMainTextColor;
    [self addSubview:self.titleLabel];
    
    // 评分
    UIImageView *scoreImgView;
    for (int i = 0; i < 5; i++) {
        
        scoreImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"training_score_sel"]];
        scoreImgView.size = CGSizeMake(12, 12);
        scoreImgView.centerY = self.titleLabel.maxY + 5;
        scoreImgView.x = 15;
        [self addSubview:scoreImgView];
    }
    // view高度
    self.height = scoreImgView.maxY + 15;

    // 分享按钮
    UIButton *scoreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    scoreBtn.frame = CGRectMake(0, 0, 80, 23);
    scoreBtn.centerY = self.height / 2;
    scoreBtn.layer.cornerRadius = scoreBtn.height / 2;
    scoreBtn.layer.masksToBounds = YES;
    scoreBtn.layer.borderWidth = 1;
    scoreBtn.layer.borderColor = kMainColor.CGColor;
    scoreBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [scoreBtn setTitle:@"我要评论" forState:UIControlStateNormal];
    [scoreBtn setTitleColor:kMainColor forState:UIControlStateNormal];
    [self addSubview:scoreBtn];
    
    UILabel *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, self.height - 0.5)];
    
}

@end
