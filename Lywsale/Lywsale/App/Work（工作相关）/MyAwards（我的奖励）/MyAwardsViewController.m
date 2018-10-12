//
//  MyAwardsViewController.m
//  Lywsale
//
//  Created by 尚洋 on 2018/10/12.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "MyAwardsViewController.h"
#import "MyAwardsView.h"

@interface MyAwardsViewController ()

@property (nonatomic ,strong) MyAwardsView *myAwardsView;

@property (nonatomic ,retain) NSMutableArray *dataArray;

@end

@implementation MyAwardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的奖励";
    
    self.dataArray = [NSMutableArray array];
    
    [self.dataArray addObjectsFromArray:@[@{@"2018 - 07":@[
                                                    @{@"image":@"",@"title":@"博路定用药培训"},
                                                    @{@"image":@"",@"title":@"博路定用药培训"},
                                                    @{@"image":@"",@"title":@"博路定用药培训"},
                                                    @{@"image":@"",@"title":@"博路定用药培训"}
                                                    ]},
                                          @{@"2018 - 06":@[
                                                    @{@"image":@"",@"title":@"博路定用药培训"},
                                                    @{@"image":@"",@"title":@"博路定用药培训"},
                                                    @{@"image":@"",@"title":@"博路定用药培训"},
                                                    @{@"image":@"",@"title":@"博路定用药培训"}
                                                    ]}]];
    
    [self initUI];
    
    [self block];
    
}

-(void)initUI{
    
    self.myAwardsView = [MyAwardsView new];
    [self.view addSubview:self.myAwardsView];
    
    self.myAwardsView.sd_layout
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .topSpaceToView(self.view, 0)
    .bottomSpaceToView(self.view, 0);
    
    [self.myAwardsView addTitleList:self.dataArray];
    
}

-(void)block{
    
}

@end
