//
//  FeedbackViewController.m
//  Lywsale
//
//  Created by M on 2018/8/23.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "FeedbackViewController.h"
#import "FeedbackView.h"

@interface FeedbackViewController ()

@property (nonatomic, strong) FeedbackView *feedbackView;

@end

@implementation FeedbackViewController
@synthesize feedbackView;

- (void)viewDidLoad {

    [super viewDidLoad];

    self.title = @"我要反馈";
    self.feedbackView.dataSources = @[@"问题类型"];
}

#pragma mark - lazy
- (FeedbackView *)feedbackView {
    
    if (!feedbackView) {
        
        feedbackView = [[FeedbackView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
        [self.view addSubview:feedbackView];
    }
    
    return feedbackView;
}

@end
