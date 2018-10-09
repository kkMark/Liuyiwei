//
//  DailyTaskManagerDetailsView.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/8.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "DailyTaskManagerDetailsView.h"

@interface DailyTaskManagerDetailsView ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation DailyTaskManagerDetailsView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 350, 290)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 5;
    bgView.layer.masksToBounds = YES;
    [self addSubview:bgView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, bgView.width, 0)];
    self.titleLabel.text = @"回访标题";
    self.titleLabel.font = [UIFont systemFontOfSize:17];
    self.titleLabel.textColor = kMainTextColor;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [bgView addSubview:_titleLabel];
    
    
}

@end
