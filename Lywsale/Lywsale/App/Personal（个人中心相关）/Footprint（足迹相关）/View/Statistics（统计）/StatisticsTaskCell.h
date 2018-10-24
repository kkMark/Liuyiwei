//
//  StatisticsTaskCell.h
//  Lywsale
//
//  Created by 黄锡凯 on 2018/10/23.
//  Copyright © 2018 黄锡凯. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    
    DongXiaoTask = 0,
    DailyTask,
    LearningTask,
    
} TaskType;

@interface StatisticsTaskCell : UITableViewCell

@property (nonatomic, assign) CGFloat cellHeight;

- (instancetype)initWithTask:(TaskType)type reuseIdentifier:(NSString *)reuseIdentifier;

@end
