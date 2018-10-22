//
//  SelectListView.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/20.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "SelectListView.h"

@interface SelectListView ()

@property (nonatomic, strong) UIView *bgView;

@end

@implementation SelectListView
@synthesize bgView;

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
        self.alpha = 0;
        
        [self setupSubviewsWithTitle:title];
    }
    
    return self;
}

- (void)setupSubviewsWithTitle:(NSString *)title {
    
    bgView = [[UIView alloc] initWithFrame:self.frame];
    bgView.height = self.height / 2;
    bgView.y = self.height;
    bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bgView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, ScreenWidth, 0)];
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:17];
    titleLabel.textColor = kMainTextColor;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.height = [titleLabel getTextHeight];
    [bgView addSubview:titleLabel];
    
    UIView *typeView = [self typeView:CGRectMake(0, titleLabel.maxY, ScreenWidth, 40)];
    [bgView addSubview:typeView];
    
    @weakify(self);
    [UIView animateWithDuration:0.25 animations:^{
     
        @strongify(self);
        self.bgView.y = self.height - self.bgView.height;
        self.alpha = 1;
    }];
}

- (UIView *)typeView:(CGRect)frame {
    
    UIView *typeView = [[UIView alloc] initWithFrame:frame];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, typeView.height - 1, ScreenWidth, 1)];
    lineView.backgroundColor = [UIColor colorWithHexString:@"0xC8CEE9"];
    [typeView addSubview:lineView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 0, typeView.height)];
    titleLabel.text = @"请选择";
    titleLabel.textColor = kMainColor;
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.width = [titleLabel getTextWidth];
    [typeView addSubview:titleLabel];
    
    UIView *titleLineView = [[UIView alloc] initWithFrame:CGRectMake(0, lineView.y, titleLabel.width + 10, 1)];
    titleLineView.backgroundColor = kMainColor;
    titleLineView.centerX = titleLabel.centerX;
    [typeView addSubview:titleLineView];
    
    return typeView;
}

- (void)close {
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.bgView.y = self.height;
        
        self.alpha = 0;
        
    } completion:^(BOOL finished) {
       
        [self removeFromSuperview];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self close];
}

@end
