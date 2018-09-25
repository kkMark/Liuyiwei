//
//  KnowledgeRequest.m
//  Lywsale
//
//  Created by 尚洋 on 2018/9/25.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "KnowledgeRequest.h"

@implementation KnowledgeRequest

- (void)GetTrainCategoriesPageNumber:(NSInteger)pageNumber PageSize:(NSInteger)pageSize success:(RequestSuccess)success failure:(RequestFailure)failure{
    
    self.urlString = [NSString stringWithFormat:@"http://39.108.140.12:18082/trainCategories$top?pageNumber=%ld&pageSize=%ld",pageNumber,pageSize];
    [self requestAFMode:GetMode success:success failure:failure];
    
}

@end
