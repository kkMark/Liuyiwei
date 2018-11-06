//
//  SalesTaskViewModel.h
//  Lywsale
//
//  Created by M on 2018/9/26.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BaseHttpRequest.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    
    PENDING = 0,
    FINISHED,
    EXPIRED,
    
} TaskType;

@interface SalesTaskViewModel : BaseHttpRequest

/**
     获取动销任务

     @param page 页数
 */
- (void)getSalesTask:(int)page type:(TaskType)type success:(RequestSuccess)success failure:(RequestFailure)failure;;

/**
     获取动销任务数量
 */
- (void)getCountWithSuccess:(RequestSuccess)success failure:(RequestFailure)failure;

@end

NS_ASSUME_NONNULL_END
