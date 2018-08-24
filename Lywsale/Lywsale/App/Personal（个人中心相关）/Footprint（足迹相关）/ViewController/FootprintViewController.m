//
//  FootprintViewController.m
//  Lywsale
//
//  Created by M on 2018/8/22.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "FootprintViewController.h"
#import "FootprintHeaderView.h"

@interface FootprintViewController ()

@property (nonatomic, strong) FootprintHeaderView *headerView;

@end

@implementation FootprintViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    [self setupSubviews];
}   

- (void)setupSubviews {
    
    FootprintHeaderView *footprintHeaderView = [[FootprintHeaderView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
    footprintHeaderView.height = footprintHeaderView.viewHeight;
    [self.view addSubview:footprintHeaderView];
    
    [footprintHeaderView setSelectIndex:^(NSInteger index) {
        NSLog(@"%ld", (long)index);
    }];
}

@end
