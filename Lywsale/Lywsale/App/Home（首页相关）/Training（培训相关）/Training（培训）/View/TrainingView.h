//
//  TrainingView.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/29.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrainingModel.h"

@interface TrainingView : UIView

/// 是否收藏
@property (nonatomic, copy) void (^collectionBlock)(BOOL isCollection);

/// 培训信息
@property (nonatomic, strong) TrainingModel *model;
/// 评论
@property (nonatomic, strong) NSArray *evaluations;

@end
