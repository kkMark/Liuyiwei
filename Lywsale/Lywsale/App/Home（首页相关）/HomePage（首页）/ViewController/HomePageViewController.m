//
//  HomePageViewController.m
//  Lywsale
//
//  Created by M on 2018/8/25.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageMenuView.h"
#import <DKViewPage.h>

@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
 
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self initHeaderView];
}

- (void)initHeaderView {
    
    HomePageMenuView *menuView = [[HomePageMenuView alloc] initWithFrame:CGRectMake(0, self.statusBarHeight, ScreenWidth, 0)];
    menuView.height = menuView.headerHeight;
    menuView.userInteractionEnabled = YES;
    [self.view addSubview:menuView];
}

@end
