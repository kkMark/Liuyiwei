//
//  LearningTaskViewModel.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/19.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "BaseHttpRequest.h"

@interface LearningTaskViewModel : BaseHttpRequest


/**
     获取动销任务
 
     @param page 页数
 */
- (void)getTask:(int)page success:(RequestSuccess)success failure:(RequestFailure)failure;


@end
