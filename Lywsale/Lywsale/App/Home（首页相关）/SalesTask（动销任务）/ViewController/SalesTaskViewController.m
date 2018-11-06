//
//  SalesTaskViewController.m
//  Lywsale
//
//  Created by M on 2018/8/28.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "SalesTaskViewController.h"
#import "SalesTaskViewModel.h"
#import "SalesTaskView.h"
#import "SalesTaskModel.h"

@interface SalesTaskViewController ()

@property (nonatomic, strong) SalesTaskView *salesTaskView;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, assign) int page;
@property (nonatomic, assign) int type;

@end

@implementation SalesTaskViewController
@synthesize salesTaskView;
@synthesize headerView;

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.title = @"动销任务";
    self.page = 1;
    self.type = 0;

    [self initNavRight];
    [self request];
}

- (void)initNavRight {
    
    [self addNavRightImage:@"AppSearch" complete:^{
        
    }];
}

#pragma mark - lazy
- (UIView *)headerView {
    
    if (!headerView) {
        
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 45)];
        headerView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:headerView];
        
        UIView *headerLine = [[UIView alloc] initWithFrame:CGRectMake(0, headerView.height - 2, 100, 2)];
        headerLine.backgroundColor = kMainColor;
        headerLine.centerX = ScreenWidth / 3 / 2;
        [headerView addSubview:headerLine];
        
        NSArray *titles = @[@"待处理 (10)", @"已完成 (10)", @"已过期 (10)"];
        for (int i = 0; i < 3; i++) {
            
            UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            titleBtn.tag = i + 10;
            titleBtn.selected = i == 0 ? YES : NO;
            titleBtn.frame = CGRectMake(ScreenWidth / 3 * i, 0, ScreenWidth / 3, headerView.height);
            titleBtn.titleLabel.font = [UIFont systemFontOfSize:14];
            [titleBtn setTitle:titles[i] forState:UIControlStateNormal];
            [titleBtn setTitleColor:[UIColor colorWithHexString:@"0x999999"] forState:UIControlStateNormal];
            [titleBtn setTitleColor:kMainColor forState:UIControlStateSelected];
            [headerView addSubview:titleBtn];
            
            @weakify(self);
            [[titleBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
             
                @strongify(self);
                self.type = i;
                self.page = 1;
                [self request];
                
                [UIView animateWithDuration:0.25 animations:^{
                   
                    for (int index = 0; index < titles.count; index++) {
                        
                        UIButton *tempBtn = [self.view viewWithTag:index + 10];
                        if (index == i) tempBtn.selected = YES;
                        else tempBtn.selected = NO;
                    }
                    
                    headerLine.centerX = titleBtn.centerX;
                }];
            }];
        }
    }
    
    return headerView;
}

- (SalesTaskView *)salesTaskView {
    
    if (!salesTaskView) {
        
        salesTaskView = [[SalesTaskView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        salesTaskView.y = self.headerView.height;
        salesTaskView.height = ScreenHeight - self.headerView.height - self.navHeight;
        salesTaskView.backgroundColor = kPageBgColor;
        [self.view addSubview:salesTaskView];
        
        @weakify(self);
        [salesTaskView setGoViewControllerBlock:^(UIViewController *vc) {
            
            @strongify(self);
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }
    
    return salesTaskView;
}


#pragma mark - request
- (void)request {
    
    [[SalesTaskViewModel new] getSalesTask:self.page type:0 success:^(NSDictionary *dict) {
        
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *tempDict in dict[@"list"]) {
            
            SalesTaskModel *model = [SalesTaskModel new];
            [model setValuesForKeysWithDictionary:tempDict];
            [arr addObject:model];
        }
        
        self.salesTaskView.dataSources = arr;
        
    } failure:^(NSError *error) {
        
    }];
}

@end
