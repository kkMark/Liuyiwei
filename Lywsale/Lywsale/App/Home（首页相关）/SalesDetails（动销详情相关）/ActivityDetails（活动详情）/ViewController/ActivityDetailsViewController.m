//
//  ActivityDetailsViewController.m
//  Lywsale
//
//  Created by M on 2018/9/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "ActivityDetailsViewController.h"
#import "PublicHeaderView.h"
#import "ActivityDetailsView.h"
#import "SalesSendView.h"
#import "PerformView.h"

@interface ActivityDetailsViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) ActivityDetailsView *detailsView;
@property (nonatomic, strong) SalesSendView *salesSendView;
@property (nonatomic, strong) PublicHeaderView *headerView;
@property (nonatomic, strong) PerformView *performView;
@property (nonatomic, strong) UIScrollView *bgScrollView;

@end

@implementation ActivityDetailsViewController
@synthesize performView;
@synthesize salesSendView;
@synthesize detailsView;
@synthesize headerView;
@synthesize bgScrollView;

- (void)viewDidLoad {

    [super viewDidLoad];
    [self setTitle:@"活动详情"];
    [self addNavRight];
    [self uploadBtn];
}

- (void)addNavRight {
    
    if (![GetUserDefault(UserType) isEqualToString:@"1"]) {
        
        @weakify(self);
        [self addNavRightTitle:@"上传历史" complete:^{
            
            @strongify(self);
            NSString *vcName = @"UploadHistoryViewController";
            [self.navigationController pushViewController:[NSClassFromString(vcName) new] animated:YES];
        }];
    }
}

#pragma mark - UI
- (void)uploadBtn {
    
    UIButton *uploadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    uploadBtn.backgroundColor = kMainColor;
    uploadBtn.frame = CGRectMake(0, self.detailsView.maxY, ScreenWidth, 45);
    uploadBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [uploadBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.bgScrollView addSubview:uploadBtn];
    
    NSString *title = @"去上传凭证";
    if ([GetUserDefault(UserType) isEqualToString:@"1"]) {
        title = @"分发给店员";
    }
    
    [uploadBtn setTitle:title forState:UIControlStateNormal];
    [[uploadBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x)
    {
        if ([title isEqualToString:@"去上传凭证"]) {
         
            NSString *vcName = @"UploadCredentialsViewController";
            [self.navigationController pushViewController:[NSClassFromString(vcName) new] animated:YES];
        }
        else if ([title isEqualToString:@"分发给店员"]) {
            
            [self.bgScrollView setContentOffset:CGPointMake(ScreenWidth, 0) animated:YES];
        }
    }];
}

#pragma mark - lazy
- (PerformView *)performView {
    
    if (!performView) {
        
        performView = [[PerformView alloc] initWithFrame:CGRectMake(ScreenWidth * 2, 0, ScreenWidth, self.bgScrollView.height) style:UITableViewStyleGrouped];
        [self.bgScrollView addSubview:performView];
    }
    
    return performView;
}

- (SalesSendView *)salesSendView {
    
    if (!salesSendView) {
        
        salesSendView = [[SalesSendView alloc] initWithFrame:CGRectMake(ScreenWidth, 0, ScreenWidth, self.bgScrollView.height)];
        [self.bgScrollView addSubview:salesSendView];
    }
    
    return salesSendView;
}

- (ActivityDetailsView *)detailsView {
    
    if (!detailsView) {
        
        detailsView = [[ActivityDetailsView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, self.bgScrollView.height - 45)];
        [self.bgScrollView addSubview:detailsView];
    }
    
    return detailsView;
}

- (PublicHeaderView *)headerView {
    
    if (!headerView) {
        
        headerView = [[PublicHeaderView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 45)];
        headerView.titles = @[@"任务详情", @"分发", @"执行情况"];
        [self.view addSubview:headerView];
        
        @weakify(self);
        [headerView setSelectIndexBlock:^(NSInteger index) {
            
            @strongify(self);
            [self.bgScrollView setContentOffset:CGPointMake(ScreenWidth * index, 0) animated:YES];
        }];
    }
    
    return headerView;
}

- (UIScrollView *)bgScrollView {
    
    if (!bgScrollView) {
        
        bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.navHeight)];
        bgScrollView.pagingEnabled = YES;
        bgScrollView.delegate = self;
        [self.view addSubview:bgScrollView];
        
        if ([GetUserDefault(UserType) isEqualToString:@"1"]) {
            
            bgScrollView.y = self.headerView.height;
            bgScrollView.height -= self.headerView.height;
            bgScrollView.contentSize = CGSizeMake(ScreenWidth * 3, 0);
            
            self.salesSendView.dataSource = @[@"", @"", @"", @""];
            self.performView.dataSources = @[@"", @"", @"", @"", @""];
        }
    }
    
    return bgScrollView;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    NSLog(@"scrollViewDidEndDecelerating = %zd", index);
    
    self.headerView.index = index;
}

@end
