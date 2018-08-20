//
//  ApplyViewController.m
//  Lywsale
//
//  Created by M on 2018/8/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "ApplyViewController.h"
#import "ApplyView.h"
#import "UploadInfoViewController.h"

@interface ApplyViewController ()

@property (nonatomic, strong) ApplyView *applyView;
@property (nonatomic, strong) UIView *nextView;

@end

@implementation ApplyViewController
@synthesize applyView;
@synthesize nextView;

- (void)viewDidLoad {

    [super viewDidLoad];
    
    if (self.title.length == 0) {
        
        NSString *title = @"新增药店";
        NSArray *titles = @[@"请选择所在省市区", @"请选择所在街道", @"请填写招牌名称", @"请填写营业执照上公司名称"];
        if (self.userType == ChainType) {
            title = @"连锁入驻申请";
            titles = @[@"请选择所在省市区", @"请选择所在街道", @"请填写营业执照上详细地址", @"请填写营业执照上公司名称", @"请填写门店总数", @"请填写连锁总员工数", @"请填写联系人姓名", @"请填写联系人电话", @"请填写推荐码（选填）"];
        }
        else if (self.userType == PharmaceuticalType) {
            title = @"药企入驻申请";
            titles = @[@"请选择所在省市区", @"请选择所在街道", @"请填写营业执照上详细地址", @"请填写营业执照上公司名称", @"请填写联系人姓名", @"请填写联系人电话", @"请填写推荐码（选填）"];
        }
        
        self.title = title;
        self.applyView.dataSources = titles;
    }
    else {
        
        NSArray *titles = @[@"请填写联系人姓名", @"请填写联系人电话", @"请填写联系人职务", @"请填写门店总数", @"请填写连锁总员工数", @"推荐码（选填）"];
        self.applyView.dataSources = titles;
    }
}

- (ApplyView *)applyView {
    
    if (!applyView) {
        
        applyView = [[ApplyView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.navHeight - self.nextView.height) style:UITableViewStyleGrouped];
        [self.view addSubview:applyView];
    }
    
    return applyView;
}

- (UIView *)nextView {
    
    if (!nextView) {
        
        nextView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight - self.navHeight - 115, ScreenWidth, 115)];
        nextView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:nextView];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, ScreenWidth - 30, 30)];
        titleLabel.text = @"*请确保信息填写正确，我们会尽快与您进行电话沟通确认";
        titleLabel.font = [UIFont systemFontOfSize:12];
        titleLabel.textColor = kMainColor;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.numberOfLines = 0;
        [nextView addSubview:titleLabel];
        
        UIButton *okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        okBtn.backgroundColor = kMainColor;
        okBtn.frame = CGRectMake(15, CGRectGetMaxY(titleLabel.frame) + 10, ScreenWidth - 30, 40);
        okBtn.layer.cornerRadius = okBtn.height / 2;
        okBtn.layer.masksToBounds = YES;
        okBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [okBtn setTitle:@"下一步" forState:UIControlStateNormal];
        [okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [nextView addSubview:okBtn];
        
        UIView *lineView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0.5)];
        lineView.backgroundColor = kLineColor;
        [nextView addSubview:lineView];
        
        if ([self.title isEqualToString:@"填写信息"]) {
            [okBtn setTitle:@"提交审核" forState:UIControlStateNormal];
        }
        
        [[okBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
           
            if ([okBtn.titleLabel.text isEqualToString:@"下一步"]) {
                
                UploadInfoViewController *vc = [UploadInfoViewController new];
                vc.userType = self.userType;
                [self.navigationController pushViewController:vc animated:YES];
            }
        }];
    }
    
    return nextView;
}

@end
