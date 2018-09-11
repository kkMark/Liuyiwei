//
//  BuyCell.m
//  Lywsale
//
//  Created by M on 2018/9/11.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BuyCell.h"

@interface BuyCell ()

@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *discountLabel;

@end

@implementation BuyCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(15, 10, ScreenWidth - 30, 0.5)];
    lineView.backgroundColor = [UIColor colorWithHexString:@"0xEEF0F3"];
    [self.contentView addSubview:lineView];
    
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth - 100 - 15, lineView.maxY + 15, 100, 15)];
    self.priceLabel.text = @"¥2000";
    self.priceLabel.font = [UIFont systemFontOfSize:15];
    self.priceLabel.textColor = kMainTextColor;
    self.priceLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.priceLabel];
    
    self.discountLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.priceLabel.x - 100, 0, 100, 15)];
    self.discountLabel.centerY = self.priceLabel.centerY;
    self.discountLabel.text = @"合计：8.5 折";
    self.discountLabel.font = [UIFont systemFontOfSize:14];
    self.discountLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
    [self.contentView addSubview:self.discountLabel];    
}

@end
