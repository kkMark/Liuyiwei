//
//  TrainingViewController.m
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/29.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "TrainingViewController.h"
#import "TrainingView.h"

@interface TrainingViewController ()

@end

@implementation TrainingViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    TrainingView *trainingView = [[TrainingView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view addSubview:trainingView];
}
    
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

@end
