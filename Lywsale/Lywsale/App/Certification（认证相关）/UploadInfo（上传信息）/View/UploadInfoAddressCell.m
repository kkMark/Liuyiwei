//
//  UploadInfoAddressCell.m
//  Lywsale
//
//  Created by M on 2018/8/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "UploadInfoAddressCell.h"

@interface UploadInfoAddressCell ()

@property (nonatomic, strong) UILabel *addressLabel;

@end

@implementation UploadInfoAddressCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    self.addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 65, ScreenWidth - 60, 35)];
    self.addressLabel.text = @"请定位药店位置";
    self.addressLabel.font = [UIFont systemFontOfSize:14];
    self.addressLabel.textColor = kMainColor;
    self.addressLabel.textAlignment = NSTextAlignmentCenter;
    self.addressLabel.numberOfLines = 0;
    [self.contentView addSubview:self.addressLabel];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, CGRectGetMaxY(self.addressLabel.frame) + 10, ScreenWidth - 60, 35)];
    titleLabel.text = @"*请您在“定位药店位置”中标出新增药店的精确位置，否则将无法使用部分扫码功能";
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = kMainColor;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.numberOfLines = 0;
    [self.contentView addSubview:titleLabel];
}

@end
