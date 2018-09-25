//
//  ResultsHistoryViewController.m
//  Lywsale
//
//  Created by M on 2018/9/25.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "ResultsHistoryViewController.h"
#import "ResultsHistoryView.h"

@interface ResultsHistoryViewController ()

@property (nonatomic, strong) ResultsHistoryView *historyView;

@end

@implementation ResultsHistoryViewController
@synthesize historyView;

- (void)viewDidLoad {

    [super viewDidLoad];

    self.title = @"历史业绩";
    self.historyView.dataSources = @[@"", @""];
}

- (ResultsHistoryView *)historyView {
    
    if (!historyView) {
        
        historyView = [[ResultsHistoryView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.navHeight) style:UITableViewStyleGrouped];
        historyView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:historyView];
    }
    
    return historyView;
}

@end
