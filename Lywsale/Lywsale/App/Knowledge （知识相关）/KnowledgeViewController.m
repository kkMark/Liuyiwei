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

@interface KnowledgeViewController ()

@property (nonatomic ,strong) KnowledgeView *knowledgeView;

@end

@implementation KnowledgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"知识";
    
    [self request];
    
    [self initUI];
    
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
    
}

@end
