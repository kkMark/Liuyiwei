//
//  UploadInfoViewController.m
//  Lywsale
//
//  Created by M on 2018/8/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "UploadInfoViewController.h"
#import "ApplyViewController.h"
#import "WriteInfoViewController.h"
#import "UploadInfoView.h"

@interface UploadInfoViewController ()

@property (nonatomic, strong) UploadInfoView *uploadInfoView;
@property (nonatomic, strong) UIButton *okBtn;

@end

@implementation UploadInfoViewController
@synthesize uploadInfoView;
@synthesize okBtn;

- (void)viewDidLoad {

    [super viewDidLoad];

    NSString *title = @"上传证照";
    if (self.userType == ChainType) {
        title = @"企业资质认证";
    }
    else if (self.userType == PharmaceuticalType) {
        title = @"企业资质认证";
    }
    
    self.title = title;
    self.uploadInfoView.dataSources = @[@""];
}

- (UploadInfoView *)uploadInfoView {
    
    if (!uploadInfoView) {
        
        uploadInfoView = [[UploadInfoView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.navHeight - self.okBtn.height) style:UITableViewStylePlain];
        uploadInfoView.userType = self.userType;
        [self.view addSubview:uploadInfoView];
    }
    
    return uploadInfoView;
}

- (UIButton *)okBtn {
    
    if (!okBtn) {
        
        // 确定按钮
        okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        okBtn.backgroundColor = kMainColor;
        okBtn.frame = CGRectMake(0, ScreenHeight - self.navHeight - 40, ScreenWidth, 40);
        okBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [okBtn setTitle:@"下一步" forState:UIControlStateNormal];
        [okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.view addSubview:okBtn];
        
        if (self.userType == PharmaceuticalType) {
            [okBtn setTitle:@"提交审核" forState:UIControlStateNormal];
        }
        
        @weakify(self);
        [[okBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            
            @strongify(self);

            // 药店
            if (self.userType == PharmacyType) {
                
                WriteInfoViewController *vc = [WriteInfoViewController new];
                vc.title = @"填写信息";
                [self.navigationController pushViewController:vc animated:YES];
            }
            // 连锁店
            else if (self.userType == ChainType) {
                
                ApplyViewController *vc = [ApplyViewController new];
                vc.title = @"填写信息";
                [self.navigationController pushViewController:vc animated:YES];
            }
            else {
                
                
            }
        }];
    }
    
    return okBtn;
}

@end
