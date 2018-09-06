//
//  SelectTypeCell.m
//  Lywsale
//
//  Created by M on 2018/8/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "SelectTypeCell.h"

@interface SelectTypeCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *addressLabel;

@end

@implementation SelectTypeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    NSArray *titles = @[@"阿里健康大药房", @"广州阿里健康有限公司赤岗分店", @"广州市海珠区赤岗北路111号自编底层1号"];
    for (int i = 0; i < 3; i++) {
        
        UILabel *tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, ScreenWidth - 40, 20)];
        tempLabel.y = 15 + tempLabel.height * i;
        tempLabel.text = titles[i];
        tempLabel.font = [UIFont systemFontOfSize:14];
        tempLabel.textColor = i == 0 ? kMainTextColor : [UIColor colorWithHexString:@"0x666666"];
        [self.contentView addSubview:tempLabel];
        
        if (i == 0) {
            self.titleLabel = tempLabel;
        }
        else if (i == 1) {
            self.nameLabel = tempLabel;
        }
        else {
            self.addressLabel = tempLabel;
        }
    }
}


#pragma mark - set
- (void)setUserType:(RegisteredUserType)userType {
    
    _userType = userType;
    if (userType != PharmacyType) {
        self.addressLabel.hidden = YES;
    }
}

- (void)setIsAddNewType:(BOOL)isAddNewType {
    
    _isAddNewType = isAddNewType;
    
    NSString *typeString = @"药店";
    if (self.userType == ChainType) {
        typeString = @"连锁公司";
    }
    else if (self.userType == PharmaceuticalType) {
        typeString = @"药企";
    }
    
    if (isAddNewType) {
        
        self.titleLabel.text = [NSString stringWithFormat:@"新增您的%@", typeString];
        self.nameLabel.text = [NSString stringWithFormat:@"没有找到%@？点击 这里新增", typeString];
        self.addressLabel.text = @"";
        
        NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:self.nameLabel.text];
        [attStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0, attStr.length)];
        [attStr addAttribute:NSForegroundColorAttributeName value:kMainColor range:NSMakeRange(attStr.length - 4, 4)];
        self.nameLabel.attributedText = attStr;
    }
}

- (void)setModel:(SelectTypeModel *)model {
    
    self.titleLabel.text = @"";
    self.nameLabel.text = @"";
    self.addressLabel.text = @"";
}

@end
