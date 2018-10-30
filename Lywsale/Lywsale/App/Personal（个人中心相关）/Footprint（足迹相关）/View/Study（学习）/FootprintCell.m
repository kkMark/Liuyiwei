//
//  FootprintCell.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/26.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "FootprintCell.h"

@interface FootprintCell ()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *courseLabel;
@property (nonatomic, strong) UILabel *dayLabel;

@end

@implementation FootprintCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier]) {
        
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0.3)];
    lineView.backgroundColor = [UIColor colorWithHexString:@"0xd1d1d1"];
    lineView.y = 125 - lineView.height;
    [self.contentView addSubview:lineView];

    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 120, 95)];
    self.imgView.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:self.imgView];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.imgView.maxX + 10, 15, 0, 35)];
    self.nameLabel.width = ScreenWidth - self.nameLabel.x - 15;
    self.nameLabel.text = @"博路定用药培训\n如何提供转化率xxx";
    self.nameLabel.font = [UIFont systemFontOfSize:14];
    self.nameLabel.textColor = kMainTextColor;
    self.nameLabel.numberOfLines = 0;
    [self.contentView addSubview:self.nameLabel];
    
    UIImage *statusImg = [UIImage imageNamed:@"footprint_pass"];
    self.statusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.statusBtn.size = CGSizeMake(statusImg.size.width - 20, statusImg.size.height);
    self.statusBtn.x = ScreenWidth - self.statusBtn.width;
    self.statusBtn.y = 100 - self.statusBtn.height;
    self.statusBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.statusBtn setTitle:@"考试合格" forState:UIControlStateNormal];
    [self.statusBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.statusBtn setBackgroundImage:statusImg forState:UIControlStateNormal];
    [self.contentView addSubview:self.statusBtn];
    
    self.dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.imgView.maxX + 10, self.imgView.maxY - 20, 0, 15)];
    self.dayLabel.width = ScreenWidth - self.dayLabel.x - self.statusBtn.width - 5;
    self.dayLabel.text = @"1天前更新";
    self.dayLabel.font = [UIFont systemFontOfSize:12];
    self.dayLabel.textColor = [UIColor colorWithHexString:@"0x999999"];
    [self.contentView addSubview:self.dayLabel];
    
    self.courseLabel = [[UILabel alloc] initWithFrame:self.dayLabel.frame];
    self.courseLabel.y = self.dayLabel.y - 25;
    self.courseLabel.text = @"5节课   已学习";
    self.courseLabel.font = [UIFont systemFontOfSize:12];
    self.courseLabel.textColor = [UIColor colorWithHexString:@"0x999999"];
    [self.contentView addSubview:self.courseLabel];
}

@end
