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
@property (nonatomic, strong) UIView *nextView;

@end

@implementation UploadInfoViewController
@synthesize uploadInfoView;
@synthesize nextView;

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
    self.uploadInfoView.dataSources = @[@"", @""];
}

- (UploadInfoView *)uploadInfoView {
    
    if (!uploadInfoView) {
        
        uploadInfoView = [[UploadInfoView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.navHeight - self.nextView.height) style:UITableViewStylePlain];
        uploadInfoView.backgroundColor = [UIColor whiteColor];
        uploadInfoView.userType = self.userType;
        [self.view addSubview:uploadInfoView];
    }
    
    return uploadInfoView;
}

- (UIView *)nextView {
    
    if (!nextView) {
        
        nextView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight - self.navHeight - 80, ScreenWidth, 80)];
        nextView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:nextView];
        
        UIButton *okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        okBtn.backgroundColor = kMainColor;
        okBtn.frame = CGRectMake(15, 0, ScreenWidth - 30, 40);
        okBtn.centerY = nextView.height / 2;
        okBtn.layer.cornerRadius = okBtn.height / 2;
        okBtn.layer.masksToBounds = YES;
        okBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [okBtn setTitle:@"下一步" forState:UIControlStateNormal];
        [okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [nextView addSubview:okBtn];
        
        if (self.userType == PharmaceuticalType) {
            [okBtn setTitle:@"提交审核" forState:UIControlStateNormal];
        }

        [[okBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            
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
    
    return nextView;
}

@end
