//
//  TrainingEvaluationHeaderView.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/31.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "TrainingEvaluationHeaderView.h"
#import "EvaluationView.h"
#import "TrainingViewController.h"

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

#pragma mark - set
- (void)setModel:(EvaluationModel *)model {
    
    _model = model;
    self.titleLabel.text = [NSString stringWithFormat:@"学员评论（%@）", model.evaluationCount];
    
    for (int i = 0; i < 5; i++) {
        
        NSString *imgString = @"training_score";
        if (i < [model.avgScore intValue]) {
            imgString = @"training_score_sel";
        }
        else {
            imgString = @"training_score";
        }
        
        UIImageView *scoreImgView = [self viewWithTag:i + 1000];
        scoreImgView.image = [UIImage imageNamed:imgString];
    }
}


#pragma mark - UI
- (void)setupSubviews {
    
    self.backgroundColor = [UIColor whiteColor];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, ScreenWidth - 30, 15)];
    self.titleLabel.text = @"学员评论（329）";
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textColor = kMainTextColor;
    [self addSubview:self.titleLabel];
    
    // 评分
    UIImageView *scoreImgView;
    for (int i = 0; i < 5; i++) {
        
        scoreImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"training_score"]];
        scoreImgView.tag = i + 1000;
        scoreImgView.size = CGSizeMake(12, 12);
        scoreImgView.y = self.titleLabel.maxY + 5;
        scoreImgView.x = 15 + 17 * i;
        [self addSubview:scoreImgView];
    }
    // view高度
    self.height = scoreImgView.maxY + 10;

    // 分享按钮
    UIButton *scoreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    scoreBtn.frame = CGRectMake(ScreenWidth - 100, 0, 80, 23);
    scoreBtn.centerY = self.height / 2;
    scoreBtn.layer.cornerRadius = scoreBtn.height / 2;
    scoreBtn.layer.masksToBounds = YES;
    scoreBtn.layer.borderWidth = 1;
    scoreBtn.layer.borderColor = kMainColor.CGColor;
    scoreBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [scoreBtn setTitle:@"我要评论" forState:UIControlStateNormal];
    [scoreBtn setTitleColor:kMainColor forState:UIControlStateNormal];
    [self addSubview:scoreBtn];
    
    [[scoreBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
       
        TrainingViewController *vc = (TrainingViewController *)[AppTool getCurrentViewController];
        
        EvaluationView *evaluationView = [[EvaluationView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        [evaluationView setEvaluationBlock:^(NSString *content, int score) {
            
            EvaluationModel *model = [EvaluationModel new];
            model.score = [NSString stringWithFormat:@"%d", score];
            model.content = content;
            model.unnamed = @"0";
            [vc submitEvaluation:model];
        }];
        [vc.view addSubview:evaluationView];
    }];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height - 0.5, ScreenWidth, 0.5)];
    lineView.backgroundColor = [UIColor colorWithHexString:@"0xEEF0F3"];
    [self addSubview:lineView];
}

@end
