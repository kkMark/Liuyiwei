//
//  KnowledgeViewController.m
//  Lywsale
//
//  Created by 尚洋 on 2018/9/13.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "KnowledgeViewController.h"
#import "KnowledgeRequest.h"

@interface KnowledgeViewController ()

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
    
    
    
}

@end
