//
//  DailyTaskViewModel.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/19.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "BaseHttpRequest.h"

@interface DailyTaskViewModel : BaseHttpRequest

/**
     获取动销任务
 
     @param page 页数
     @param type 类型 1、待处理 2、已处理
 */
- (void)getDailyTask:(int)page type:(NSString *)type success:(RequestSuccess)success failure:(RequestFailure)failure;

@end
