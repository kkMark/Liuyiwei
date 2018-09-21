//
//  ActivityDetailsViewController.m
//  Lywsale
//
//  Created by M on 2018/9/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "ActivityDetailsViewController.h"
#import "ActivityDetailsView.h"

@interface ActivityDetailsViewController ()

@property (nonatomic, strong) ActivityDetailsView *detailsView;

@end

@implementation ActivityDetailsViewController
@synthesize detailsView;

- (void)viewDidLoad {

    [super viewDidLoad];
    [self setTitle:@"活动详情"];
    [self addNavRight];
    [self uploadBtn];
}

- (void)addNavRight {
    
    [self addNavRightTitle:@"上传历史" complete:^{
        
    }];
}

- (void)uploadBtn {
    
    UIButton *uploadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    uploadBtn.backgroundColor = kMainColor;
    uploadBtn.frame = CGRectMake(0, self.detailsView.maxY, ScreenWidth, 45);
    uploadBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [uploadBtn setTitle:@"去上传凭证" forState:UIControlStateNormal];
    [uploadBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[uploadBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
        NSString *vcName = @"UploadCredentialsViewController";
        [self.navigationController pushViewController:[NSClassFromString(vcName) new] animated:YES];
    }];
    [self.view addSubview:uploadBtn];
}

#pragma mark - lazy
- (ActivityDetailsView *)detailsView {
    
    if (!detailsView) {
        
        detailsView = [[ActivityDetailsView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.navHeight - 45)];
        [self.view addSubview:detailsView];
    }
    
    return detailsView;
}

@end
