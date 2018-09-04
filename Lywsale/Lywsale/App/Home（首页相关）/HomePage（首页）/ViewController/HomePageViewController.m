//
//  HomePageViewController.m
//  Lywsale
//
//  Created by M on 2018/8/25.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageMenuView.h"
#import "HomePageView.h"
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
    
    self.dataPanelView.dataSources = @[@"", @"", @"", @"", @""];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    if (self.navigationController.viewControllers.count > 1) {
        [self.navigationController setNavigationBarHidden:NO animated:animated];
    }
}

#pragma mark - lazy
- (HomePageMenuView *)menuView {
    
    if (!menuView) {
        
        menuView = [[HomePageMenuView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, self.statusBarHeight + 115)];
        menuView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:menuView];
    }    
    return menuView;
}

- (DataPanelView *)dataPanelView {
    
    if (!dataPanelView) {
        
        float height = ScreenHeight - self.tabBarHeight - self.menuView.maxY;
        dataPanelView = [[DataPanelView alloc] initWithFrame:CGRectMake(0, self.menuView.maxY, ScreenWidth, height) style:UITableViewStyleGrouped];
        [self.view addSubview:dataPanelView];
    }
    
    return dataPanelView;
}

@end
