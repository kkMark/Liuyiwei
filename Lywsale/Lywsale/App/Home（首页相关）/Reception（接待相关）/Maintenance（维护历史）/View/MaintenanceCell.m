//
//  MaintenanceCell.m
//  Lywsale
//
//  Created by M on 2018/9/11.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "MaintenanceCell.h"

@interface MaintenanceCell ()

@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation MaintenanceCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    // 时间
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.frame = CGRectMake(15, 15 , ScreenWidth - 30, 15);
    self.timeLabel.text = @"2018-05-13 17：00";
    self.timeLabel.font = [UIFont systemFontOfSize:16];
    self.timeLabel.textColor = kMainTextColor;
    [self.contentView addSubview:self.timeLabel];
    
    NSArray *titles = @[@"维护人员：", @"维护类型：", @"备注："];
    NSArray *contents = @[@"陈药师", @"销售接待", @"顾客咨询博路定的价格，报价208元"];
    for (int i = 0; i < titles.count; i++) {
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, self.timeLabel.maxY + 15 + 25 * i, 0, 0)];
        titleLabel.text = titles[i];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
        titleLabel.height = [titleLabel getTextHeight];
        titleLabel.width = [titleLabel getTextWidth];
        [self.contentView addSubview:titleLabel];
        
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, titleLabel.y, ScreenWidth - 125, 0)];
        contentLabel.text = contents[i];
        contentLabel.font = [UIFont systemFontOfSize:14];
        contentLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
        contentLabel.textAlignment = NSTextAlignmentRight;
        contentLabel.numberOfLines = 0;
        contentLabel.height = [contentLabel getTextHeight];
        [self.contentView addSubview:contentLabel];
        
        self.cellHeight = contentLabel.maxY + 15;
    }
}

@end
