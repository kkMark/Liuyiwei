//
//  ReceptionViewController.m
//  Lywsale
//
//  Created by M on 2018/9/11.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "ReceptionViewController.h"
#import "ReceptionHeaderView.h"
#import "BaseHttpRequest.h"
#import <DKViewPage.h>

@interface ReceptionViewController ()

@property (nonatomic, strong) DKViewPage *viewPage;
@property (nonatomic, strong) ReceptionHeaderView *headerView;

@end

@implementation ReceptionViewController
@synthesize viewPage;
@synthesize headerView;

- (void)viewDidLoad {

    [super viewDidLoad];

    self.title = @"接待跟踪";
    [self.view setBackgroundColor:kPageBgColor];
    [self.viewPage setBackgroundColor:[UIColor whiteColor]];
}


- (ReceptionHeaderView *)headerView {
    
    if (!headerView) {
        
        headerView = [[ReceptionHeaderView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
        headerView.height = headerView.viewHeight;
        [self.view addSubview:headerView];
        
        @weakify(self);
        [headerView setGoViewControllerBlock:^(UIViewController *vc) {
           
            @strongify(self);
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }
    
    return headerView;
}

- (DKViewPage *)viewPage {
    
    if (!viewPage) {
        
        NSArray *titles = @[@"顾客画像", @"购买历史", @"维护历史"];
        NSArray *vcNames = @[@"CustomerInfoViewController", @"BuyViewController", @"MaintenanceViewController"];
        NSMutableArray *options = [NSMutableArray array];
        for (int i = 0; i < titles.count; i++) {
            
            DKViewPageOption *option = [DKViewPageOption optionWithTitle:titles[i] viewController:[NSClassFromString(vcNames[i]) new]];
            [options addObject:option];
        }
        
        UIViewController *vc = [[BaseHttpRequest new] getCurrentViewController];
        viewPage = [[DKViewPage alloc] initWithFrame:CGRectMake(0, self.headerView.maxY + 10, ScreenWidth, ScreenHeight - self.navHeight - self.headerView.height) options:options currentViewController:vc];
        viewPage.titleSelectedColor = kMainColor;
        viewPage.titleViewBackgroundColor = [UIColor whiteColor];
        viewPage.titleNormalColor = [UIColor colorWithHexString:@"0x999999"];
        viewPage.titleFont = [UIFont systemFontOfSize:14];
        viewPage.indicatorColor =  kMainColor;;
        viewPage.indicatorHeight = 2;
        viewPage.titleViewFrame = CGRectMake(0, 0, ScreenWidth, 45);
        viewPage.controllerViewFrame = CGRectMake(0, 0, ScreenWidth, viewPage.height);
        [self.view addSubview:viewPage];
    }
    
    return viewPage;
}

@end
