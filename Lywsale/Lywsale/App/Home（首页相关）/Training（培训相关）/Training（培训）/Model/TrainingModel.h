//
//  TrainingModel.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/6.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "BaseModel.h"

@interface TrainingModel : BaseModel

/// 培训课程ID
@property (nonatomic, strong) NSString *id;
/// 培训课程名称
@property (nonatomic, strong) NSString *name;
/// 描述
@property (nonatomic, strong) NSString *description;
/// 培训项目
@property (nonatomic, strong) NSString *items;
/// 是否已收藏
@property (nonatomic, strong) NSString *collected;
/// 收藏ID
@property (nonatomic, strong) NSString *collectionId;

@end
