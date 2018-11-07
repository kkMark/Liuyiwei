//
//  TrainingViewModel.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/6.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "BaseHttpRequest.h"
#import "LearningTaskModel.h"
#import "EvaluationModel.h"

@interface TrainingViewModel : BaseHttpRequest

/**
     获取培训信息

     @param idString ID
 */
- (void)getTrainsWithId:(NSString *)idString success:(RequestSuccess)success failure:(RequestFailure)failure;

/**
     收藏

     @param isCollection 是否收藏
 */
- (void)collectionWithIsCollection:(BOOL)isCollection idString:(NSString *)idString  success:(RequestSuccess)success failure:(RequestFailure)failure;

/**
     获取评论统计

     @param idString ID
 */
- (void)getEvaluationStatisticalWithId:(NSString *)idString success:(RequestSuccess)success failure:(RequestFailure)failure;

/**
     获取评价

     @param idString ID
     @param page     页数
 */
- (void)getEvaluationWithId:(NSString *)idString page:(int)page success:(RequestSuccess)success failure:(RequestFailure)failure;

/**
     提交评分

     @param model 模型
 */
- (void)submitEvaluationWithModel:(EvaluationModel *)model success:(RequestSuccess)success failure:(RequestFailure)failure;

@end
