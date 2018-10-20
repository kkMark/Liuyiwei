//
//  HomePageViewController.m
//  Lywsale
//
//  Created by M on 2018/8/25.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageViewModel.h"
#import "HomePageMenuView.h"
#import "DataPanelView.h"

@interface HomePageViewController ()

@property (nonatomic, strong) DataPanelView *dataPanelView;
@property (nonatomic, strong) HomePageMenuView *menuView;

@end

@implementation HomePageViewController
@synthesize menuView;
@synthesize dataPanelView;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"UpdateView" object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        [self updateView];
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];

    self.dataPanelView.dataSources = @[@"", @"", @"", @"", @""];
    
    [self getDataSource];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    if (self.navigationController.viewControllers.count > 1) {
        [self.navigationController setNavigationBarHidden:NO animated:animated];
    }
}

- (void)updateView {
    
    [self.menuView removeFromSuperview];
    [self.dataPanelView removeFromSuperview];
    
    self.menuView = nil;
    self.dataPanelView = nil;
}

#pragma mark - lazy
- (HomePageMenuView *)menuView {
    
    if (!menuView) {
        
        menuView = [[HomePageMenuView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, self.statusBarHeight + 115)];
        menuView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:menuView];
        
        @weakify(self);
        [self.menuView setGoViewControllerBlock:^(UIViewController *vc) {
            
            @strongify(self);
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }    
    return menuView;
}

- (DataPanelView *)dataPanelView {
    
    if (!dataPanelView) {
        
        float height = ScreenHeight - self.tabBarHeight - self.menuView.maxY;
        dataPanelView = [[DataPanelView alloc] initWithFrame:CGRectMake(0, self.menuView.maxY, ScreenWidth, height) style:UITableViewStyleGrouped];
        [self.view addSubview:dataPanelView];
        
        @weakify(self);
        [self.dataPanelView setGoViewControllerBlock:^(UIViewController *vc) {
            
            @strongify(self);
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }
    
    return dataPanelView;
}

#pragma mark - request
- (void)getDataSource {
    
    [[HomePageViewModel new] getSalesSituationSuccess:^(NSDictionary *dict) {
        
        
        
    } failure:nil];
}

@end
