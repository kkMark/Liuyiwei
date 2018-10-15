//
//  OrderManagementRequest.h
//  Lywsale
//
//  Created by 尚洋 on 2018/10/15.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BaseHttpRequest.h"

@interface OrderManagementRequest : BaseHttpRequest

- (void)GetOrderMainPageNumber:(NSInteger)pageNumber PageSize:(NSInteger)pageSize success:(RequestSuccess)success failure:(RequestFailure)failure;

@end
