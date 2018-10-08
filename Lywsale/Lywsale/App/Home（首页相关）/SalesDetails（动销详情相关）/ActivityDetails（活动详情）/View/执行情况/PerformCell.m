//
//  PerformCell.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/8.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "PerformCell.h"

@implementation PerformCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(20, 0, ScreenWidth - 40, 35)];
    self.bgView.layer.borderColor = [UIColor colorWithHexString:@"0xEEF0F3"].CGColor;
    self.bgView.layer.borderWidth = 0.5;
    [self.contentView addSubview:self.bgView];
    
    NSArray *titles = @[@"负责人", @"上传数", @"审核通过数", @"应奖励金额"];
    for (int i = 0; i < 4; i++) {
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.bgView.width / 4 * i, 0, self.bgView.width / 4, self.bgView.height)];
        titleLabel.tag = i + 100;
        titleLabel.text = titles[i];
        titleLabel.font = [UIFont systemFontOfSize:13];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.bgView addSubview:titleLabel];
    }
}

- (void)setIndexPath:(NSIndexPath *)indexPath {
    
    UIColor *color;
    if (indexPath.row == 0) {
        color = kMainColor;
    }
    else if (indexPath.row % 2 == 1) {
        color = [UIColor whiteColor];
    }
    else {
        color = [UIColor colorWithHexString:@"0xEFF7FF"];
    }
    
    self.bgView.backgroundColor = color;
    
    if (indexPath.row != 0) {
        
        NSArray *titles = @[@"陈六", @"50000", @"30", @"3%"];
        for (int i = 0; i < 4; i++) {
            
            UILabel *titleLabel = [self viewWithTag:i + 100];
            titleLabel.text = titles[i];
            titleLabel.textColor = kMainTextColor;
        }
    }
}

@end
