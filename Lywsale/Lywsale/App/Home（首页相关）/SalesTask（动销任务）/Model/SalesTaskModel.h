//
//  SalesTaskModel.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/12.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "BaseModel.h"

@interface StrategiesModel :BaseModel

@property (nonatomic, copy) NSString *assigned;
@property (nonatomic, copy) NSString *reward;
@property (nonatomic, copy) NSString *rewardRuleDescription;
@property (nonatomic, copy) NSString *strategyName;
@property (nonatomic, copy) NSString *strategyType;

@end

@interface SalesTaskModel : BaseModel

/// 活动ID
@property (nonatomic, copy) NSString *id;
/// 活动名称
@property (nonatomic, copy) NSString *name;
/// 描述
@property (nonatomic, copy) NSString *description;
/// 动销产品ID
@property (nonatomic, copy) NSString *productId;
/// 产品名称
@property (nonatomic, copy) NSString *productName;
/// 产商ID
@property (nonatomic, copy) NSString *producerId;
/// 产商名称
@property (nonatomic, copy) NSString *producerName;
/// 活动开始时间
@property (nonatomic, copy) NSString *startDate;
/// 活动结束时间
@property (nonatomic, copy) NSString *endDate;
/// 内部（true）/平台（false）
@property (nonatomic, copy) NSString *internal;
/// 是否完成学习
@property (nonatomic, copy) NSString *studyFinished;
/// 是否通过考试
@property (nonatomic, copy) NSString *examPassed;
/// 培训任务ID
@property (nonatomic, copy) NSString *trainTaskId;
/// 动销执行方式
@property (nonatomic, strong) StrategiesModel *strategiesModel;

/// 执行方式
@property (nonatomic, copy) NSString *strategyType;
/// 执行方式名称
@property (nonatomic, copy) NSString *strategyName;
/// 奖励金额
@property (nonatomic, copy) NSString *reward;
/// 奖励规则描述
@property (nonatomic, copy) NSString *rewardRuleDescription;

@end
