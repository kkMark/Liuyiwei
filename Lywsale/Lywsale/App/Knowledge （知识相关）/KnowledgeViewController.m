//
//  KnowledgeViewController.m
//  Lywsale
//
//  Created by 尚洋 on 2018/9/13.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "KnowledgeViewController.h"
#import "KnowledgeRequest.h"
#import "KnowledgeView.h"
#import "CourseSortViewController.h"
#import "DrugSortViewController.h"
#import "DrugTabooViewController.h"

@interface KnowledgeViewController ()

@property (nonatomic ,strong) KnowledgeView *knowledgeView;

@property (nonatomic ,retain) NSMutableArray *dataArray;

@end

@implementation KnowledgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"知识";
    
    self.dataArray = [NSMutableArray array];
    
    [self.dataArray addObjectsFromArray:@[@{@"精品推荐":@[
                                                          @{@"image":@"",@"title":@"博路定用药培训"},
                                                          @{@"image":@"",@"title":@"博路定用药培训"},
                                                          @{@"image":@"",@"title":@"博路定用药培训"},
                                                          @{@"image":@"",@"title":@"博路定用药培训"}
                                                      ]},
                                                          @{@"培训课程":@[
                                                                @{@"image":@"",@"title":@"博路定用药培训"},
                                                                @{@"image":@"",@"title":@"博路定用药培训"},
                                                                @{@"image":@"",@"title":@"博路定用药培训"},
                                                                @{@"image":@"",@"title":@"博路定用药培训"}
                                                                    ]}]];
    
    [self initUI];
    
    [self block];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self request];
    
}

-(void)request{

    [[KnowledgeRequest new] GetTrainCategoriesPageNumber:1 PageSize:10 success:^(NSDictionary *dict) {
        
    } failure:^(NSError *error) {
        
    }];
    
}

-(void)initUI{
    
    self.knowledgeView = [KnowledgeView new];
    [self.view addSubview:self.knowledgeView];
    
    self.knowledgeView.sd_layout
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .topSpaceToView(self.view, 0)
    .bottomSpaceToView(self.view, 0);
    
    [self.knowledgeView addTitleList:self.dataArray];
    
}

-(void)block{
    
    WS(weakSelf);
    
    self.knowledgeView.pushBlock = ^(NSString *pushString) {
        
        if ([pushString isEqualToString:@"课程分类"]) {
            
            CourseSortViewController *VC = [[CourseSortViewController alloc] init];
            VC.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:VC animated:YES];
            
        }
        if ([pushString isEqualToString:@"药品分类"]) {
            
            DrugSortViewController *VC = [[DrugSortViewController alloc] init];
            VC.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:VC animated:YES];
            
        }
        if ([pushString isEqualToString:@"药品禁忌"]) {
         
            DrugTabooViewController *VC = [[DrugTabooViewController alloc] init];
            VC.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:VC animated:YES];
            
        }
        
    };
    
}

@end
