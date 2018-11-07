//
//  FootprintViewController.m
//  Lywsale
//
//  Created by M on 2018/8/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "FootprintViewController.h"
#import "FootprintView.h"
#import "PublicHeaderView.h"
#import "FootprintViewModel.h"

@interface FootprintViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) FootprintView *footprintView;
@property (nonatomic, strong) PublicHeaderView *headerView;
@property (nonatomic, assign) int page;

@end

@implementation FootprintViewController
@synthesize footprintView;
@synthesize headerView;

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.footprintView.dataSources = @[@""];
}

#pragma mark - lazy
- (PublicHeaderView *)headerView {
    
    if (!headerView) {
        
        headerView = [[PublicHeaderView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 45)];
        headerView.titles = @[@"任务统计", @"我的学习", @"我的收藏"];
        [self.view addSubview:headerView];
        
        @weakify(self);
        [headerView setSelectIndexBlock:^(NSInteger index) {
            
            @strongify(self);
            if (index == 0) {
                
            }
            else if (index == 1) {
                [self getLearing];
            }
            else {
                [self getCollection];
            }
            
            self.footprintView.currentIndex = index;
        }];
    }
    
    return headerView;
}

- (FootprintView *)footprintView {
    
    if (!footprintView) {
        
        footprintView = [[FootprintView alloc] initWithFrame:CGRectMake(0, self.headerView.height, ScreenWidth, ScreenHeight - self.navHeight - self.headerView.height) style:UITableViewStyleGrouped];
        [self.view addSubview:footprintView];
    }
    
    return footprintView;
}


#pragma mark - request
- (void)getCollection {
    
    [[FootprintViewModel new] getCollectionWithPage:self.page success:^(NSDictionary *dict) {
        
        
        
    } failure:^(NSError *error) {
        
        
    }];
}

- (void)getLearing {
    
    [[FootprintViewModel new] getLerrningWithPage:self.page success:^(NSDictionary *dict) {
        
        
        
    } failure:^(NSError *error) {
    
    }];
}

@end
