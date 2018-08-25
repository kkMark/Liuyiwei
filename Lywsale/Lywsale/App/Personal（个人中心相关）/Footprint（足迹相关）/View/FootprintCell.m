//
//  FootprintCell.m
//  Lywsale
//
//  Created by M on 2018/8/25.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "FootprintCell.h"

@interface FootprintCell ()

/// 完成百分比
@property (nonatomic, strong) UIView *percentageView;
/// 完成数量
@property (nonatomic, strong) UILabel *completeNumberLabel;
/// 未完成数量
@property (nonatomic, strong) UILabel *unfinishedNumberLabel;

@end

@implementation FootprintCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    // 完成百分比
    self.percentageView = [[UIView alloc] initWithFrame:CGRectMake(20, 15, 70, 70)];
    self.percentageView.height = self.percentageView.width = 70;
    self.percentageView.layer.cornerRadius = self.percentageView.height / 2;
    self.percentageView.layer.masksToBounds = YES;
    self.percentageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.percentageView];
    
    for (int i = 0; i < 2; i++) {
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.percentageView.maxX + 15, self.percentageView.centerY - (i * 25), 50, 25)];
        titleLabel.text = i == 0 ? @"已完成" : @"未完成";
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = kMainTextColor;
        [self.contentView addSubview:titleLabel];
        
        UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleLabel.maxX + 10, 0, 0, 20)];
        numberLabel.centerY = titleLabel.centerY;
        numberLabel.width = ScreenWidth - titleLabel.maxX - 30;
        numberLabel.text = @"50";
        numberLabel.font = [UIFont systemFontOfSize:14];
        numberLabel.textColor = kMainTextColor;
        numberLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:numberLabel];
    }
}

@end
