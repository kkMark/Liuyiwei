//
//  PublicHeaderView.m
//  Lywsale
//
//  Created by M on 2018/9/26.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "PublicHeaderView.h"

@interface PublicHeaderView ()

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation PublicHeaderView
@synthesize headerView;
@synthesize lineView;

- (void)setTitles:(NSArray *)titles {
    
    _titles = titles;
    self.headerView.width = self.width;
}

- (void)setIndex:(NSInteger)index {
    
    [self btnClick:[self viewWithTag:index + 10]];
}

#pragma mark - lazy
- (UIView *)headerView {
    
    if (!headerView) {
        
        headerView = [[UIView alloc] initWithFrame:self.frame];
        headerView.backgroundColor = [UIColor whiteColor];
        [self addSubview:headerView];
        
        self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, headerView.height - 2, 100, 2)];
        self.lineView.backgroundColor = kMainColor;
        self.lineView.centerX = ScreenWidth / self.titles.count / 2;
        [headerView addSubview:self.lineView];
        
        for (int i = 0; i < self.titles.count; i++) {
            
            UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            titleBtn.tag = i + 10;
            titleBtn.selected = i == 0 ? YES : NO;
            titleBtn.frame = CGRectMake(self.width / self.titles.count * i, 0, self.width / self.titles.count, headerView.height);
            titleBtn.titleLabel.font = [UIFont systemFontOfSize:14];
            [titleBtn setTitle:self.titles[i] forState:UIControlStateNormal];
            [titleBtn setTitleColor:[UIColor colorWithHexString:@"0x999999"] forState:UIControlStateNormal];
            [titleBtn setTitleColor:kMainColor forState:UIControlStateSelected];
            [titleBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [headerView addSubview:titleBtn];
        }
    }
    
    return headerView;
}

- (void)btnClick:(UIButton *)btn {
    
    [UIView animateWithDuration:0.25 animations:^{
        
        for (int i = 0; i < self.titles.count; i++) {
            
            UIButton *tempBtn = [self viewWithTag:i + 10];
            if (tempBtn == btn) tempBtn.selected = YES;
            else tempBtn.selected = NO;
        }
        
        self.lineView.centerX = btn.centerX;
    }];
}

@end
