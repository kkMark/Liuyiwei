//
//  MyCardCell.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/20.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "MyCardCell.h"

@interface MyCardCell ()

@property (nonatomic, strong) UIImageView *iconImgView;
@property (nonatomic, strong) UILabel *bankNameLabel;
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) UILabel *defaultCardLabel;
@property (nonatomic, strong) UIButton *defaultBtn;

@end

@implementation MyCardCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(15, 0, ScreenWidth - 30, 100)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 2;
    bgView.layer.shadowColor = [UIColor grayColor].CGColor;
    bgView.layer.shadowOffset = CGSizeMake(3, 3);
    bgView.layer.shadowOpacity = 0.3;
    [self.contentView addSubview:bgView];
    
    self.iconImgView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 40, 40)];
    self.iconImgView.centerY = bgView.centerY;
    self.iconImgView.image = [UIImage imageNamed:@""];
    [bgView addSubview:self.iconImgView];
    
    self.bankNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.iconImgView.maxX + 15, 35, 100, 15)];
    self.bankNameLabel.text = @"中国银行";
    self.bankNameLabel.font = [UIFont systemFontOfSize:14];
    self.bankNameLabel.textColor = kMainTextColor;
    [bgView addSubview:self.bankNameLabel];
    
    self.numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.bankNameLabel.x, self.bankNameLabel.maxY + 10, 180, 15)];
    self.numberLabel.text = @"**** ***** ***** **** 6646";
    self.numberLabel.font = [UIFont systemFontOfSize:14];
    self.numberLabel.textColor = kMainTextColor;
    [bgView addSubview:self.numberLabel];
    
    self.defaultCardLabel = [UILabel new];
    self.defaultCardLabel.text = @"设为默认";
    self.defaultCardLabel.font = [UIFont systemFontOfSize:12];
    self.defaultCardLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
    self.defaultCardLabel.height = 15;
    self.defaultCardLabel.width = [self.defaultCardLabel getTextWidth];
    self.defaultCardLabel.centerY = self.bankNameLabel.centerY;
    self.defaultCardLabel.x = bgView.width - self.defaultCardLabel.width - 15;
    [bgView addSubview:self.defaultCardLabel];
    
    self.defaultBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.defaultBtn.frame = CGRectMake(self.defaultCardLabel.x - 25, 0, 20, 20);
    self.defaultBtn.centerY = self.bankNameLabel.centerY;
    [self.defaultBtn setImage:[UIImage imageNamed:@"checkbox_nor"] forState:UIControlStateNormal];
    [self.defaultBtn setImage:[UIImage imageNamed:@"checkbox_sel"] forState:UIControlStateSelected];
    [bgView addSubview:self.defaultBtn];
}

@end
