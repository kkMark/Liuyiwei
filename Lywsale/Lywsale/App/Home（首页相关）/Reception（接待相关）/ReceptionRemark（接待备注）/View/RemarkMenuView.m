
//
//  RemarkMenuView.m
//  Lywsale
//
//  Created by M on 2018/9/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "RemarkMenuView.h"

@interface RemarkMenuView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *bgView;

@end

@implementation RemarkMenuView
@synthesize titleLabel;

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
    
        self.alpha = 0;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    }
    
    return self;
}

#pragma mark - lazy
- (UILabel *)titleLabel {

    if (!titleLabel) {

        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, ScreenWidth, 40)];
        titleLabel.text = self.title;
        titleLabel.font = [UIFont systemFontOfSize:17];
        titleLabel.textColor = kMainTextColor;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.height = [titleLabel getTextHeight];
    }

    return titleLabel;
}

- (void)setDataSources:(NSArray *)dataSources {

    _dataSources = dataSources;

    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height, ScreenWidth, 0)];
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self.bgView addSubview:self.titleLabel];
    [self addSubview:self.bgView];

    for (int i = 0; i < dataSources.count; i++) {

        UIButton *typeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        typeBtn.frame = CGRectMake(0, 10 + self.titleLabel.maxY + 45 * i, ScreenWidth, 45);
        [self.bgView addSubview:typeBtn];

        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, ScreenWidth, typeBtn.height)];
        titleLabel.text = dataSources[i];
        titleLabel.font = [UIFont systemFontOfSize:13.5];
        titleLabel.textColor = kMainTextColor;
        [typeBtn addSubview:titleLabel];

        UIImageView *selectImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 18, 18)];
        selectImgView.tag = i + 100;
        selectImgView.centerY = typeBtn.height / 2;
        selectImgView.x = ScreenWidth - selectImgView.width - 20;
        selectImgView.userInteractionEnabled = YES;
        selectImgView.image = [UIImage imageNamed:@"checkbox_nor"];
        [typeBtn addSubview:selectImgView];

        if (self.currentType == 0 && i == 0) {
            selectImgView.image = [UIImage imageNamed:@"checkbox_sel"];
        }
        else if (self.currentType > 0 && [titleLabel.text isEqualToString:self.currentType]) {
            selectImgView.image = [UIImage imageNamed:@"checkbox_sel"];
        }
        
        if (i != dataSources.count - 1) {

            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, typeBtn.height - 0.5, self.bgView.width, 0.5)];
            lineView.backgroundColor = [UIColor colorWithHexString:@"0xC8CEE9"];
            [typeBtn addSubview:lineView];
        }

        @weakify(self);
        [[typeBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {

            @strongify(self);
            for (int index = 0; index < dataSources.count; index++) {

                UIImageView *tempImgView = [self viewWithTag:index + 100];
                tempImgView.image = [UIImage imageNamed:index == i ? @"checkbox_sel" : @"checkbox_nor"];
            }
            
            self.isShow = NO;
            if (self.selectTypeBlock) {
                self.selectTypeBlock(titleLabel.text);
            }
        }];

        self.bgView.height = typeBtn.maxY;
    }
    
    self.isShow = YES;
}

- (void)setTitle:(NSString *)title {

    _title = title;
    self.titleLabel.text = title;
}

- (void)setIsShow:(BOOL)isShow {
    
    _isShow = isShow;
    [UIView animateWithDuration:0.25 animations:^{
        
        self.alpha = isShow;
        if (!isShow) self.bgView.y = self.height;
        else self.bgView.y = self.height - self.bgView.height;
        
    } completion:^(BOOL finished) {
        
        if (!isShow) {
            [self removeFromSuperview];
        }
    }];
}

- (void)setCurrentType:(NSString *)currentType {
    
    _currentType = currentType;
    if (currentType.length > 0) {
        
        for (int i = 0; i < self.dataSources.count; i++) {
            
            BOOL isSel = NO;
            if ([self.dataSources[i] isEqualToString:currentType]) {
                isSel = YES;
            }
            
            UIImageView *tempImgView = [self viewWithTag:i + 100];
            tempImgView.image = [UIImage imageNamed:isSel ? @"checkbox_sel" : @"checkbox_nor"];
        }
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.isShow = NO;
}

@end
