//
//  KnowledgeRequest.h
//  Lywsale
//
//  Created by 尚洋 on 2018/9/25.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BaseHttpRequest.h"

@interface KnowledgeRequest : BaseHttpRequest

- (void)GetTrainCategoriesPageNumber:(NSInteger)pageNumber PageSize:(NSInteger)pageSize success:(RequestSuccess)success failure:(RequestFailure)failure;

@end
