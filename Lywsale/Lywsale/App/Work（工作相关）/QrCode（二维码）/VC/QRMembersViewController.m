//
//  QRMembersViewController.m
//  Lywsale
//
//  Created by 尚洋 on 2018/10/12.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "QRMembersViewController.h"

@interface QRMembersViewController ()

@property (nonatomic ,strong) UIImageView *QRImageView;

@end

@implementation QRMembersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    if (self.type == 0) {
//        self.view.backgroundColor = [UIColor blueColor];
//    }else{
//        self.view.backgroundColor = [UIColor yellowColor];
//    }
    
    [self initUI];
    
}

-(void)initUI{
    
    self.QRImageView = [UIImageView new];
    self.QRImageView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.QRImageView];
    
    self.QRImageView.sd_layout
    .centerXEqualToView(self.view)
    .topSpaceToView(self.view, 30)
    .widthRatioToView(self.view, 0.7)
    .heightEqualToWidth();
    
    UILabel *qrTitleLabel = [UILabel new];
    qrTitleLabel.text = @"扫描上方二维码或分享到微信";
    qrTitleLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:qrTitleLabel];
    
    qrTitleLabel.sd_layout
    .centerXEqualToView(self.view)
    .topSpaceToView(self.QRImageView, 8)
    .heightIs(13);
    [qrTitleLabel setSingleLineAutoResizeWithMaxWidth:self.QRImageView.width];
    
    UIView *leftView = [UIView new];
    leftView.userInteractionEnabled = YES;
    UITapGestureRecognizer *leftTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(left:)];
    [leftView addGestureRecognizer:leftTap];
    [self.view addSubview:leftView];
    
    leftView.sd_layout
    .leftEqualToView(qrTitleLabel)
    .topSpaceToView(qrTitleLabel, 12)
    .widthIs(50)
    .heightIs(80);
    
    UIImageView *leftImageView = [UIImageView new];
    leftImageView.image = [UIImage imageNamed:@"APP_WeChat"];
    [leftView addSubview:leftImageView];
    
    leftImageView.sd_layout
    .centerXEqualToView(leftView)
    .topSpaceToView(leftView, 0)
    .widthIs(50)
    .heightEqualToWidth();
    
    UILabel *leftLabel = [UILabel new];
    leftLabel.text = @"微信";
    leftLabel.font = [UIFont systemFontOfSize:13];
    [leftView addSubview:leftLabel];
    
    leftLabel.sd_layout
    .centerXEqualToView(leftView)
    .topSpaceToView(leftImageView, 10)
    .heightIs(13);
    [leftLabel setSingleLineAutoResizeWithMaxWidth:50];
    
    
    UIView *rightView = [UIView new];
    rightView.userInteractionEnabled = YES;
    UITapGestureRecognizer *rightTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(right:)];
    [rightView addGestureRecognizer:rightTap];
    [self.view addSubview:rightView];
    
    rightView.sd_layout
    .rightEqualToView(qrTitleLabel)
    .topSpaceToView(qrTitleLabel, 12)
    .widthIs(50)
    .heightIs(80);
    
    UIImageView *rightImageView = [UIImageView new];
    rightImageView.image = [UIImage imageNamed:@"APP_CircleOfFriends"];
    [rightView addSubview:rightImageView];
    
    rightImageView.sd_layout
    .centerXEqualToView(rightView)
    .topSpaceToView(rightView, 0)
    .widthIs(50)
    .heightEqualToWidth();
    
    UILabel *rightLabel = [UILabel new];
    rightLabel.text = @"朋友圈";
    rightLabel.font = [UIFont systemFontOfSize:13];
    [rightView addSubview:rightLabel];
    
    rightLabel.sd_layout
    .centerXEqualToView(rightView)
    .topSpaceToView(rightImageView, 10)
    .heightIs(13);
    [rightLabel setSingleLineAutoResizeWithMaxWidth:50];
    
    
}

-(void)left:(UITapGestureRecognizer *)sender{
    
}

-(void)right:(UITapGestureRecognizer *)sender{
    
}

@end
