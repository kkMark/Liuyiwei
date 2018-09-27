//
//  ActivityDetailsViewController.m
//  Lywsale
//
//  Created by M on 2018/9/19.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "ActivityDetailsViewController.h"
#import "ActivityDetailsView.h"

@interface ActivityDetailsViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) ActivityDetailsView *detailsView;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIScrollView *bgScrollView;

@end

@implementation ActivityDetailsViewController
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
    [[uploadBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
        if ([title isEqualToString:@"去上传凭证"]) {
         
            NSString *vcName = @"UploadCredentialsViewController";
            [self.navigationController pushViewController:[NSClassFromString(vcName) new] animated:YES];
        }
    }];
}

#pragma mark - lazy
- (ActivityDetailsView *)detailsView {
    
    if (!detailsView) {
        
        detailsView = [[ActivityDetailsView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, self.bgScrollView.height - 45)];
        [self.bgScrollView addSubview:detailsView];
    }
    
    return detailsView;
}

- (UIView *)headerView {
    
    if (!headerView) {
        
        NSArray *titles = @[@"任务详情", @"分发", @"执行情况"];
        
        headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 45)];
        headerView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:headerView];
        
        UIView *headerLine = [[UIView alloc] initWithFrame:CGRectMake(0, headerView.height - 2, 100, 2)];
        headerLine.backgroundColor = kMainColor;
        headerLine.centerX = ScreenWidth / titles.count / 2;
        [headerView addSubview:headerLine];
        
        for (int i = 0; i < titles.count; i++) {
            
            UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            titleBtn.tag = i + 10;
            titleBtn.selected = i == 0 ? YES : NO;
            titleBtn.frame = CGRectMake(ScreenWidth / titles.count * i, 0, ScreenWidth / titles.count, headerView.height);
            titleBtn.titleLabel.font = [UIFont systemFontOfSize:14];
            [titleBtn setTitle:titles[i] forState:UIControlStateNormal];
            [titleBtn setTitleColor:[UIColor colorWithHexString:@"0x999999"] forState:UIControlStateNormal];
            [titleBtn setTitleColor:kMainColor forState:UIControlStateSelected];
            [headerView addSubview:titleBtn];
            
            [[titleBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
                
                [UIView animateWithDuration:0.25 animations:^{
                    
                    for (int index = 0; index < titles.count; index++) {
                        
                        UIButton *tempBtn = [self.view viewWithTag:index + 10];
                        if (index == i) tempBtn.selected = YES;
                        else tempBtn.selected = NO;
                    }
                    
                    headerLine.centerX = titleBtn.centerX;
                }];
            }];
        }
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
        }
    }
    
    return bgScrollView;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    
}

@end
