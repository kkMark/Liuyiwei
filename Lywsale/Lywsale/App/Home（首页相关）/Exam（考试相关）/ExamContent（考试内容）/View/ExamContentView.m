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

@end

@implementation ExamContentView

- (void)setIndex:(int)index {
    
    _index = index;
    
    for (int i = 0; i < self.contents.count; i++) {
        
        UIImageView *tempImgView = [self viewWithTag:i + 20];
        tempImgView.image = [UIImage imageNamed:@"checkbox_nor"];
        
        if (index == i) {
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
            
            if (self.selIndex) {
                self.selIndex(i);
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

@end
