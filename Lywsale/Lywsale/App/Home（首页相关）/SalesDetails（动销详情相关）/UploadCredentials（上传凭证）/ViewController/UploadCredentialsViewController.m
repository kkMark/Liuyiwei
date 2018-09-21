//
//  UploadCredentialsViewController.m
//  Lywsale
//
//  Created by M on 2018/9/21.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "UploadCredentialsViewController.h"
#import "UploadCredentialsView.h"

@interface UploadCredentialsViewController ()

@property (nonatomic, strong) UploadCredentialsView *uploadView;

@end

@implementation UploadCredentialsViewController
@synthesize uploadView;

- (void)viewDidLoad {

    [super viewDidLoad];
    [self setTitle:@"上传凭证"];
    
    [self uploadBtn];
}

#pragma mark - lazy
- (UploadCredentialsView *)uploadView {
    
    if (!uploadView) {
        
        uploadView = [[UploadCredentialsView alloc] initWithFrame:self.view.frame];
        uploadView.height = self.view.height - self.navHeight - 45;
        [self.view addSubview:uploadView];
    }
    
    return uploadView;
}

- (void)uploadBtn {
    
    UIButton *uploadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    uploadBtn.backgroundColor = kMainColor;
    uploadBtn.frame = CGRectMake(0, self.uploadView.maxY, ScreenWidth, 45);
    uploadBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [uploadBtn setTitle:@"确  定" forState:UIControlStateNormal];
    [uploadBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[uploadBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
    }];
    [self.view addSubview:uploadBtn];
}

@end
