//
//  FootprintViewController.m
//  Lywsale
//
//  Created by M on 2018/8/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "FootprintViewController.h"
#import "FootprintHeaderView.h"
#import "FootprintView.h"

@interface FootprintViewController ()

@property (nonatomic, strong) FootprintView *footprintView;
@property (nonatomic, strong) FootprintHeaderView *headerView;

@end

@implementation FootprintViewController
@synthesize footprintView;

- (void)viewDidLoad {

    [super viewDidLoad];
    [self setupSubviews];
    
    self.footprintView.dataSources = @[@"", @"", @"", @"", @"", @""];
}   

- (void)setupSubviews {
    
    self.headerView = [[FootprintHeaderView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
    self.headerView.height = self.headerView.viewHeight;
    [self.view addSubview:self.headerView];
    
    @weakify(self);
    [self.headerView setSelectIndex:^(NSInteger index) {
        
        @strongify(self);
        self.footprintView.height = ScreenHeight - self.footprintView.y - self.navHeight;
        self.footprintView.currentIndex = index;
        [self.footprintView setContentOffset:CGPointMake(0,0) animated:NO];
    }];
}


#pragma mark - lazy
- (FootprintView *)footprintView {
    
    if (!footprintView) {
        
        footprintView = [[FootprintView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.navHeight) style:UITableViewStyleGrouped];
        [self.view addSubview:footprintView];
    }
    
    return footprintView;
}

@end
