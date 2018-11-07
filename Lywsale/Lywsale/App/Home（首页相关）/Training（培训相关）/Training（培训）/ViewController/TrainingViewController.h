//
//  TrainingViewController.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/29.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "BaseViewController.h"
#import "LearningTaskModel.h"
#import "EvaluationModel.h"
#import "TrainingViewModel.h"

@interface TrainingViewController : BaseViewController

/// 视频ID
@property (nonatomic, copy) NSString *idString;
/// 是否收藏进来的
@property (nonatomic, assign) BOOL isCollection;
/// 学习模型
@property (nonatomic, strong) LearningTaskModel *model;

/// 提交评分
- (void)submitEvaluation:(EvaluationModel *)model;

@end
