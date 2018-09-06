//
//  WriteInfoCertificateCell.m
//  Lywsale
//
//  Created by M on 2018/8/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "WriteInfoCertificateCell.h"

@interface WriteInfoCertificateCell ()

@property (nonatomic, strong) UIImageView *imgView;

@end

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
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = kMainTextColor;
    [self.contentView addSubview:titleLabel];

    // 背景图片
    UIImage *cameraBgImg = [UIImage imageNamed:@"cameraBgImg"];
    self.imgView = [[UIImageView alloc] initWithImage:cameraBgImg];
    self.imgView.frame = CGRectMake(titleLabel.maxX + 15, 15, 60, 60);
    [self.contentView addSubview:self.imgView];
    
    // 相机图片
    UIImage *cameraImg = [UIImage imageNamed:@"cameraImg"];
    UIImageView *cameraImgView = [[UIImageView alloc] initWithImage:cameraImg];
    cameraImgView.frame = CGRectMake(0, 10, 24, 24);
    cameraImgView.centerX = self.imgView.width / 2;
    [self.imgView addSubview:cameraImgView];
    
    // 相机文本
    UILabel *cameraLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, cameraImgView.maxY + 5, self.imgView.width, 0)];
    cameraLabel.text = @"上传图片";
    cameraLabel.font = [UIFont systemFontOfSize:10];
    cameraLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
    cameraLabel.textAlignment = NSTextAlignmentCenter;
    cameraLabel.height = [cameraLabel getTextHeight];
    [self.imgView addSubview:cameraLabel];
    
    self.cellHeight = self.imgView.maxY + 15;
}

@end
