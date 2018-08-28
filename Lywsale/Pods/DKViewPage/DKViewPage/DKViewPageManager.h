//
//  DKViewPageManager.h
//  DKViewPage
//
//  Created by 庄槟豪 on 2016/11/8.
//  Copyright © 2016年 cn.dankal. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DKViewPageShareManager [DKViewPageManager sharedInstance]

#define KAddObserver(keyPath) [DKViewPageShareManager addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:nil];
#define KRemoveObserver(keyPath) [DKViewPageShareManager removeObserver:self forKeyPath:keyPath];

@interface DKViewPageManager : NSObject

/** viewPage的frame */
@property (nonatomic, assign) CGRect viewPageFrame;

/** 标题栏的frame */
@property (nonatomic, assign) CGRect titleViewFrame;

/** 所有控制器view的frame */
@property (nonatomic, assign) CGRect controllerViewFrame;

/** 标题栏字体 */
@property (nonatomic, weak) UIFont *titleFont;

/** 标题栏字体普通状态颜色 */
@property (nonatomic, weak) UIColor *titleNormalColor;

/** 标题栏字体选中状态颜色 */
@property (nonatomic, weak) UIColor *titleSelectedColor;

/** 标题栏背景颜色 */
@property (nonatomic, weak) UIColor *titleViewBackgroundColor;

/** 标题栏底部指示器颜色 */
@property (nonatomic, weak) UIColor *indicatorColor;

/** 标题栏底部指示器高度 */
@property (nonatomic, assign) CGFloat indicatorHeight;

+ (instancetype)sharedInstance;

@end
