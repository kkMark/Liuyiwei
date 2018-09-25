//
//  ResultsSettingViewController.m
//  Lywsale
//
//  Created by M on 2018/9/25.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "ResultsSettingViewController.h"
#import "ResultsSettingView.h"

@interface ResultsSettingViewController ()

@property (nonatomic, strong) ResultsSettingView *resultsView;

@end

@implementation ResultsSettingViewController
@synthesize resultsView;

- (void)viewDidLoad {

    [super viewDidLoad];

    self.title = @"业绩设置";
}

#pragma mark - lazy
- (ResultsSettingView *)resultsView {
    
    if (!resultsView) {
        
        resultsView = [[ResultsSettingView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.navHeight) style:UITableViewStyleGrouped];
        [self.view addSubview:resultsView];
    }
    
    return resultsView;
}

@end
