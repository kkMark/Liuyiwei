//
//  EvaluationModel.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/6.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "BaseModel.h"

@interface EvaluationModel : BaseModel

/// 分数
@property (nonatomic, strong) NSString *avgScore;
/// 人数
@property (nonatomic, strong) NSString *evaluationCount;
/// 评论内容
@property (nonatomic, strong) NSString *content;
/// 创建时间
@property (nonatomic, strong) NSString *creationTime;
/// 评论者ID
@property (nonatomic, strong) NSString *evaluationUserId;
/// 评论者名称
@property (nonatomic, strong) NSString *evaluationUserName;
/// 评论者头像地址
@property (nonatomic, strong) NSString *headPortrait;
/// 评论ID
@property (nonatomic, strong) NSString *id;
/// 评论分数
@property (nonatomic, strong) NSString *score;
/// 是否匿名
@property (nonatomic, strong) NSString *unnamed;

@end
