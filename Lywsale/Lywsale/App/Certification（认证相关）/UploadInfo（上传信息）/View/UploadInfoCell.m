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
    
    // 背景图片
    UIImage *cameraBgImg = [UIImage imageNamed:@"cameraBgImg"];
    self.imgView = [[UIImageView alloc] initWithImage:cameraBgImg];
    self.imgView.size = cameraBgImg.size;
    self.imgView.centerX = ScreenWidth / 2;
    self.imgView.y = 25;
    [self.contentView addSubview:self.imgView];
    
    // 相机图片
    UIImage *cameraImg = [UIImage imageNamed:@"cameraImg"];
    UIImageView *cameraImgView = [[UIImageView alloc] initWithImage:cameraImg];
    cameraImgView.size = cameraImg.size;
    cameraImgView.y = 22;
    cameraImgView.centerX = self.imgView.width / 2;
    [self.imgView addSubview:cameraImgView];
    
    // 相机文本
    UILabel *cameraLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, cameraImgView.maxY + 7, self.imgView.width, 0)];
    cameraLabel.text = @"上传营业执照";
    cameraLabel.font = [UIFont systemFontOfSize:10];
    cameraLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
    cameraLabel.textAlignment = NSTextAlignmentCenter;
    cameraLabel.height = [cameraLabel getTextHeight];
    [self.imgView addSubview:cameraLabel];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, self.imgView.maxY + 25, ScreenWidth - 60, 0)];
    titleLabel.text = @"点击上图上传营业执照，以便更快审核药店信息";
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.textColor = kMainTextColor;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.numberOfLines = 0;
    titleLabel.height = [titleLabel getTextHeight];
    [self.contentView addSubview:titleLabel];
    
    self.cellHeight = titleLabel.maxY + 25;
}

@end
