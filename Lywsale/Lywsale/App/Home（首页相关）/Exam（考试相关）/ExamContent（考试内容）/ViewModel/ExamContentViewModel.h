//
//  ExamContentViewModel.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/7.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "BaseHttpRequest.h"
#import "ExamContentModel.h"

@interface ExamContentViewModel : BaseHttpRequest

/**
     提交试题
 */
- (void)submitExamWithModel:(ExamContentModel *)model success:(RequestSuccess)success failure:(RequestFailure)failure;

/**
     答题解析

     @param idString 试题ID
 */
- (void)examQuestionsWithIdString:(NSString *)idString success:(RequestSuccess)success failure:(RequestFailure)failure;

@end
