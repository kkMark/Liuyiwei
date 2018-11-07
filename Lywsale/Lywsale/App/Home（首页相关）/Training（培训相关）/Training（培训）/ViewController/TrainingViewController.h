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

@property (nonatomic, copy) NSString *idString;
@property (nonatomic, assign) BOOL isCollection;
@property (nonatomic, strong) LearningTaskModel *model;

/// 提交评分
- (void)submitEvaluation:(EvaluationModel *)model;

@end
