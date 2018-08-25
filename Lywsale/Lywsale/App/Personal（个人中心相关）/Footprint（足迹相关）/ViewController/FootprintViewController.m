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
@property (nonatomic, strong) UIView *searchView;

@end

@implementation FootprintViewController
@synthesize searchView;
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
        self.searchView.hidden = index == 0 ? NO : YES;
        self.footprintView.y = index == 0 ? self.searchView.maxY : self.headerView.maxY;
        self.footprintView.height = ScreenHeight - self.footprintView.y - self.navHeight;
        self.footprintView.currentIndex = index;
        [self.footprintView setContentOffset:CGPointMake(0,0) animated:NO];
    }];
}


#pragma mark - lazy
- (UIView *)searchView {

    if (!searchView) {
        
        // 搜索
        searchView = [[UIView alloc] initWithFrame:CGRectMake(0, self.headerView.maxY, ScreenWidth, 45)];
        searchView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:searchView];
        
        // 底部线条
        UIView *bottomlineView = [[UILabel alloc] initWithFrame:CGRectMake(0, self.searchView.height - 0.3, ScreenWidth, 0.3)];
        bottomlineView.backgroundColor = kLineColor;
        [searchView addSubview:bottomlineView];
        
        float x = 20;
        float width = (ScreenWidth - 80) / 3;
        for (int i = 0; i < 2; i++) {
            
            // 文本框
            UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(x, 10, width, searchView.height - 20)];
            textField.font = [UIFont systemFontOfSize:14];
            textField.clearButtonMode = UITextFieldViewModeWhileEditing;
            textField.borderStyle = UITextBorderStyleRoundedRect;
            [searchView addSubview:textField];
            
            if (i == 0) {
                
                UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(textField.maxX + 10, 0, 20, searchView.height)];
                titleLabel.text = @"至";
                titleLabel.font = [UIFont systemFontOfSize:14];
                titleLabel.textColor = kMainTextColor;
                titleLabel.textAlignment = NSTextAlignmentCenter;
                [searchView addSubview:titleLabel];
                
                x = titleLabel.maxX + 10;
            }
            else x = textField.maxX + 20;
        }
        
        UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        searchBtn.backgroundColor = kMainColor;
        searchBtn.frame = CGRectMake(x, 10, 0, searchView.height - 20);
        searchBtn.width = searchView.width - x - 20;
        searchBtn.layer.cornerRadius = 5;
        searchBtn.layer.masksToBounds = YES;
        searchBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
        [searchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [searchView addSubview:searchBtn];
    }
    
    return searchView;
}


- (FootprintView *)footprintView {
    
    if (!footprintView) {
        
        footprintView = [[FootprintView alloc] initWithFrame:CGRectMake(0, self.searchView.maxY, ScreenWidth, ScreenHeight - self.navHeight - self.searchView.maxY) style:UITableViewStyleGrouped];
        [self.view addSubview:footprintView];
    }
    
    return footprintView;
}

@end
