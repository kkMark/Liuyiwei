//
//  WriteInfoCertificateCell.m
//  Lywsale
//
//  Created by M on 2018/8/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "WriteInfoCertificateCell.h"

@implementation WriteInfoCertificateCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 45, 45)];
    titleLabel.text = @"工作证";
    titleLabel.font = [UIFont boldSystemFontOfSize:14];
    titleLabel.textColor = kMainTextColor;
    [self.contentView addSubview:titleLabel];

}

@end
