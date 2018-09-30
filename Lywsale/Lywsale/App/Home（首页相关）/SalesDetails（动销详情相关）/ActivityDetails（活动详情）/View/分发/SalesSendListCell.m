//
//  SalesSendListCell.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/9/30.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "SalesSendListCell.h"

@interface SalesSendListCell ()

@property (nonatomic, strong) UIImageView *selImgView;

@end

@implementation SalesSendListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    UIView *lineView = [[UIView alloc] init];
    lineView.frame = CGRectMake(30, 0, ScreenWidth - 60, 0.2);
    lineView.backgroundColor = [UIColor colorWithHexString:@"0xC8CEE9"];
    [self.contentView addSubview:lineView];
    
    UIImageView *headerImgView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 0, 45, 45)];
    headerImgView.image = [UIImage imageNamed:@"TestHeadImg"];
    headerImgView.centerY = 30;
    headerImgView.layer.cornerRadius = headerImgView.height / 2;
    headerImgView.layer.masksToBounds = YES;
    [self.contentView addSubview:headerImgView];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(headerImgView.maxX + 15, 0, ScreenWidth / 2, 20)];
    nameLabel.centerY = headerImgView.centerY;
    nameLabel.text = @"黄药师";
    nameLabel.font = [UIFont systemFontOfSize:14];
    nameLabel.textColor = kMainTextColor;
    [self.contentView addSubview:nameLabel];
    
    self.selImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 18, 18)];
    self.selImgView.image = [UIImage imageNamed:@"checkbox_sel"];
    self.selImgView.centerY = headerImgView.centerY;
    self.selImgView.x = ScreenWidth - self.selImgView.width - 50;
    [self.contentView addSubview:self.selImgView];
}

- (void)setIsSel:(BOOL)isSel {
    
    _isSel = isSel;
    self.selImgView.image = [UIImage imageNamed:isSel ? @"checkbox_sel" : @"checkbox_nor"];
}

@end
