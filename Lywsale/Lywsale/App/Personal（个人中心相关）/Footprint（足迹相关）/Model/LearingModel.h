//
//  LearingModel.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/11/6.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import "BaseModel.h"

@interface LearingModel : BaseModel

/// 图片链接
@property (nonatomic, strong) NSString *briefPicture;
@property (nonatomic, strong) NSString *browsingTimes;
@property (nonatomic, strong) NSString *examNeeded;
@property (nonatomic, strong) NSString *examPassed;
@property (nonatomic, strong) NSString *scorePercent;
@property (nonatomic, strong) NSString *studyFinished;
@property (nonatomic, strong) NSString *trainId;
/// 名字
@property (nonatomic, strong) NSString *trainName;
@property (nonatomic, strong) NSString *trainTaskId;
@property (nonatomic, strong) NSString *trainTaskName;
@property (nonatomic, strong) NSString *trainUpdateTime;
@property (nonatomic, strong) NSString *traineeId;
@property (nonatomic, strong) NSString *traineeName;

@end
