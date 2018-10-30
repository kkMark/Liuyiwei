//
//  DailyTaskManagerDetailsView.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/8.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "DailyTaskManagerDetailsView.h"

@implementation DailyTaskManagerDetailsView

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title data:(NSArray *)data {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        self.alpha = 0;
        
        [self setupSubviews:title data:data];
    }
    
    return self;
}

- (void)setupSubviews:(NSString *)title data:(NSArray *)data {
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(15, 0, ScreenWidth - 30, 0)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 5;
    bgView.layer.masksToBounds = YES;
    [self addSubview:bgView];
    
    UIImage *closeImg = [UIImage imageNamed:@"AppClose"];
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.size = closeImg.size;
    closeBtn.x = bgView.width - closeBtn.width - 15;
    closeBtn.y = 15;
    [bgView addSubview:closeBtn];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, bgView.width, 0)];
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:17];
    titleLabel.textColor = kMainTextColor;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.height = [titleLabel getTextHeight];
    [bgView addSubview:titleLabel];
    
    for (int i = 0; i < 4; i++) {
        
        UIView *labelBgView = [[UIView alloc] initWithFrame:CGRectMake(15, titleLabel.maxY + 15 + 35 * i, bgView.width - 30, 35)];
        labelBgView.backgroundColor = kMainColor;
        labelBgView.layer.borderWidth = 0.5;
        labelBgView.layer.borderColor = [UIColor colorWithHexString:@"0xDBDEF0"].CGColor;
        [bgView addSubview:labelBgView];
        
        if (i > 0) {
            
            if (i % 2 == 0) {
                labelBgView.backgroundColor = [UIColor colorWithHexString:@"0xEFF7FF"];
            }
            else {
                labelBgView.backgroundColor = [UIColor whiteColor];
            }
        }
        
        NSArray *titles = @[@"负责人", @"待跟进", @"已处理"];
        for (int a = 0; a < 3; a++) {
            
            UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelBgView.width / titles.count * a, 0, labelBgView.width / titles.count, labelBgView.height)];
            tempLabel.text = titles[a];
            tempLabel.font = [UIFont systemFontOfSize:14];
            tempLabel.textColor = kMainTextColor;
            tempLabel.textAlignment = NSTextAlignmentCenter;
            [labelBgView addSubview:tempLabel];
            
            if (i == 0) {
                
                tempLabel.textColor = [UIColor whiteColor];
                tempLabel.font = [UIFont systemFontOfSize:12];
            }
        }
        
        bgView.height = labelBgView.maxY + 25;
    }
    
    bgView.centerY = self.centerY;
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 1;
    }];
}

- (void)close {
    
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self close];
}

@end
