//
//  RCompleteViewController.m
//  Lywsale
//
//  Created by M on 2018/9/6.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "RCompleteViewController.h"

@interface RCompleteViewController ()

@end

@implementation RCompleteViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    self.title = @"注册完成";
    self.view.backgroundColor = kPageBgColor;
    
    [self setupSubviews];
}

- (void)setupSubviews {
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    
    UIImage *img = [UIImage imageNamed:@""];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
    imageView.size = img.size;
    imageView.centerX = self.view.centerX;
    imageView.y = 40;
    [bgView addSubview:imageView];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(0, imageView.maxY + 20, ScreenWidth, 0);
    titleLabel.text = @"已注册成功！";
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textColor = kMainColor;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.height = [titleLabel getTextHeight];
    [bgView addSubview:titleLabel];
    
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.frame = CGRectMake(40, titleLabel.maxY + 20, ScreenWidth - 80, 0);
    contentLabel.text = @"尊敬的用户，资料已提交到平台审核，请耐心等待， 审核的结果，我们将以短信的方式通知您，请注意查收！";
    contentLabel.font = [UIFont systemFontOfSize:12];
    contentLabel.textColor = [UIColor colorWithHexString:@"0x666666"];
    contentLabel.numberOfLines = 0;
    contentLabel.height = [contentLabel getTextHeight];
    [bgView addSubview:contentLabel];
}

@end
