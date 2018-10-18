//
//  WriteInfoViewController.m
//  Lywsale
//
//  Created by M on 2018/8/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "WriteInfoViewController.h"
#import "WriteInfoView.h"

@interface WriteInfoViewController ()

@property (nonatomic, strong) WriteInfoView *writeInfoView;
@property (nonatomic, strong) UIButton *okBtn;

@end

@implementation WriteInfoViewController
@synthesize writeInfoView;
@synthesize okBtn;

- (void)viewDidLoad {

    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.writeInfoView.dataSources = @[@"姓名", @"我是", @"邀请码", @"工作证"];
}

#pragma mark - lazy
- (WriteInfoView *)writeInfoView {
    
    if (!writeInfoView) {
        
        writeInfoView = [[WriteInfoView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.navHeight - self.okBtn.height) style:UITableViewStyleGrouped];
        [self.view addSubview:writeInfoView];
    }
    
    return writeInfoView;
}

- (UIButton *)okBtn {
    
    if (!okBtn) {
        
        // 确定按钮
        okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        okBtn.backgroundColor = kMainColor;
        okBtn.frame = CGRectMake(0, ScreenHeight - self.navHeight - 40, ScreenWidth, 40);
        okBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [okBtn setTitle:@"确定加入" forState:UIControlStateNormal];
        [okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.view addSubview:okBtn];
        
        @weakify(self);
        [[okBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
           
            @strongify(self);
            NSString *vcName = @"RCompleteViewController";
            [self.navigationController pushViewController:[NSClassFromString(vcName) new] animated:YES];
        }];
    }
    
    return okBtn;
}

@end
