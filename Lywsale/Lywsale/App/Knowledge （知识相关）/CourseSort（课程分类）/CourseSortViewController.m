//
//  CourseSortViewController.m
//  Lywsale
//
//  Created by 尚洋 on 2018/9/29.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "CourseSortViewController.h"
#import "CourseSortView.h"

@interface CourseSortViewController ()

@property (nonatomic ,strong) CourseSortView *courseSortView;

@property (nonatomic ,retain) NSMutableArray *dataArray;

@end

@implementation CourseSortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"课程分类";
    
    self.dataArray = [NSMutableArray array];
    
    [self.dataArray addObjectsFromArray:@[
                                          @{@"专业技能":@[
                                                    @{@"image":@"",@"title":@"产品说明书"},
                                                    @{@"image":@"",@"title":@"产品说明书"},
                                                    @{@"image":@"",@"title":@"产品说明书"},
                                                    @{@"image":@"",@"title":@"产品说明书"},
                                                    @{@"image":@"",@"title":@"产品说明书"},
                                                    @{@"image":@"",@"title":@"产品说明书"}
                                                    ]},
                                          @{@"销售技能":@[
                                                    @{@"image":@"",@"title":@"产品说明书"},
                                                    @{@"image":@"",@"title":@"产品说明书"},
                                                    @{@"image":@"",@"title":@"产品说明书"},
                                                    @{@"image":@"",@"title":@"产品说明书"},
                                                    @{@"image":@"",@"title":@"产品说明书"},
                                                    @{@"image":@"",@"title":@"产品说明书"},
                                                    @{@"image":@"",@"title":@"产品说明书"},
                                                    @{@"image":@"",@"title":@"产品说明书"},
                                                    @{@"image":@"",@"title":@"产品说明书"}
                                                    ]},
                                          @{@"慢病管理":@[
                                                    @{@"image":@"",@"title":@"产品说明书"},
                                                    @{@"image":@"",@"title":@"产品说明书"},
                                                    @{@"image":@"",@"title":@"产品说明书"},
                                                    @{@"image":@"",@"title":@"产品说明书"},
                                                    @{@"image":@"",@"title":@"产品说明书"},
                                                    @{@"image":@"",@"title":@"产品说明书"}
                                                    ]}
                                          ]];
    
    [self request];
    
    [self initUI];
    
}

-(void)request{
    
}

-(void)initUI{
    
    self.courseSortView = [CourseSortView new];
    self.courseSortView.myTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.courseSortView];
    
    self.courseSortView.sd_layout
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .topSpaceToView(self.view, 0)
    .bottomSpaceToView(self.view, 0);
    
    [self.courseSortView addTitleList:self.dataArray];
    
}

@end
