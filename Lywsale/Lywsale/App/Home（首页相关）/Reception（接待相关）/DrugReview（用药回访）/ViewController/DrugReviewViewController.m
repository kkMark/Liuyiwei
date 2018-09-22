//
//  DrugReviewViewController.m
//  Lywsale
//
//  Created by M on 2018/9/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "DrugReviewViewController.h"
#import "DrugReviewView.h"

@interface DrugReviewViewController ()

@property (nonatomic, strong) DrugReviewView *drugReviewView;

@end

@implementation DrugReviewViewController
@synthesize drugReviewView;

- (void)viewDidLoad {

    [super viewDidLoad];
    [self setTitle:@"用药回访"];
    [self okBtn];
}

- (DrugReviewView *)drugReviewView {
    
    if (!drugReviewView) {
        
        drugReviewView = [[DrugReviewView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        drugReviewView.height = ScreenHeight - self.navHeight - 45;
        drugReviewView.dataSources = @[@"是否下次回访", @"下次回访日期"];
        [self.view addSubview:drugReviewView];
    }
    
    return drugReviewView;
}

- (void)okBtn {
    
    UIButton *okBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    okBtn.backgroundColor = kMainColor;
    okBtn.frame = CGRectMake(0, self.drugReviewView.maxY, ScreenWidth, 45);
    okBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [okBtn setTitle:@"确  定" forState:UIControlStateNormal];
    [okBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[okBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
    }];
    [self.view addSubview:okBtn];
}

@end
