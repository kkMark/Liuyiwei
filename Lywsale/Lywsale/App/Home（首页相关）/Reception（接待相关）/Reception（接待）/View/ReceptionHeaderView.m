//
//  ReceptionHeaderView.m
//  Lywsale
//
//  Created by M on 2018/9/11.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "ReceptionHeaderView.h"

@interface ReceptionHeaderView ()

@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation ReceptionHeaderView

- (void)setupSubviews {
    
    // 时间
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.frame = CGRectMake(15, 15 , ScreenWidth - 30, 15);
    self.nameLabel.text = @"李小姐接待跟踪";
    self.nameLabel.font = [UIFont systemFontOfSize:16];
    self.nameLabel.textColor = kMainTextColor;
    [self addSubview:self.nameLabel];
    
    NSArray *titles = @[@"咨询药品：", @"接待日期：", @"接待备注："];
    NSArray *contents = @[@"博路定", @"2018-05-13  18:11", @"报价了博路定的价格208元，顾客现场未定"];
    for (int i = 0; i < titles.count; i++) {
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, self.nameLabel.maxY + 15 + 25 * i, 0, 0)];
        titleLabel.text = titles[i];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
        titleLabel.height = [titleLabel getTextHeight];
        titleLabel.width = [titleLabel getTextWidth];
        [self addSubview:titleLabel];
        
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, titleLabel.y, ScreenWidth - 125, 0)];
        contentLabel.text = contents[i];
        contentLabel.font = [UIFont systemFontOfSize:14];
        contentLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
        contentLabel.textAlignment = NSTextAlignmentRight;
        contentLabel.numberOfLines = 0;
        contentLabel.height = [contentLabel getTextHeight];
        [self addSubview:contentLabel];
        
        self.viewHeight = contentLabel.maxY + 15;
    }
}

@end
