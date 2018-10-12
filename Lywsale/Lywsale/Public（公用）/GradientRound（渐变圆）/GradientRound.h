//
//  GradientRound.h
//  Lywsale
//
//  Created by 尚洋 on 2018/10/12.
//  Copyright © 2018年 黄锡凯. All rights reserved.
//

#import "BaseView.h"

@interface GradientRound : BaseView

@property (nonatomic, strong)NSTimer *timer;

- (void)addCircleWithColor:(UIColor *)color;

- (void)deleteTimer;

//- (void)addLabelWithStr:(NSString *)str;
//跳到进度
- (void)animateToProgress:(CGFloat)progress;
//进度为0
- (void)animateToZero;

@end
