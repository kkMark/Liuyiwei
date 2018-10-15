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
    
    if (self.type == 0) {
        self.view.backgroundColor = [UIColor blueColor];
    }else{
        self.view.backgroundColor = [UIColor yellowColor];
    }
    
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
    
    
    
}

@end
