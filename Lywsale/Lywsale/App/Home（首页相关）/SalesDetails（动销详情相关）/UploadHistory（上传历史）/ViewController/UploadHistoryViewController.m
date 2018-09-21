
//
//  UploadHistoryViewController.m
//  Lywsale
//
//  Created by M on 2018/9/21.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "UploadHistoryViewController.h"
#import "UploadHistoryView.h"

@interface UploadHistoryViewController ()

@property (nonatomic, strong) UploadHistoryView *historyView;

@end

@implementation UploadHistoryViewController
@synthesize historyView;

- (void)viewDidLoad {

    [super viewDidLoad];
    [self setTitle:@"上传历史"];
    [self addNavRight];
 
    self.historyView.dataSources = @[@"", @"", @""];
}

- (void)addNavRight {
    
    [self addNavRightTitle:@"筛选" complete:^{
        
    }];
}

#pragma mark - lazy
- (UploadHistoryView *)historyView {
    
    if (!historyView) {
        
        historyView = [[UploadHistoryView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.navHeight)];
        [self.view addSubview:historyView];
    }
    
    return historyView;
}

@end
