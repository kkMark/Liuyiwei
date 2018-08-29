//
//  DataPanelCell.m
//  Lywsale
//
//  Created by M on 2018/8/28.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "DataPanelCell.h"

@interface DataPanelCell ()

@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) UIImageView *headerImgView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *countLabel;

@end

@implementation DataPanelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    float height = 45;
    self.numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, height)];
    self.numberLabel.text = @"药师销售月榜";
    self.numberLabel.font = [UIFont systemFontOfSize:14];
    self.numberLabel.textColor = kMainTextColor;
    self.numberLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.numberLabel];

    self.headerImgView = [[UIImageView alloc] initWithFrame:CGRectMake(self.numberLabel.maxX, 0, height, height)];
    self.headerImgView.image = [UIImage imageNamed:@"TestHeadImg"];
    self.headerImgView.layer.cornerRadius = self.headerImgView.height / 2;
    self.headerImgView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.headerImgView];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.headerImgView.maxX + 10, 0, ScreenWidth / 3, height)];
    self.nameLabel.text = @"刘药师";
    self.nameLabel.font = [UIFont systemFontOfSize:14];
    self.nameLabel.textColor = kMainTextColor;
    [self.contentView addSubview:self.nameLabel];
    
    self.countLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 45)];
    self.countLabel.x = ScreenWidth - 120;
    self.countLabel.font = [UIFont boldSystemFontOfSize:14];
    self.countLabel.textColor = kMainColor;
    self.countLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.countLabel];
}

- (void)setIndex:(NSInteger)index {
    
    self.numberLabel.text = [NSString stringWithFormat:@"%zd", index];
    self.countLabel.text = [NSString stringWithFormat:@"%zd", 5000 - index * 100];
}

@end
