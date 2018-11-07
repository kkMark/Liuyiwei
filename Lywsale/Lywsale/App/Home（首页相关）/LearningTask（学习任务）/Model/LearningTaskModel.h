//
//  LearningTaskModel.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/6.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "BaseModel.h"

@interface ExamTaskModel : BaseModel

/// 考试任务ID
@property (nonatomic, copy) NSString *id;
/// 试卷ID
@property (nonatomic, copy) NSString *examPaperId;
/// 试卷名称
@property (nonatomic, copy) NSString *examPaperName;
/// 题数
@property (nonatomic, copy) NSString *questionCount;
/// 及格分数
@property (nonatomic, copy) NSString *passingPercent;
/// 及格标准描述
@property (nonatomic, copy) NSString *passingDescriptoin;
/// 考试次数，0表示无限制
@property (nonatomic, copy) NSString *maxExamTimes;
/// 考试时长，时间单位分钟，0表示无限制
@property (nonatomic, copy) NSString *examDuration;

@end

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
/// 开始时间
@property (nonatomic, copy) NSString *startDate;
/// 结束时间
@property (nonatomic, copy) NSString *endDate;
/// 任务类型
@property (nonatomic, assign) int taskType;
/// 考试任务
@property (nonatomic, strong) ExamTaskModel *examTaskModel;

@end
