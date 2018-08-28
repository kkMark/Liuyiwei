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

@interface HomePageViewController ()

@property (nonatomic, strong) HomePageView *homePageView;
@property (nonatomic, strong) HomePageMenuView *menuView;

@end

@implementation HomePageViewController
@synthesize menuView;
@synthesize homePageView;

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.homePageView setBackgroundColor:kPageBgColor];
}

#pragma mark - lazy
- (HomePageMenuView *)menuView {
    
    if (!menuView) {
        
        menuView = [[HomePageMenuView alloc] initWithFrame:CGRectMake(0, self.statusBarHeight, ScreenWidth, 0)];
        menuView.height = menuView.headerHeight;
        [self.view addSubview:menuView];
        
        @weakify(self);
        [menuView setSelectIndex:^(NSInteger index) {
            @strongify(self);
            self.homePageView.index = index;
        }];
    }
    
    return menuView;
}

- (HomePageView *)homePageView {
    
    if (!homePageView) {
        
        float height = ScreenHeight - self.tabBarHeight - self.menuView.maxY;
        homePageView = [[HomePageView alloc] initWithFrame:CGRectMake(0, self.menuView.maxY, ScreenWidth, height)];
        [self.view addSubview:homePageView];
        
        @weakify(self);
        [homePageView setMoveBlock:^(NSInteger index) {
            @strongify(self);
            self.menuView.index = index;
        }];
    }
    
    return homePageView;
}

@end
