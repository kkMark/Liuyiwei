
//
//  SalesclerkCell.m
//  Lywsale
//
//  Created by M on 2018/9/25.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "SalesclerkCell.h"

@implementation SalesclerkCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {

    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(20, 0, ScreenWidth - 70, 35)];
    self.bgView.layer.borderColor = [UIColor colorWithHexString:@"0xEEF0F3"].CGColor;
    self.bgView.layer.borderWidth = 0.5;
    [self.contentView addSubview:self.bgView];
    
    NSArray *titles = @[@"负责人", @"任务", @"已完成", @"比例"];
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
