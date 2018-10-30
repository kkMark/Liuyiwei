//
//  TrainingSelectionCell.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/30.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "TrainingSelectionCell.h"

@interface TrainingSelectionCell ()

@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIImageView *stateImgView;
@property (nonatomic, strong) UILabel *stateLabel;

@end

@implementation TrainingSelectionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    self.stateLabel = [[UILabel alloc] init];
    self.stateLabel.text = @"已完成";
    self.stateLabel.font = [UIFont systemFontOfSize:12];
    self.stateLabel.width = [self.stateLabel getTextWidth];
    self.stateLabel.height = [self.stateLabel getTextHeight];
    self.stateLabel.x = ScreenWidth - self.stateLabel.width - 20;
    self.stateLabel.textColor = kMainTextColor;
    [self.contentView addSubview:self.stateLabel];
    
    self.stateImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"training_complete_sel"]];
    self.stateImgView.width = self.stateImgView.height = 25;
    self.stateImgView.x = self.stateLabel.x - 30;
    [self.contentView addSubview:self.stateImgView];
    
    self.numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 20, 15)];
    self.numberLabel.text = @"01";
    self.numberLabel.font = [UIFont systemFontOfSize:14];
    self.numberLabel.textColor = kMainTextColor;
    [self.contentView addSubview:self.numberLabel];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.numberLabel.maxX + 10, 15, 0, 15)];
    self.nameLabel.text = @"视频一名称xxxxxx";
    self.nameLabel.font = [UIFont systemFontOfSize:14];
    self.nameLabel.textColor = kMainTextColor;
    self.nameLabel.width = ScreenWidth - self.stateImgView.width - self.nameLabel.x - 40;
    [self.contentView addSubview:self.nameLabel];

    self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.nameLabel.x, self.nameLabel.maxY + 5, self.nameLabel.width, 15)];
    self.timeLabel.text = @"17分钟";
    self.timeLabel.font = [UIFont systemFontOfSize:12];
    self.timeLabel.textColor = [UIColor colorWithHexString:@"0x999999"];
    [self.contentView addSubview:self.timeLabel];
    
    self.cellHeight = self.timeLabel.maxY + 15;
    self.stateImgView.centerY = self.stateLabel.centerY = self.cellHeight / 2;
}

@end
