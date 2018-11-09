//
//  ExamContentView.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/7.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "ExamContentView.h"

@interface ExamContentView ()

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *timeView;
@property (nonatomic, strong) UIView *progressView;
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) NSArray *contents;

/// 详情背景
@property (nonatomic, strong) UIView *detailBgView;

@end

@implementation ExamContentView

- (void)setAnalysis:(NSString *)analysis {
    
    self.timeView.hidden = YES;
    
    [self.detailBgView removeFromSuperview];
    
    // 背景
    self.detailBgView = [[UIView alloc] initWithFrame:CGRectMake(10, self.bgView.maxY + 15, ScreenWidth - 20, 0)];
    self.detailBgView.backgroundColor = [UIColor whiteColor];
    self.detailBgView.layer.cornerRadius = 2;
    self.detailBgView.layer.shadowColor = [UIColor grayColor].CGColor;
    self.detailBgView.layer.shadowOffset = CGSizeMake(3, 3);
    self.detailBgView.layer.shadowOpacity = 0.3;
    [self addSubview:self.detailBgView];
    
    float width = self.detailBgView.width;
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, width - 30, 0)];
    titleLabel.text = @"试题解析";
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textColor = kMainTextColor;
    titleLabel.numberOfLines = 0;
    titleLabel.height = [titleLabel getTextHeight];
    [self.detailBgView addSubview:titleLabel];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(15, titleLabel.maxY + 15, titleLabel.width, 0.3)];
    lineView.backgroundColor = [UIColor colorWithHexString:@"0xC8CEE9"];
    [self.detailBgView addSubview:lineView];

    UILabel *answerTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, lineView.maxY + 15, 0, 0)];
    answerTitleLabel.text = @"正确答案：";
    answerTitleLabel.font = [UIFont systemFontOfSize:14];
    answerTitleLabel.textColor = kMainTextColor;
    answerTitleLabel.numberOfLines = 0;
    answerTitleLabel.height = [answerTitleLabel getTextHeight];
    answerTitleLabel.width = [answerTitleLabel getTextWidth];
    [self.detailBgView addSubview:answerTitleLabel];
    
    NSString *answerString = self.answers[0];
    for (int i = 1; i < self.answers.count; i++) {
        answerString = [NSString stringWithFormat:@"%@, %@", answerString, self.answers[i]];
    }
    
    UILabel *answerLabel = [[UILabel alloc] initWithFrame:CGRectMake(answerTitleLabel.maxX + 10, 0, 0, 0)];
    answerLabel.text = answerString;
    answerLabel.font = [UIFont systemFontOfSize:14];
    answerLabel.textColor = kMainColor;
    answerLabel.numberOfLines = 0;
    answerLabel.height = [answerTitleLabel getTextHeight];
    answerLabel.width = [answerLabel getTextWidth];
    answerLabel.centerY = answerTitleLabel.centerY;
    [self.detailBgView addSubview:answerLabel];
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, answerLabel.maxY + 15, width - 30, 0)];
    contentLabel.text = analysis;
    contentLabel.font = [UIFont systemFontOfSize:14];
    contentLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
    contentLabel.numberOfLines = 0;
    contentLabel.height = [contentLabel getTextHeight];
    [self.detailBgView addSubview:contentLabel];
    
    self.detailBgView.height = contentLabel.maxY + 15;
}

- (void)setAnswers:(NSArray *)answers {
    
    _answers = answers;
    for (int i = 0; i < self.contents.count; i++) {
        
        UIImageView *tempImgView = [self viewWithTag:i + 20];
        tempImgView.image = [UIImage imageNamed:@"checkbox_nor"];
        
        for (int j = 0; j < answers.count; j++) {
            
            if ([answers[j] isEqualToString:self.contents[i][@"key"]]) {
                tempImgView.image = [UIImage imageNamed:@"checkbox_sel"];
            }
        }
    }
}

- (void)setCurrentIndex:(int)currentIndex {
    
    _currentIndex = currentIndex;
    
    [UIView animateWithDuration:0.25 animations:^{
       
        self.numberLabel.text = [NSString stringWithFormat:@"%d/%d", currentIndex, self.maxCount];
        
        float percent = (float)currentIndex / (float)self.maxCount;
        self.progressView.width = self.progressView.superview.width * percent;
    }];
}

- (void)setSelIndex:(int)selIndex {
    
    _selIndex = selIndex;
    
    for (int i = 0; i < self.contents.count; i++) {
        
        UIImageView *tempImgView = [self viewWithTag:i + 20];
        tempImgView.image = [UIImage imageNamed:@"checkbox_nor"];
        
        if (selIndex == i) {
            tempImgView.image = [UIImage imageNamed:@"checkbox_sel"];
            
        }
    }
}

- (void)setTitle:(NSString *)title content:(NSArray *)content {
    
    self.contents = content;
    [self.bgView removeFromSuperview];
    
    // 背景
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(10, 30, ScreenWidth - 20, 0)];
    self.bgView.backgroundColor = [UIColor whiteColor];
    self.bgView.layer.cornerRadius = 2;
    self.bgView.layer.shadowColor = [UIColor grayColor].CGColor;
    self.bgView.layer.shadowOffset = CGSizeMake(3, 3);
    self.bgView.layer.shadowOpacity = 0.3;
    [self addSubview:self.bgView];
    
    float width = self.bgView.width;
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, width - 30, 0)];
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textColor = kMainTextColor;
    titleLabel.numberOfLines = 0;
    titleLabel.height = [titleLabel getTextHeight];
    [self.bgView addSubview:titleLabel];
    
    float maxY = titleLabel.maxY + 15;
    for (int i = 0; i < content.count; i++) {
        
        NSDictionary *contentDict = content[i];
        NSString *contentString = [NSString stringWithFormat:@"%@.%@", contentDict[@"key"], contentDict[@"value"]];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(15, maxY, titleLabel.width, 0.3)];
        lineView.backgroundColor = [UIColor colorWithHexString:@"0xC8CEE9"];
        [self.bgView addSubview:lineView];
        
        UIButton *selBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        selBtn.tag = i + 10;
        selBtn.frame = CGRectMake(20, lineView.maxY, width - 40, 0);
        [self.bgView addSubview:selBtn];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(selBtn.width - 20, 0, 18, 18)];
        imgView.tag = i + 20;
        imgView.image = [UIImage imageNamed:@"checkbox_nor"];
        [selBtn addSubview:imgView];
        
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, selBtn.width - 20, 0)];
        contentLabel.text = contentString;
        contentLabel.font = [UIFont systemFontOfSize:14];
        contentLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
        contentLabel.numberOfLines = 0;
        contentLabel.height = [contentLabel getTextHeight];
        [selBtn addSubview:contentLabel];
        
        [[selBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            
            for (int index = 0; index < content.count; index++) {
                
                UIImageView *tempImgView = [self viewWithTag:index + 20];
                tempImgView.image = [UIImage imageNamed:@"checkbox_nor"];
                
                if (index == i) {
                    tempImgView.image = [UIImage imageNamed:@"checkbox_sel"];

                }
            }
            
            if (self.selIndexBlock) {
                self.selIndexBlock(i);
            }
        }];
        
        selBtn.height = contentLabel.maxY + 15;
        imgView.centerY = selBtn.height / 2;
        maxY = selBtn.maxY;
    }
    
    self.bgView.height = maxY;
    
    CGRect frame = self.bgView.frame;
    frame.origin.y = self.bgView.maxY + 15;
    [self initTimeViewWithFrame:frame];
}

- (void)initTimeViewWithFrame:(CGRect)frame {
    
    if (self.timeView == nil) {
        
        self.timeView = [[UIView alloc] initWithFrame:frame];
        self.timeView.height = 15;
        [self addSubview:self.timeView];
        
        self.numberLabel = [[UILabel alloc] init];
        self.numberLabel.text = @"2/8";
        self.numberLabel.font = [UIFont systemFontOfSize:10];
        self.numberLabel.textColor = [UIColor colorWithHexString:@"0x999999"];
        self.numberLabel.textAlignment = NSTextAlignmentRight;
        self.numberLabel.height = 15;
        self.numberLabel.width = [self.numberLabel getTextWidth] + 10;
        self.numberLabel.x = self.timeView.width - self.numberLabel.width;
        
        UIView *progressBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.timeView.width - self.numberLabel.width - 5, 5)];
        progressBgView.centerY = self.timeView.height / 2;
        progressBgView.layer.cornerRadius = 2.5;
        progressBgView.layer.masksToBounds = YES;
        progressBgView.backgroundColor = [UIColor colorWithHexString:@"0xe8e8ee"];
        [self.timeView addSubview:progressBgView];
        
        self.progressView = [[UIView alloc] initWithFrame:progressBgView.frame];
        self.progressView.y = 0;
        self.progressView.layer.cornerRadius = 2.5;
        self.progressView.layer.masksToBounds = YES;
        self.progressView.backgroundColor = kMainColor;
        [progressBgView addSubview:self.progressView];
        
        [self.timeView addSubview:self.numberLabel];
    }
    
    self.timeView.y = frame.origin.y;
}

@end
