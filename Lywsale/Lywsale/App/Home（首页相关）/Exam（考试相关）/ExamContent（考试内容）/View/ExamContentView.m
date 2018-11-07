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

@end

@implementation ExamContentView

- (void)setTitle:(NSString *)title content:(NSArray *)content {
    
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
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(15, maxY, titleLabel.width, 1)];
        lineView.backgroundColor = [UIColor colorWithHexString:@"0xC8CEE9"];
        [self.bgView addSubview:lineView];
        
        UIButton *selBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        selBtn.frame = CGRectMake(20, lineView.maxY, width - 40, 0);
        [self.bgView addSubview:selBtn];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(selBtn.width - 20, 0, 18, 18)];
        imgView.image = [UIImage imageNamed:@"checkbox_nor"];
        [selBtn addSubview:imgView];
        
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, selBtn.width - 20, 0)];
        contentLabel.text = content[i];
        contentLabel.font = [UIFont systemFontOfSize:14];
        contentLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
        contentLabel.numberOfLines = 0;
        [selBtn addSubview:contentLabel];
        
        [[selBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            
            selBtn.selected = !selBtn.selected;
            NSString *imgString = selBtn.selected ? @"checkbox_sel" : @"checkbox_nor";
            imgView.image = [UIImage imageNamed:imgString];
            
            if (self.selIndex) {
                self.selIndex(i);
            }
        }];
        
        selBtn.height = contentLabel.maxY + 15;
        imgView.centerY = selBtn.height / 2;
        maxY = selBtn.maxY;
    }
}

@end
