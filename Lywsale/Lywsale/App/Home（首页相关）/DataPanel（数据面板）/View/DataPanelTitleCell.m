//
//  DataPanelTitleCell.m
//  Lywsale
//
//  Created by M on 2018/8/28.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "DataPanelTitleCell.h"

@implementation DataPanelTitleCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 45)];
    titleLabel.text = @"药师销售月榜";
    titleLabel.font = [UIFont boldSystemFontOfSize:15];
    titleLabel.textColor = kMainTextColor;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:titleLabel];
    
    UILabel *moreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 45)];
    moreLabel.text = @"更多";
    moreLabel.font = [UIFont systemFontOfSize:12];
    moreLabel.textColor = kMainTextColor;
    moreLabel.textAlignment = NSTextAlignmentRight;
    self.accessoryView = moreLabel;
}

@end
