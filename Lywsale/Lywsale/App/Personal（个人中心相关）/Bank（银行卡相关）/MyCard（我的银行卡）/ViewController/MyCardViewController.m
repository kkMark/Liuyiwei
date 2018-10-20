//
//  MyCardViewController.m
//  GanLuXiangBan
//
//  Created by M on 2018/5/2.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "MyCardViewController.h"
#import "MyCardView.h"

@interface MyCardViewController ()

@property (nonatomic, strong) MyCardView *myCardView;

@end

@implementation MyCardViewController
@synthesize myCardView;

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.title = @"我的银行卡";
    self.myCardView.dataSources = @[@"", @"", @""];
    
    [self setEditRightTitle];
}

- (void)setEditRightTitle {
    
    [self addNavRightTitle:@"编辑" complete:^{
        
    }];
}

#pragma mark - lazy
- (MyCardView *)myCardView {
    
    if (!myCardView) {
        
        myCardView = [[MyCardView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        myCardView.height = ScreenHeight - self.navHeight;
        [self.view addSubview:myCardView];
    }
    
    return myCardView;
}

@end
