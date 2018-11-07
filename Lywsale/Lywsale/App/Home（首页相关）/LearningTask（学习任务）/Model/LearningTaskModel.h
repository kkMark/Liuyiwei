//
//  LearningTaskModel.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/6.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "BaseModel.h"

@interface LearningTaskModel : BaseModel

/// 培训任务ID
@property (nonatomic, copy) NSString *id;
/// 培训任务名称
@property (nonatomic, copy) NSString *name;
/// 描述
@property (nonatomic, copy) NSString *description;
/// 培训课程ID
@property (nonatomic, copy) NSString *trainId;
/// 培训课程名称
@property (nonatomic, copy) NSString *trainName;
/// 考试任务
@property (nonatomic, copy) NSString *examTask;
/// 开始时间
@property (nonatomic, copy) NSString *startDate;
/// 结束时间
@property (nonatomic, copy) NSString *endDate;

@property (nonatomic, assign) int taskType;

@end
