//
//  SalesTaskViewController.m
//  Lywsale
//
//  Created by M on 2018/8/28.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "SalesTaskViewController.h"
#import "SalesTaskView.h"

@interface SalesTaskViewController ()

@property (nonatomic, strong) SalesTaskView *salesTaskView;

@end

@implementation SalesTaskViewController
@synthesize salesTaskView;

- (void)viewDidLoad {

    [super viewDidLoad];

    self.title = @"动销任务";
    self.salesTaskView.dataSources = @[@"", @"", @""];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    self.salesTaskView.height = self.view.height;
}

#pragma mark - lazy
- (SalesTaskView *)salesTaskView {
    
    if (!salesTaskView) {
        
        salesTaskView = [[SalesTaskView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        salesTaskView.backgroundColor = kPageBgColor;
        salesTaskView.isLookAll = [self.isLookAll boolValue];
        [self.view addSubview:salesTaskView];
        
        @weakify(self);
        [salesTaskView setGoViewControllerBlock:^(UIViewController *vc) {
            
            @strongify(self);
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }
    
    return salesTaskView;
}

@end
