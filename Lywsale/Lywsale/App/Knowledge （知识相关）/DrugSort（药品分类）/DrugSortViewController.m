//
//  DrugSortViewController.m
//  Lywsale
//
//  Created by 尚洋 on 2018/10/8.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "DrugSortViewController.h"
#import "DrugSortView.h"
@interface DrugSortViewController ()

@property (nonatomic ,strong) DrugSortView *drugSortView;

@property (nonatomic ,retain) NSMutableArray *dataArray;

@end

@implementation DrugSortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"药品分类";
    
    self.dataArray = [NSMutableArray array];
    
    [self.dataArray addObjectsFromArray:@[@"肿瘤科",@"肿瘤科",@"肿瘤科",@"肿瘤科"]];
    
    [self initUI];
    
}

-(void)initUI{
    
    self.drugSortView = [DrugSortView new];
    [self.view addSubview:self.drugSortView];
    
    self.drugSortView.sd_layout
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .topSpaceToView(self.view, 0)
    .bottomSpaceToView(self.view, 0);
    
    [self.drugSortView addTitleList:self.dataArray];
    
}

@end
