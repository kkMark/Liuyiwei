//
//  PersonalViewController.m
//  Lywsale
//
//  Created by M on 2018/8/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "PersonalViewController.h"
#import "PersonalView.h"

@interface PersonalViewController ()

@property (nonatomic, strong) PersonalView *personalView;

@end

@implementation PersonalViewController
@synthesize personalView;

- (void)viewDidLoad {

    [super viewDidLoad];

    self.title = @"个人中心";
    self.personalView.dataSources = @[@"我的足迹", @"我的银行卡", @"我的档案", @"帮助反馈", @"切换为店员", @"更多"];
}

- (PersonalView *)personalView {
    
    if (!personalView) {
        
        personalView = [[PersonalView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.navHeight) style:UITableViewStyleGrouped];
        [self.view addSubview:personalView];
    }
    
    return personalView;
}

@end
