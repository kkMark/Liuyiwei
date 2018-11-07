//
//  LearningTaskViewModel.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/19.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "BaseHttpRequest.h"

typedef enum : NSUInteger {
    
    IN_PROGRESS = 0,
    ENDED,
    
} LearningTaskType;

@interface LearningTaskViewModel : BaseHttpRequest

/**
     获取学习任务
 
     @param page 页数
 */
- (void)getTask:(int)page type:(LearningTaskType)type success:(RequestSuccess)success failure:(RequestFailure)failure;


/**
     获取任务数量
 */
- (void)getCountWithSuccess:(RequestSuccess)success failure:(RequestFailure)failure;

@end
