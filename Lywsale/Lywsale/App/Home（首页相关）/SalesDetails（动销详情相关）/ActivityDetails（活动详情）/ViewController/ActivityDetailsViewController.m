//
//  ActivityDetailsViewController.m
//  Lywsale
//
//  Created by M on 2018/9/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "ActivityDetailsViewController.h"
#import "ActivityDetailsView.h"

@interface ActivityDetailsViewController ()

@property (nonatomic, strong) ActivityDetailsView *detailsView;

@end

@implementation ActivityDetailsViewController
@synthesize detailsView;

- (void)viewDidLoad {

    [super viewDidLoad];
    [self setTitle:@"活动详情"];
    [self addNavRight];
    [self uploadBtn];
}

- (void)addNavRight {
    
    [self addNavRightTitle:@"上传历史" complete:^{
        
    }];
}

- (void)uploadBtn {
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.backgroundColor = kMainColor;
    nextBtn.frame = CGRectMake(0, self.detailsView.maxY, ScreenWidth, 45);
    nextBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [nextBtn setTitle:@"去上传凭证" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:nextBtn];
}

#pragma mark - lazy
- (ActivityDetailsView *)detailsView {
    
    if (!detailsView) {
        
        detailsView = [[ActivityDetailsView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.navHeight - 45)];
        [self.view addSubview:detailsView];
    }
    
    return detailsView;
}

@end
