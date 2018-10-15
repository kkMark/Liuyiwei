//
//  WorkRequest.h
//  Lywsale
//
//  Created by 尚洋 on 2018/10/15.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BaseHttpRequest.h"

@interface WorkRequest : BaseHttpRequest

- (void)GetChatRecordPageNumber:(NSInteger)pageNumber PageSize:(NSInteger)pageSize success:(RequestSuccess)success failure:(RequestFailure)failure;

@end
