//
//  ExamHomeModel.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/7.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "BaseModel.h"

@interface ExamHomeModel : BaseModel

/// 试卷ID
@property (nonatomic, strong) NSString *id;
/// 试卷名称
@property (nonatomic, strong) NSString *name;
/// 描述
@property (nonatomic, strong) NSString *description;
/// 试题数
@property (nonatomic, strong) NSString *questionCount;
/// 试题
@property (nonatomic, strong) NSArray *questions;

@end

@interface QuestionModel : BaseModel

/// 试卷ID
@property (nonatomic, strong) NSString *id;
/// 题目
@property (nonatomic, strong) NSString *question;
/// 选项
@property (nonatomic, strong) NSArray *options;
/// 试题类型['SINGLE_SELECTION', 'MULTIPLE_SELECTION', 'JUDGMENT']
@property (nonatomic, strong) NSString *questionType;

@end

@interface OptionModel : BaseModel

/// 选项
@property (nonatomic, strong) NSString *key;
/// 选项值
@property (nonatomic, strong) NSString *value;

@end
