//
//  MyCardViewController.m
//  GanLuXiangBan
//
//  Created by M on 2018/5/2.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "MyCardViewController.h"

@interface MyCardViewController ()


@end

@implementation MyCardViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.title = @"我的银行卡";
    
    [self setEditRightTitle];
}

- (void)setEditRightTitle {
    
    [self addNavRightTitle:@"编辑" complete:^{
        
    }];
}

@end
