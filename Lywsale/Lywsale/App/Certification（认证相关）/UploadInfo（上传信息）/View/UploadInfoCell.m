//
//  UploadInfoCell.m
//  Lywsale
//
//  Created by M on 2018/8/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "UploadInfoCell.h"

@interface UploadInfoCell ()

@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation UploadInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubviews];
    }
    
    return self;
}

- (void)setupSubviews {
    
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 20, ScreenWidth - 60, 0)];
    self.imgView.height = self.imgView.width / 2;
    self.imgView.layer.cornerRadius = 5;
    self.imgView.layer.masksToBounds = YES;
    self.imgView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.imgView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, CGRectGetMaxY(self.imgView.frame) + 10, ScreenWidth - 60, 35)];
    titleLabel.text = @"*点击上图上传营业执照，以便更快审核药店信息";
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = kMainColor;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.numberOfLines = 0;
    [self.contentView addSubview:titleLabel];
}

@end
